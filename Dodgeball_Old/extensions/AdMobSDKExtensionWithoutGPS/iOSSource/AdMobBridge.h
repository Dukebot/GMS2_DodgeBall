//
//  AdMobBridge.h
//  AdMob_Extension
//
//  Created by Josep Gonzalez Fernandez on 14/3/17.
//  Copyright © 2017 Dreams Corner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <GoogleMobileAds.h>

@class GADBannerView;

@interface AdMobBridge : NSObject <GADBannerViewDelegate, GADInterstitialDelegate, GADRewardBasedVideoAdDelegate>
{
}

@property (nonatomic, strong) GADBannerView *bannerAd;
@property (nonatomic, strong) GADInterstitial *interstitialAd;
@property (nonatomic, strong) GADRewardBasedVideoAd *videoAd;

@property (nonatomic, retain) NSString *bannerId;
@property (nonatomic, retain) NSString *interstitialId;
@property (nonatomic, retain) NSString *videoId;

- (void) setTestDeviceIds:(char *)testDeviceIds;
- (void) initInterstitial:(char *)placement;
- (void) initInterstitialForDesignedForFamiliesProgram:(char *)placement;
- (void) initInterstitialForChildOriented:(char *)placement;
- (void) showInterstitial;
- (void) initBanner:(char *)placement withHeight:(double)height;
- (void) initBannerForDesignedForFamiliesProgram:(char *)placement withHeight:(double)height;
- (void) initBannerForChildOriented:(char *)placement withHeight:(double)height;
- (void) showBannerAtTop;
- (void) showBannerAtTopUnderStatusBar;
- (void) showBannerAtBottom;
- (void) removeBanner;
- (void) initVideo:(char *)placement;
- (void) initVideoForDesignedForFamiliesProgram:(char *)placement;
- (void) initVideoForChildOriented:(char *)placement;
- (void) showVideo;
- (void) setApplicationMuted:(double)muted;
- (void) setApplicationVolume:(double)volume;
- (char *) getVersion;
- (double) hasInternetConnection;
@end
