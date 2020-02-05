package ${YYAndroidPackageName};

import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.AdView;
import com.google.android.gms.ads.InterstitialAd;
import com.google.android.gms.ads.MobileAds;
import com.google.android.gms.ads.reward.RewardItem;
import com.google.android.gms.ads.reward.RewardedVideoAd;
import com.google.android.gms.ads.reward.RewardedVideoAdListener;
import java.util.*;
import android.util.Log;
import android.os.Bundle;
import android.app.Activity;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.view.View;
import android.view.ViewManager;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.Toast;
import ${YYAndroidPackageName}.R;
import ${YYAndroidPackageName}.RunnerActivity;
import com.yoyogames.runner.RunnerJNILib;

/**
 *
 * @author Josep Gonzalez Fernandez (Dreams Corner);
 */
public class AdMobBridge extends Activity {

	final int GADDidDisplayInterstitial = 601;
	final int GADDidCacheInterstitial = 602;
	final int GADDidFailToLoadInterstitial = 603;
	final int GADDidFailToPresentInterstitial = 604;
	final int GADDidCloseInterstitial = 605;
	final int GADDidClickInterstitial = 606;
	final int GADDidFailToLoadBanner = 607;
	final int GADDidCacheBanner = 608;
	final int GADDidDisplayBanner = 609;
	final int GADDidClickBanner = 610;
	final int GADDidDismissBanner = 611;
	final int GADDidRemoveBanner = 612;
	final int GADDidDisplayVideo = 613;
	final int GADDidCacheVideo = 614;
	final int GADDidFailToLoadVideo = 615;
	final int GADDidEndVideo = 616;
	final int GADDidClickVideo = 617;
	final int GADDidOpenVideo = 618;
	final int GADDidRewardUserWithReward = 619;
	final int GADDidFailToConnect = 621;

	final int EVENT_OTHER_SOCIAL = 70;

	private InterstitialAd interstitialAd;
	private double interstitialAdDesignedForFamilies;
	private double interstitialAdChildOriented;
	private AdView bannerAd;
	private double bannerAdDesignedForFamilies;
	private double bannerAdChildOriented;
	private RewardedVideoAd videoAd;
	private double videoAdDesignedForFamilies;
	private double videoAdChildOriented;

  private boolean mIsRewardedVideoLoading = false;
  private final Object mLock = new Object();

	private List<String> testDevices;

	@Override
  protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		RunnerActivity.CurrentActivity.runOnUiThread(new Runnable() {
			public void run() {
				Toast.makeText(RunnerActivity.CurrentActivity, "On Create event",Toast.LENGTH_LONG).show();
			}
		});
	}

	public boolean isNetworkAvailable() {
		ConnectivityManager connectivityManager = (ConnectivityManager)RunnerActivity.CurrentActivity.getApplicationContext().getSystemService(Context.CONNECTIVITY_SERVICE);
		NetworkInfo activeNetworkInfo = connectivityManager
						.getActiveNetworkInfo();
		return activeNetworkInfo != null;
	}

	public boolean checkInternetConnection(int event) {
		if (!isNetworkAvailable()) {
			int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
			RunnerJNILib.DsMapAddDouble( dsMapIndex, "type", GADDidFailToConnect );
			RunnerJNILib.DsMapAddDouble( dsMapIndex, "error", event);
			RunnerJNILib.DsMapAddString( dsMapIndex, "message", "No internet connection available");

			RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			return false;
		}
		return true;
	}

	private AdSize getSizeForBanner(double height) {
      if (height == 2) {
          return AdSize.LARGE_BANNER;
      } else if (height == 3) {
          return AdSize.MEDIUM_RECTANGLE;
      } else if (height == 4) {
          return AdSize.FULL_BANNER;
      } else if (height == 5) {
          return AdSize.LEADERBOARD;
      } else if (height == 6) {
          return AdSize.SMART_BANNER;
      } else {
          return AdSize.BANNER;
      }
  }

	private double getErrorTranslated(int error) {
      switch (error) {
          case AdRequest.ERROR_CODE_NO_FILL:
              return 1001;
          case AdRequest.ERROR_CODE_NETWORK_ERROR:
              return 1000;
          case AdRequest.ERROR_CODE_INVALID_REQUEST:
              return 1002;
          default:
              return 2001;
      }
  }

	public void setTestDeviceIds(String testDeviceIds) {
		String[] testDevicesArr = testDeviceIds.split(",");
		if (testDevices == null) {
			testDevices = new ArrayList<String>();
		}
		for (String testDeviceId : testDevicesArr) {
        if (!testDevices.contains(testDeviceId)) {
            testDevices.add(testDeviceId);
        }
    }
	}

	private AdRequest.Builder getAdRequestWithTestDevices(AdRequest.Builder request) {
		if (testDevices == null) return request;
		for (String testDeviceId : testDevices) {
			request.addTestDevice(testDeviceId);
		}
		return request;
	}

	public void initInterstitial(String placement) {
		interstitialAdDesignedForFamilies = 0;
		interstitialAdChildOriented = 0;
		initNewInterstitial(placement);
	}

	public void initInterstitialForDesignedForFamiliesProgram(String placement) {
		interstitialAdDesignedForFamilies = 1;
		interstitialAdChildOriented = 0;
		initNewInterstitial(placement);
	}

	public void initInterstitialForChildOriented(String placement) {
		interstitialAdDesignedForFamilies = 0;
		interstitialAdChildOriented = 1;
		initNewInterstitial(placement);
	}

	public void initNewInterstitial(String placement) {
		final String placement_ = placement;
		RunnerActivity.CurrentActivity.runOnUiThread(new Runnable() {
			public void run() {
				checkInternetConnection(GADDidFailToConnect);
				interstitialAd = new InterstitialAd(RunnerActivity.CurrentActivity);
        interstitialAd.setAdUnitId(placement_);

				// Set listeners for the Interstitial Ad
        interstitialAd.setAdListener(new AdListener() {
            @Override
            public void onAdOpened() {
                int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
								RunnerJNILib.DsMapAddDouble( dsMapIndex, "type", GADDidDisplayInterstitial );
								RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }

            @Override
            public void onAdClosed() {
                int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
								RunnerJNILib.DsMapAddDouble( dsMapIndex, "type", GADDidCloseInterstitial );
								RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);

								requestNewInterstitial();
            }

            @Override
            public void onAdFailedToLoad(int i) {
                int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
								RunnerJNILib.DsMapAddDouble( dsMapIndex, "type", GADDidFailToLoadInterstitial );
								RunnerJNILib.DsMapAddDouble( dsMapIndex, "error", getErrorTranslated(i) );
								RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }

            @Override
            public void onAdLoaded() {
                // Show the ad when it's done loading.
								int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
								RunnerJNILib.DsMapAddDouble( dsMapIndex, "type", GADDidCacheInterstitial );
								RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }

            @Override
            public void onAdLeftApplication() {
								// Ad clicked callback
								int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
								RunnerJNILib.DsMapAddDouble( dsMapIndex, "type", GADDidClickInterstitial );
								RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }
        });

				requestNewInterstitial();
			}
		});
	}

	private void requestNewInterstitial() {
		AdRequest.Builder adRequestBuilder = new AdRequest.Builder();
		adRequestBuilder = getAdRequestWithTestDevices(adRequestBuilder);
		if (interstitialAdDesignedForFamilies == 1) {
			Bundle extras = new Bundle();
			extras.putBoolean("is_designed_for_families", true);

			AdRequest adRequest = adRequestBuilder.addNetworkExtrasBundle(AdMobAdapter.class, extras)
			        .tagForChildDirectedTreatment(true)
							.build();
			interstitialAd.loadAd(adRequest);
    } else if (interstitialAdChildOriented == 1) {
			AdRequest adRequest = adRequestBuilder.tagForChildDirectedTreatment(true)
							.build();
			interstitialAd.loadAd(adRequest);
		} else {
			AdRequest adRequest = adRequestBuilder.build();
			interstitialAd.loadAd(adRequest);
		}
		//.addTestDevice("SEE_YOUR_LOGCAT_TO_GET_YOUR_DEVICE_ID")
  }

	public void showInterstitial() {
		RunnerActivity.CurrentActivity.runOnUiThread(new Runnable() {
			public void run() {
				if (checkInternetConnection(GADDidFailToConnect)) {
					if (interstitialAd.isLoaded()) {
						interstitialAd.show();
					}
				}
			}
		});
	}

	public void initBanner(String placement, double height) {
		bannerAdDesignedForFamilies = 0;
		bannerAdChildOriented = 0;
		initNewBanner(placement, height);
	}

	public void initBannerForDesignedForFamiliesProgram(String placement, double height) {
		bannerAdDesignedForFamilies = 1;
		bannerAdChildOriented = 0;
		initNewBanner(placement, height);
	}

	public void initBannerForChildOriented(String placement, double height) {
		bannerAdDesignedForFamilies = 0;
		bannerAdChildOriented = 1;
		initNewBanner(placement, height);
	}

	public void initNewBanner(String placement, double height) {
		final String placement_ = placement;
		final AdSize height_ = getSizeForBanner(height);
		RunnerActivity.CurrentActivity.runOnUiThread(new Runnable() {
			public void run() {
				LinearLayout bannerAdView = (LinearLayout) RunnerActivity.CurrentActivity.findViewById(R.id.banner_bottom_container);
				bannerAd = new AdView(RunnerActivity.CurrentActivity);
        bannerAd.setAdSize(height_);
        bannerAd.setAdUnitId(placement_);

				bannerAd.setAdListener(new AdListener() {
            @Override
            public void onAdFailedToLoad(int i) {
                // Ad error callback
                int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
								RunnerJNILib.DsMapAddDouble( dsMapIndex, "type", GADDidFailToLoadBanner );
								RunnerJNILib.DsMapAddDouble( dsMapIndex, "error", getErrorTranslated(i) );
								RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }

            @Override
            public void onAdLoaded() {
                // Ad loaded callback
								int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
								RunnerJNILib.DsMapAddDouble( dsMapIndex, "type", GADDidCacheBanner );
								RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }

            @Override
            public void onAdLeftApplication() {
                // Ad clicked callback
								int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
								RunnerJNILib.DsMapAddDouble( dsMapIndex, "type", GADDidClickBanner );
								RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }

						@Override
            public void onAdOpened() {
							// Ad opened callback
							int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
							RunnerJNILib.DsMapAddDouble( dsMapIndex, "type", GADDidDisplayBanner );
							RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }

						@Override
            public void onAdClosed() {
							// Ad closed callback
							int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
							RunnerJNILib.DsMapAddDouble( dsMapIndex, "type", GADDidDismissBanner );
							RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }
        });

			  // Request an ad
				AdRequest.Builder adRequestBuilder = new AdRequest.Builder();
				adRequestBuilder = getAdRequestWithTestDevices(adRequestBuilder);
				if (bannerAdDesignedForFamilies == 1) {
					Bundle extras = new Bundle();
					extras.putBoolean("is_designed_for_families", true);

					AdRequest adRequest = adRequestBuilder.addNetworkExtrasBundle(AdMobAdapter.class, extras)
					        .tagForChildDirectedTreatment(true)
									.build();
					bannerAd.loadAd(adRequest);
		    } else if (bannerAdChildOriented == 1) {
					AdRequest adRequest = adRequestBuilder.tagForChildDirectedTreatment(true)
									.build();
					bannerAd.loadAd(adRequest);
				} else {
					AdRequest adRequest = adRequestBuilder.build();
					bannerAd.loadAd(adRequest);
				}
			}
		});
	}

	public void showBannerAtTop() {
		RunnerActivity.CurrentActivity.runOnUiThread(new Runnable() {
			public void run() {
				if (checkInternetConnection(GADDidFailToConnect)) {
					FrameLayout layout = (FrameLayout)RunnerActivity.CurrentActivity.getWindow().getDecorView().findViewById(android.R.id.content);
					View.inflate(RunnerActivity.CurrentActivity, R.layout.banner_top, layout);

					// Find the Ad Container
				  LinearLayout adContainer = (LinearLayout) RunnerActivity.CurrentActivity.findViewById(R.id.banner_top_container);

				  // Add the ad view to your activity layout
					removeBanner();
				  adContainer.addView(bannerAd);
				}
			}
		});
	}

	public void showBannerAtTopUnderStatusBar() {
		RunnerActivity.CurrentActivity.runOnUiThread(new Runnable() {
			public void run() {
				if (checkInternetConnection(GADDidFailToConnect)) {
					FrameLayout layout = (FrameLayout)RunnerActivity.CurrentActivity.getWindow().getDecorView().findViewById(android.R.id.content);
					View.inflate(RunnerActivity.CurrentActivity, R.layout.banner_top_statusbar, layout);

					// Find the Ad Container
				  LinearLayout adContainer = (LinearLayout) RunnerActivity.CurrentActivity.findViewById(R.id.banner_top_statusbar_container);

				  // Add the ad view to your activity layout
					removeBanner();
				  adContainer.addView(bannerAd);
				}
			}
		});
	}

	public void showBannerAtBottom() {
		RunnerActivity.CurrentActivity.runOnUiThread(new Runnable() {
			public void run() {
				if (checkInternetConnection(GADDidFailToConnect)) {
					FrameLayout layout = (FrameLayout)RunnerActivity.CurrentActivity.getWindow().getDecorView().findViewById(android.R.id.content);
					View.inflate(RunnerActivity.CurrentActivity, R.layout.banner_bottom, layout);

					// Find the Ad Container
				  LinearLayout adContainer = (LinearLayout) RunnerActivity.CurrentActivity.findViewById(R.id.banner_bottom_container);

				  // Add the ad view to your activity layout
					removeBanner();
				  adContainer.addView(bannerAd);
				}
			}
		});
	}

	public void removeBanner() {
		// Add the ad view to your activity layout
		RunnerActivity.CurrentActivity.runOnUiThread(new Runnable() {
			public void run() {
				if (checkInternetConnection(GADDidFailToConnect)) {
					LinearLayout adContainerBottom = (LinearLayout) RunnerActivity.CurrentActivity.findViewById(R.id.banner_bottom_container);
					if (adContainerBottom != null) {
						adContainerBottom.removeAllViews();
					}
					LinearLayout adContainerTop = (LinearLayout) RunnerActivity.CurrentActivity.findViewById(R.id.banner_top_container);
					if (adContainerTop != null) {
						adContainerTop.removeAllViews();
					}
					LinearLayout adContainerTopStatusbar = (LinearLayout) RunnerActivity.CurrentActivity.findViewById(R.id.banner_top_statusbar_container);
					if (adContainerTopStatusbar != null) {
						adContainerTopStatusbar.removeAllViews();
					}
				}
			}
		});
	}

	public void initVideo(String placement) {
		videoAdDesignedForFamilies = 0;
		videoAdChildOriented = 0;
		initNewVideo(placement);
	}

	public void initVideoForDesignedForFamiliesProgram(String placement) {
		videoAdDesignedForFamilies = 1;
		videoAdChildOriented = 0;
		initNewVideo(placement);
	}

	public void initVideoForChildOriented(String placement) {
		videoAdDesignedForFamilies = 0;
		videoAdChildOriented = 1;
		initNewVideo(placement);
	}

	public void initNewVideo(String placement) {
		final String placement_ = placement;
		RunnerActivity.CurrentActivity.runOnUiThread(new Runnable() {
			public void run() {
				FrameLayout layout = (FrameLayout)RunnerActivity.CurrentActivity.getWindow().getDecorView().findViewById(android.R.id.content);
				videoAd = MobileAds.getRewardedVideoAdInstance(RunnerActivity.CurrentActivity);
        videoAd.setRewardedVideoAdListener(new RewardedVideoAdListener() {
            @Override
            public void onRewardedVideoAdFailedToLoad(int i) {
                // Ad error callback
								synchronized (mLock) {
						        mIsRewardedVideoLoading = false;
						    }
								int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
								RunnerJNILib.DsMapAddDouble( dsMapIndex, "type", GADDidFailToLoadVideo );
								RunnerJNILib.DsMapAddDouble( dsMapIndex, "error", getErrorTranslated(i) );
								RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }

            @Override
            public void onRewardedVideoAdLoaded() {
                // Ad loaded callback
								synchronized (mLock) {
						        mIsRewardedVideoLoading = false;
						    }
								int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
								RunnerJNILib.DsMapAddDouble( dsMapIndex, "type", GADDidCacheVideo );
								RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }

            @Override
            public void onRewardedVideoAdLeftApplication() {
                // Ad clicked callback
								int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
								RunnerJNILib.DsMapAddDouble( dsMapIndex, "type", GADDidClickVideo );
								RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }

						@Override
            public void onRewarded(RewardItem rewardItem) {
							int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
							RunnerJNILib.DsMapAddDouble( dsMapIndex, "type", GADDidRewardUserWithReward );
							RunnerJNILib.DsMapAddDouble( dsMapIndex, "rewarded", 1 );
							RunnerJNILib.DsMapAddDouble( dsMapIndex, "reward", rewardItem.getAmount() );
							RunnerJNILib.DsMapAddString( dsMapIndex, "rewardCurrency", rewardItem.getType() );
							RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }

						@Override
            public void onRewardedVideoAdOpened() {
							int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
							RunnerJNILib.DsMapAddDouble( dsMapIndex, "type", GADDidOpenVideo );
							RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }

            @Override
            public void onRewardedVideoStarted() {
							int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
							RunnerJNILib.DsMapAddDouble( dsMapIndex, "type", GADDidDisplayVideo );
							RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }

            @Override
            public void onRewardedVideoAdClosed() {
							loadRewardedVideoAd(placement_);
							int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
							RunnerJNILib.DsMapAddDouble( dsMapIndex, "type", GADDidEndVideo );
							RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }
        });

			  // Request an ad
			  loadRewardedVideoAd(placement_);
			}
		});
	}

	private void loadRewardedVideoAd(String placement) {
        synchronized (mLock) {
            if (!mIsRewardedVideoLoading) {
                mIsRewardedVideoLoading = true;
								Bundle extras = new Bundle();
                extras.putBoolean("_noRefresh", true);
								AdRequest.Builder adRequestBuilder = new AdRequest.Builder();
								adRequestBuilder = getAdRequestWithTestDevices(adRequestBuilder);
                AdRequest adRequest = adRequestBuilder.addNetworkExtrasBundle(AdMobAdapter.class, extras)
                        .build();
                videoAd.loadAd(placement, adRequest);
            }
        }
    }

	public void showVideo() {
		RunnerActivity.CurrentActivity.runOnUiThread(new Runnable() {
			public void run() {
				if (videoAd.isLoaded()) {
				   videoAd.show();
				}
			}
		});
	}

	public void setApplicationMuted(double muted) {
		MobileAds.setAppMuted(true);
	}

	public void setApplicationVolume(double volume) {
		MobileAds.setAppVolume(((float)volume)*0.01f);
	}

	public String getVersion() {
		return "11.8.0";
	}

	public double hasInternetConnection() {
    return isNetworkAvailable() ? 1 : 0;
	}

	@Override
	protected void onDestroy() {
		if (bannerAd != null) {
			bannerAd.destroy();
		}
	  super.onDestroy();
	}
}
