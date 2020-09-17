//
//  AdMobBridge.mm
//  AdMob_Extension
//
//  Created by Josep Gonzalez Fernandez on 14/3/17.
//  Copyright © 2017 Dreams Corner. All rights reserved.
//

#import "AdMobBridge.h"
#include <asl.h>
#include <stdio.h>
#import "Reachability.h"

@implementation AdMobBridge

const int EVENT_OTHER_SOCIAL = 70;
extern UIView *g_glView;

extern "C" NSString* findOption( const char* _key );
extern bool F_DsMapAdd_Internal(int _index, char* _pKey, double _value);
extern bool F_DsMapAdd_Internal(int _index, char* _pKey, char* _pValue);
extern int CreateDsMap( int _num, ... );
extern void CreateAsynEventWithDSMap(int dsmapindex, int event_index);

double bannerDesignedForFamilies;
double bannerChildOriented;
double interstitialDesignedForFamilies;
double interstitialChildOriented;
double videoDesignedForFamilies;
double videoChildOriented;

NSMutableArray *testDevices = [[NSMutableArray alloc] init];

typedef NS_ENUM(NSUInteger, DelegateType) {
    GADDidDisplayInterstitial = 601,
    GADDidCacheInterstitial = 602,
    GADDidFailToLoadInterstitial = 603,
    GADDidFailToPresentInterstitial = 604,
    GADDidCloseInterstitial = 605,
    GADDidClickInterstitial = 606,
    GADDidFailToLoadBanner = 607,
    GADDidCacheBanner = 608,
    GADDidDisplayBanner = 609,
    GADDidClickBanner = 610,
    GADDidDismissBanner = 611,
    GADDidRemoveBanner = 612,
    GADDidDisplayVideo = 613,
    GADDidCacheVideo = 614,
    GADDidFailToLoadVideo = 615,
    GADDidEndVideo = 616,
    GADDidClickVideo = 617,
    GADDidOpenVideo = 618,
    GADDidRewardUserWithReward = 619,
    GADDidFailToConnect = 621
};

- (GADAdSize) getSizeForBanner:(double)height {
    switch (int(height)) {
        case 2:
            return kGADAdSizeLargeBanner;
        case 3:
            return kGADAdSizeMediumRectangle;
        case 4:
            return kGADAdSizeFullBanner;
        case 5:
            return kGADAdSizeLeaderboard;
        case 6:
            return kGADAdSizeSmartBannerPortrait;
        case 7:
            return kGADAdSizeSmartBannerLandscape;
        default:
            return kGADAdSizeBanner;
    }
}

- (int) getErrorTranslated:(NSInteger)error {
    switch (error) {
        case kGADErrorNoFill:
            return 1001;
        case kGADErrorServerError:
            return 2000;
        case kGADErrorInvalidRequest:
            return 1002;
        default:
            return 2001;
    }
}

// MARK: Helper Methods

- (NSString *) charToNSString:(char *)text {
    return [NSString stringWithFormat:@"%s", text];
}

- (char *) charFromNSString:(NSString *)text {
    return (char *)[text UTF8String];
}

- (BOOL)isNetworkAvailable {
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];

    NetworkStatus status = [reachability currentReachabilityStatus];

    if (status == ReachableViaWiFi) {
        return YES;
    } else if (status == ReachableViaWWAN) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)checkInternetConnection:(NSUInteger)event {
    if (![self isNetworkAvailable]) {
        int dsMapIndex = CreateDsMap( 0 );
        F_DsMapAdd_Internal(dsMapIndex, (char *)"type", event);
        //F_DsMapAdd_Internal(dsMapIndex, (char *)"location", [self getLocationDoubleConstant:location]);
        //F_DsMapAdd_Internal(dsMapIndex, (char *)"error", CBLoadErrorNetworkFailure);
        CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
        return false;
    }
    return true;
}

- (UIViewController *) getRootViewController {
    return [UIApplication sharedApplication].keyWindow.rootViewController;
}

// MARK: GameMaker Methods

- (void) setTestDeviceIds:(char *)testDeviceIds {
    NSLog(@"AdMob setTestDevicesIds");
    NSArray *testDevicesArr = [[self charToNSString:testDeviceIds] componentsSeparatedByString:@","];
    for (NSString *testDeviceId in testDevicesArr) {
        if (![testDevices containsObject:testDeviceId]) {
            [testDevices addObject:testDeviceId];
        }
    }
}

- (void) initInterstitial:(char *)placement {
    NSLog(@"AdMob initInterstitial");
    self.interstitialId = [self charToNSString:placement];
    interstitialDesignedForFamilies = 0;
    interstitialChildOriented = 0;
    [self initInterstitial];
}

- (void) initInterstitialForDesignedForFamiliesProgram:(char *)placement {
    NSLog(@"AdMob initInterstitialForDesignedForFamiliesProgram");
    self.interstitialId = [self charToNSString:placement];
    interstitialDesignedForFamilies = 1;
    interstitialChildOriented = 0;
    [self initInterstitial];
}

- (void) initInterstitialForChildOriented:(char *)placement {
    NSLog(@"AdMob initInterstitialForChildOriented");
    self.interstitialId = [self charToNSString:placement];
    interstitialDesignedForFamilies = 0;
    interstitialChildOriented = 1;
    [self initInterstitial];
}

- (void) initInterstitial {
    [self checkInternetConnection:GADDidFailToConnect];
    self.interstitialAd = [self createAndLoadInterstitial:[self charFromNSString:self.interstitialId]];
}

- (GADInterstitial *)createAndLoadInterstitial:(char *)placement {
    GADInterstitial *interstitial = [[GADInterstitial alloc] initWithAdUnitID:[self charToNSString:placement]];
    GADRequest *request = [GADRequest request];
    if (testDevices != nil) {
        request.testDevices = testDevices;
    }
    [request tagForChildDirectedTreatment:interstitialDesignedForFamilies == 1 || interstitialChildOriented == 1 ? YES : NO];
    [interstitial loadRequest:request];
    interstitial.delegate = self;
    return interstitial;
}

- (void) showInterstitial {
    NSLog(@"Firebase AdMob Show Interstitial");
    if ([self checkInternetConnection:GADDidFailToConnect]) {
        [self.interstitialAd presentFromRootViewController:[self getRootViewController]];
    }
}

- (void) initBanner:(char *)placement withHeight:(double)height {
    NSLog(@"Firebase AdMob Init Banner With Placement And Height");
    self.bannerId = [self charToNSString:placement];
    bannerDesignedForFamilies = 0;
    bannerChildOriented = 0;
    [self initBannerWithHeight:height];
}

- (void) initBannerForDesignedForFamiliesProgram:(char *)placement withHeight:(double)height {
    NSLog(@"Firebase AdMob Init Banner For Designed For Families Program");
    self.bannerId = [self charToNSString:placement];
    bannerDesignedForFamilies = 1;
    bannerChildOriented = 0;
    [self initBannerWithHeight:height];
}

- (void) initBannerForChildOriented:(char *)placement withHeight:(double)height {
    NSLog(@"Firebase AdMob Init Banner For Child Oriented");
    self.bannerId = [self charToNSString:placement];
    bannerDesignedForFamilies = 0;
    bannerChildOriented = 1;
    [self initBannerWithHeight:height];
}

- (void) initBannerWithHeight:(double)height {
    NSLog(@"Firebase AdMob Init Banner With Height");
    [self checkInternetConnection:GADDidFailToConnect];
    self.bannerAd = [[GADBannerView alloc] initWithAdSize:[self getSizeForBanner:height]];
    self.bannerAd.adUnitID = self.bannerId;
    self.bannerAd.rootViewController = [self getRootViewController];
    self.bannerAd.delegate = self;
    GADRequest *request = [GADRequest request];
    if (testDevices != nil) {
        request.testDevices = testDevices;
    }
    [request tagForChildDirectedTreatment:bannerDesignedForFamilies == 1 || bannerChildOriented == 1 ? YES : NO];
    [self.bannerAd loadRequest:request];
}

- (void) showBannerAtTop {
    NSLog(@"Firebase AdMob Show Banner At Top");
    if ([self checkInternetConnection:GADDidFailToConnect]) {
        self.bannerAd.frame = CGRectMake(0, 0, self.bannerAd.bounds.size.width, self.bannerAd.bounds.size.height);
        [self.bannerAd removeFromSuperview];
        [[self getRootViewController].view addSubview:self.bannerAd];
    }
}

- (void) showBannerAtTopUnderStatusBar {
    NSLog(@"Firebase AdMob Show Banner At Top Under Status Bar");
    if ([self checkInternetConnection:GADDidFailToConnect]) {
        self.bannerAd.frame = CGRectMake(0, 20, self.bannerAd.bounds.size.width, self.bannerAd.bounds.size.height);
        [self.bannerAd removeFromSuperview];
        [[self getRootViewController].view addSubview:self.bannerAd];
    }
}

- (void) showBannerAtBottom {
    NSLog(@"Firebase AdMob Show Banner At Bottom");
    if ([self checkInternetConnection:GADDidFailToConnect]) {
        CGFloat heightScreen = [self getRootViewController].view.bounds.size.height - self.bannerAd.bounds.size.height;
        self.bannerAd.frame = CGRectMake(0, heightScreen, self.bannerAd.bounds.size.width, self.bannerAd.bounds.size.height);
        [self.bannerAd removeFromSuperview];
        [[self getRootViewController].view addSubview:self.bannerAd];
    }
}

- (void) removeBanner {
    NSLog(@"Firebase AdMob Remove Banner");
    [self.bannerAd removeFromSuperview];
    int dsMapIndex = CreateDsMap( 0 );
    F_DsMapAdd_Internal(dsMapIndex, (char *)"type", GADDidRemoveBanner);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

- (void) initVideo:(char *)placement {
    NSLog(@"Firebase AdMob Init Video Reward");
    self.videoId = [self charToNSString:placement];
    videoDesignedForFamilies = 0;
    videoChildOriented = 0;
    [self requestRewardedVideo:placement];
}

- (void) initVideoForDesignedForFamiliesProgram:(char *)placement {
    NSLog(@"Firebase AdMob Init Video Reward For Designed For Families Program");
    self.videoId = [self charToNSString:placement];
    videoDesignedForFamilies = 1;
    videoChildOriented = 0;
    [self requestRewardedVideo:placement];
}

- (void) initVideoForChildOriented:(char *)placement {
    NSLog(@"Firebase AdMob Init Video Reward For Child Oriented");
    self.videoId = [self charToNSString:placement];
    videoDesignedForFamilies = 0;
    videoChildOriented = 1;
    [self requestRewardedVideo:placement];
}

- (void)requestRewardedVideo:(char *)placement {
    [self checkInternetConnection:GADDidFailToConnect];
    [GADRewardBasedVideoAd sharedInstance].delegate = self;
    GADRequest *request = [GADRequest request];
    if (testDevices != nil) {
        request.testDevices = testDevices;
    }
    [request tagForChildDirectedTreatment:videoDesignedForFamilies == 1 || videoChildOriented == 1 ? YES : NO];
    [[GADRewardBasedVideoAd sharedInstance] loadRequest:[GADRequest request] withAdUnitID:[self charToNSString:placement]];
}

- (void) showVideo {
    NSLog(@"Firebase AdMob Show Video Reward");
    if ([self checkInternetConnection:GADDidFailToConnect]) {
        if ([[GADRewardBasedVideoAd sharedInstance] isReady]) {
            [[GADRewardBasedVideoAd sharedInstance] presentFromRootViewController:[self getRootViewController]];
        }
    }
}

- (void) setApplicationMuted:(double)muted {
    NSLog(@"Firebase AdMob Application %@", muted == 0 ? @"Unmuted" : @"Muted");
    [GADMobileAds sharedInstance].applicationMuted = muted == 0 ? NO : YES;
}

- (void) setApplicationVolume:(double)volume {
    NSLog(@"Firebase AdMob Application %f", volume*0.01f);
    [GADMobileAds sharedInstance].applicationVolume = volume*0.01f;
}

- (char *) getVersion {
    return [self charFromNSString:[GADRequest sdkVersion]];
}

- (double) hasInternetConnection {
    return [self isNetworkAvailable] ? 1 : 0;
}

// MARK: AbMob Methods

// MARK: Interstitial Ads Delegate

- (void)interstitialDidReceiveAd:(GADInterstitial *)ad {
    int dsMapIndex = CreateDsMap( 0 );
    F_DsMapAdd_Internal(dsMapIndex, (char *)"type", GADDidCacheInterstitial);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

- (void)interstitial:(GADInterstitial *)ad didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"Ad failed to load");
    int dsMapIndex = CreateDsMap( 0 );
    F_DsMapAdd_Internal(dsMapIndex, (char *)"type", GADDidFailToLoadInterstitial);
    F_DsMapAdd_Internal(dsMapIndex, (char *)"error", [self getErrorTranslated:error.code]);
    F_DsMapAdd_Internal(dsMapIndex, (char *)"description", [self charFromNSString:error.localizedDescription]);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

- (void)interstitialDidDismissScreen:(GADInterstitial *)ad {
    NSLog(@"Interstitial has been closed");
    // Consider to add code here to resume your app's flow
    int dsMapIndex = CreateDsMap( 0 );
    F_DsMapAdd_Internal(dsMapIndex, (char *)"type", GADDidCloseInterstitial);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
    char *placement = [self charFromNSString:self.interstitialId];
    self.interstitialAd = [self createAndLoadInterstitial:placement];
}

- (void)interstitialWillPresentScreen:(GADInterstitial *)ad {
    NSLog(@"The user sees the add");
    // Use this function as indication for a user's impression on the ad.
    int dsMapIndex = CreateDsMap( 0 );
    F_DsMapAdd_Internal(dsMapIndex, (char *)"type", GADDidDisplayInterstitial);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

- (void)interstitialWillLeaveApplication:(GADInterstitial *)ad {
    NSLog(@"The user clicked on the ad and will be taken to its destination");
    // Use this function as indication for a user's click on the ad.
    int dsMapIndex = CreateDsMap( 0 );
    F_DsMapAdd_Internal(dsMapIndex, (char *)"type", GADDidClickInterstitial);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

- (void)interstitialDidFailToPresentScreen:(GADInterstitial *)ad {
    NSLog(@"Ad failed to load");
    int dsMapIndex = CreateDsMap( 0 );
    F_DsMapAdd_Internal(dsMapIndex, (char *)"type", GADDidFailToPresentInterstitial);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

// MARK: Banner Ads Delegate

- (void)adViewDidReceiveAd:(GADBannerView *)bannerView {
    NSLog(@"Ad was loaded and ready to be displayed");
    int dsMapIndex = CreateDsMap( 0 );
    F_DsMapAdd_Internal(dsMapIndex, (char *)"type", GADDidCacheBanner);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

- (void)adView:(GADBannerView *)bannerView didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"Ad failed to present");
    int dsMapIndex = CreateDsMap( 0 );
    F_DsMapAdd_Internal(dsMapIndex, (char *)"type", GADDidFailToLoadBanner);
    [self.bannerAd removeFromSuperview];
    self.bannerAd = nil;
    F_DsMapAdd_Internal(dsMapIndex, (char *)"error", [self getErrorTranslated:error.code]);
    F_DsMapAdd_Internal(dsMapIndex, (char *)"description", [self charFromNSString:error.localizedDescription]);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

- (void)adViewWillPresentScreen:(GADBannerView *)bannerView {
    NSLog(@"Banner ad impression is being captured.");
    int dsMapIndex = CreateDsMap( 0 );
    F_DsMapAdd_Internal(dsMapIndex, (char *)"type", GADDidDisplayBanner);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

- (void)adViewWillLeaveApplication:(GADBannerView *)bannerView {
    NSLog(@"Banner ad was clicked.");
    int dsMapIndex = CreateDsMap( 0 );
    F_DsMapAdd_Internal(dsMapIndex, (char *)"type", GADDidClickBanner);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

- (void)adViewDidDismissScreen:(GADBannerView *)bannerView {
    NSLog(@"Banner ad did dismiss from screen.");
    int dsMapIndex = CreateDsMap( 0 );
    F_DsMapAdd_Internal(dsMapIndex, (char *)"type", GADDidDismissBanner);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

// MARK: In-Stream Video Ads Delegate

- (void)rewardBasedVideoAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd didRewardUserWithReward:(GADAdReward *)reward {
    int rewarded = 1;
    int rewardAmount = [reward.amount intValue];
    NSString *rewardCurrency = reward.type;

    int dsMapIndex = CreateDsMap( 0 );
    F_DsMapAdd_Internal(dsMapIndex, (char *)"type", GADDidRewardUserWithReward);
    F_DsMapAdd_Internal(dsMapIndex, (char *)"rewarded", rewarded);
    F_DsMapAdd_Internal(dsMapIndex, (char *)"reward", rewardAmount);
    F_DsMapAdd_Internal(dsMapIndex, (char *)"rewardCurrency", [self charFromNSString:rewardCurrency]);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

- (void)rewardBasedVideoAdDidReceiveAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"Reward based video ad is received.");
    int dsMapIndex = CreateDsMap( 0 );
    F_DsMapAdd_Internal(dsMapIndex, (char *)"type", GADDidCacheVideo);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

- (void)rewardBasedVideoAdDidOpen:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"Opened reward based video ad.");
    int dsMapIndex = CreateDsMap( 0 );
    F_DsMapAdd_Internal(dsMapIndex, (char *)"type", GADDidOpenVideo);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

- (void)rewardBasedVideoAdDidStartPlaying:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"Reward based video ad started playing.");
    int dsMapIndex = CreateDsMap( 0 );
    F_DsMapAdd_Internal(dsMapIndex, (char *)"type", GADDidDisplayVideo);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

- (void)rewardBasedVideoAdDidClose:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"Reward based video ad is closed.");
    int dsMapIndex = CreateDsMap( 0 );
    F_DsMapAdd_Internal(dsMapIndex, (char *)"type", GADDidEndVideo);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
    char *placement = [self charFromNSString:self.videoId];
    [self requestRewardedVideo:placement];
}

- (void)rewardBasedVideoAdWillLeaveApplication:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"Reward based video ad will leave application.");
    int dsMapIndex = CreateDsMap( 0 );
    F_DsMapAdd_Internal(dsMapIndex, (char *)"type", GADDidClickVideo);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

- (void)rewardBasedVideoAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd didFailToLoadWithError:(NSError *)error {
    NSLog(@"Reward based video ad failed to load.");
    int dsMapIndex = CreateDsMap( 0 );
    F_DsMapAdd_Internal(dsMapIndex, (char *)"type", GADDidFailToLoadVideo);
    [self.bannerAd removeFromSuperview];
    self.bannerAd = nil;
    F_DsMapAdd_Internal(dsMapIndex, (char *)"error", [self getErrorTranslated:error.code]);
    F_DsMapAdd_Internal(dsMapIndex, (char *)"description", [self charFromNSString:error.localizedDescription]);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

@end
