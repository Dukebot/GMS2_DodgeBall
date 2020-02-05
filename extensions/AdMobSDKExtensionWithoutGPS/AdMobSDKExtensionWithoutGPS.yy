{
    "id": "9b7dc527-4346-44c6-8c8a-1ecc54628d62",
    "modelName": "GMExtension",
    "mvc": "1.2",
    "name": "AdMobSDKExtensionWithoutGPS",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": true,
    "androidactivityinject": "",
    "androidclassname": "AdMobBridge",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "AdMobBridge",
    "copyToTargets": 105553895391470,
    "date": "2018-22-14 05:04:22",
    "description": "",
    "exportToGame": true,
    "extensionName": "",
    "files": [
        {
            "id": "2d800ff2-316c-44d9-b923-0898879263b8",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                {
                    "id": "1d20eacc-2363-4692-86e6-ef55075c44a7",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidCacheInterstitial",
                    "hidden": false,
                    "value": "602"
                },
                {
                    "id": "2975defd-6da5-47c7-b7d3-a67c875bfa9c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidDisplayInterstitial",
                    "hidden": false,
                    "value": "601"
                },
                {
                    "id": "3a9b336c-a0fb-4297-93b8-c11132add2db",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidFailToPresentInterstitial",
                    "hidden": false,
                    "value": "604"
                },
                {
                    "id": "0ec521dc-0b7d-4b35-9c23-2508ac1d5825",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidCloseInterstitial",
                    "hidden": false,
                    "value": "605"
                },
                {
                    "id": "f632957b-1aa5-4c3d-89e7-28b8d45530e2",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidClickInterstitial",
                    "hidden": false,
                    "value": "606"
                },
                {
                    "id": "32613947-4fd7-4afd-96a8-c38fda22f29c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidFailToLoadInterstitial",
                    "hidden": false,
                    "value": "603"
                },
                {
                    "id": "100bfbc8-2269-4f66-b3c1-bb6b27d68d63",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidFailToConnect",
                    "hidden": false,
                    "value": "621"
                },
                {
                    "id": "e2a86b91-19f9-4ccc-b45c-a3b95e863cb0",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADErrorNetworkError",
                    "hidden": false,
                    "value": "1000"
                },
                {
                    "id": "be878567-2fb8-4f28-ac51-18c4d84697d1",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADErrorNoFill",
                    "hidden": false,
                    "value": "1001"
                },
                {
                    "id": "f112cbd9-8e68-4f58-bfb9-bf9c8bfe884b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADErrorInvalidRequest",
                    "hidden": false,
                    "value": "1002"
                },
                {
                    "id": "2e728f6c-650a-4486-b13d-8322857eacbf",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADErrorServerError",
                    "hidden": false,
                    "value": "2000"
                },
                {
                    "id": "fa80feb5-b134-4874-8086-c3b0d60c9965",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADErrorInternalError",
                    "hidden": false,
                    "value": "2001"
                },
                {
                    "id": "118c871b-3b9d-496f-a783-6d8cdae77f55",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADAdSizeBanner",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "fec988cb-eecb-48b8-8211-52c6630dbdf2",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADAdSizeLargeBanner",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "6565dabd-8941-4c1f-a1f5-f67852783d75",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADAdSizeMediumRectangle",
                    "hidden": false,
                    "value": "3"
                },
                {
                    "id": "b6e2cb94-a919-465e-bdae-f30abc59a938",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidFailToLoadBanner",
                    "hidden": false,
                    "value": "607"
                },
                {
                    "id": "8a47950e-0881-4083-96a2-c76a142493f3",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidCacheBanner",
                    "hidden": false,
                    "value": "608"
                },
                {
                    "id": "42b2f9c0-44c2-4f7d-ad84-84663a0b5fc8",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidDisplayBanner",
                    "hidden": false,
                    "value": "609"
                },
                {
                    "id": "994488b5-2b66-43a0-b8e4-88db654f45ce",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidClickBanner",
                    "hidden": false,
                    "value": "610"
                },
                {
                    "id": "344ba3bb-4e94-49f1-aebe-39ea2b86a322",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidDismissBanner",
                    "hidden": false,
                    "value": "611"
                },
                {
                    "id": "2661ecb8-e5a6-4818-bab0-40ecff389c6f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidRemoveBanner",
                    "hidden": false,
                    "value": "612"
                },
                {
                    "id": "ab8eee46-0ff5-4807-ad8f-15613f538565",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidDisplayVideo",
                    "hidden": false,
                    "value": "613"
                },
                {
                    "id": "44b24380-488d-4f80-9608-50a1cc2304c2",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidCacheVideo",
                    "hidden": false,
                    "value": "614"
                },
                {
                    "id": "17e0e884-08f8-4cb8-8645-c8da5e805863",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidFailToLoadVideo",
                    "hidden": false,
                    "value": "615"
                },
                {
                    "id": "babec6ef-b1cd-4057-b723-ccde02b281ca",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidEndVideo",
                    "hidden": false,
                    "value": "616"
                },
                {
                    "id": "d79750b9-3abc-463d-a8bf-7332867992ef",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidClickVideo",
                    "hidden": false,
                    "value": "617"
                },
                {
                    "id": "29509817-83f6-4c74-9047-e4a34be488ca",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADAdSizeFullBanner",
                    "hidden": false,
                    "value": "4"
                },
                {
                    "id": "9e20555d-cffd-4762-b519-82a09804a150",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADAdSizeLeaderboard",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "a4444166-5e98-4419-a4b3-c4ae3f22e568",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADAdSizeSmartBannerPortrait",
                    "hidden": false,
                    "value": "6"
                },
                {
                    "id": "c7638c9f-6893-423c-8ec3-0cbeefa766dd",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADAdSizeSmartBannerLandscape",
                    "hidden": false,
                    "value": "7"
                },
                {
                    "id": "b9f8e1f6-754a-409a-87d2-94ca98b8eb13",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidOpenVideo",
                    "hidden": false,
                    "value": "618"
                },
                {
                    "id": "7633fefd-e28a-4d12-98d7-f164f04912b0",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADDidRewardUserWithReward",
                    "hidden": false,
                    "value": "619"
                },
                {
                    "id": "b2b4f053-3733-4fa4-a26f-303ed4ed490e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "GADAdSizeSmartBanner",
                    "hidden": false,
                    "value": "6"
                }
            ],
            "copyToTargets": 35651596,
            "filename": "AdMobSDKExtension.ext",
            "final": "",
            "functions": [
                {
                    "id": "e0a276b5-3113-410a-bda5-eb34d80cfe84",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "initInterstitial",
                    "help": "admob_init_interstitial( adUnitID );",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_init_interstitial",
                    "returnType": 0
                },
                {
                    "id": "b3029a41-5cb0-4bdf-bf9e-ad9e7d0b8891",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "getVersion",
                    "help": "admob_get_version();",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_get_version",
                    "returnType": 1
                },
                {
                    "id": "db95a85f-56bd-46b2-9539-2bce37d77289",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "showInterstitial",
                    "help": "admob_show_interstitial();",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_show_interstitial",
                    "returnType": 0
                },
                {
                    "id": "3e70da9c-7a8d-4761-987d-39ffb5e7d974",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "initBanner",
                    "help": "admob_init_banner( adUnitID, height )",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_init_banner",
                    "returnType": 0
                },
                {
                    "id": "fd796df2-f0da-43f6-b9ea-7e3e58eb7b00",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "showBannerAtTop",
                    "help": "admob_show_banner_at_top();",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_show_banner_at_top",
                    "returnType": 0
                },
                {
                    "id": "85f7e515-13c3-432e-8993-a83277bac611",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "showBannerAtTopUnderStatusBar",
                    "help": "admob_show_banner_at_top_under_status_bar();",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_show_banner_at_top_under_status_bar",
                    "returnType": 0
                },
                {
                    "id": "30ed956d-eb89-462d-a542-dd6cb6d76251",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "showBannerAtBottom",
                    "help": "admob_show_banner_at_bottom();",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_show_banner_at_bottom",
                    "returnType": 0
                },
                {
                    "id": "c7e6fa8c-4cea-4c3c-a8a8-1ad9b1b62369",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "removeBanner",
                    "help": "admob_remove_banner();",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_remove_banner",
                    "returnType": 0
                },
                {
                    "id": "387ed159-6ecd-42cf-a979-13854afd522d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "initVideo",
                    "help": "admob_init_rewarded_video( adUnitID );",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_init_rewarded_video",
                    "returnType": 0
                },
                {
                    "id": "702f7ccb-a6a3-4417-9e4b-a9186003d9d8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "showVideo",
                    "help": "admob_show_rewarded_video();",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_show_rewarded_video",
                    "returnType": 0
                },
                {
                    "id": "4612efdb-14ae-4556-b63b-bde2e3bb32d3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "hasInternetConnection",
                    "help": "admob_has_internet_connection();",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_has_internet_connection",
                    "returnType": 2
                },
                {
                    "id": "e9f879bb-79a7-401d-b616-29749715cb3c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "initInterstitialForDesignedForFamiliesProgram",
                    "help": "admob_init_interstitial_for_designed_for_families_program( adUnitID );",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_init_interstitial_for_designed_for_families_program",
                    "returnType": 0
                },
                {
                    "id": "93a6c28a-7dd0-4a37-bfe5-9c1ffa2a5714",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "initInterstitialForChildOriented",
                    "help": "admob_init_interstitial_for_child_oriented( adUnitID );",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_init_interstitial_for_child_oriented",
                    "returnType": 0
                },
                {
                    "id": "f7bf5085-b57c-4744-a67d-9f99d7c2c4aa",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "initBannerForDesignedForFamiliesProgram",
                    "help": "admob_init_banner_for_designed_for_families_program( adUnitID, height )",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_init_banner_for_designed_for_families_program",
                    "returnType": 0
                },
                {
                    "id": "48cd2793-1a2d-4899-9015-d7abbcfc290e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "initBannerForChildOriented",
                    "help": "admob_init_banner_for_child_oriented( adUnitID, height )",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_init_banner_for_child_oriented",
                    "returnType": 0
                },
                {
                    "id": "2eebb473-9105-45ff-85c6-02e13de0c11c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "initVideoForDesignedForFamiliesProgram",
                    "help": "admob_init_rewarded_video_for_designed_for_families_program( adUnitID );",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_init_rewarded_video_for_designed_for_families_program",
                    "returnType": 2
                },
                {
                    "id": "955f467f-1477-447f-b56e-e2eec58affa1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "initVideoForChildOriented",
                    "help": "admob_init_rewarded_video_for_child_oriented( adUnitID );",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_init_rewarded_video_for_child_oriented",
                    "returnType": 2
                },
                {
                    "id": "cb3e59d0-60c9-4e75-8baa-f4f26b65edc3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "setApplicationMuted",
                    "help": "admob_set_application_muted( isMuted );",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_set_application_muted",
                    "returnType": 0
                },
                {
                    "id": "fdc5cbeb-715e-40ab-bf9d-b02df127a3a7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "setApplicationVolume",
                    "help": "admob_set_application_volume( volume );",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_set_application_volume",
                    "returnType": 0
                },
                {
                    "id": "6494c55b-2739-48ca-b5c0-85838bb6f4f3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "setTestDeviceIds",
                    "help": "admob_set_test_device_ids( testDeviceIds );",
                    "hidden": false,
                    "kind": 11,
                    "name": "admob_set_test_device_ids",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 4,
            "order": [
                
            ],
            "origname": "extensions\\AdMobSDKExtension.ext",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": true,
    "iosSystemFrameworkEntries": [
        {
            "id": "0a132073-7fe7-4355-aa0a-c0682012aac4",
            "modelName": "GMExtensionFrameworkEntry",
            "mvc": "1.0",
            "frameworkName": "CoreVideo.framework",
            "weakReference": false
        },
        {
            "id": "d80a4104-a698-406e-b1d8-3ebcea4df564",
            "modelName": "GMExtensionFrameworkEntry",
            "mvc": "1.0",
            "frameworkName": "GLKit.framework",
            "weakReference": false
        },
        {
            "id": "1567b7b6-3aad-4b79-8bc3-0127091bc029",
            "modelName": "GMExtensionFrameworkEntry",
            "mvc": "1.0",
            "frameworkName": "CoreMotion.framework",
            "weakReference": false
        },
        {
            "id": "dafdfc9f-e62e-4e36-8600-976708cb8461",
            "modelName": "GMExtensionFrameworkEntry",
            "mvc": "1.0",
            "frameworkName": "AdSupport.framework",
            "weakReference": false
        }
    ],
    "iosThirdPartyFrameworkEntries": [
        {
            "id": "63c6a47c-a6de-4afe-afa9-89cc0f94f52c",
            "modelName": "GMExtensionFrameworkEntry",
            "mvc": "1.0",
            "frameworkName": "libGoogleMobileAds.a",
            "weakReference": false
        }
    ],
    "iosdelegatename": null,
    "iosplistinject": "",
    "license": "Free to use, also for commercial games.",
    "maccompilerflags": "",
    "maclinkerflags": "-lxml2",
    "macsourcedir": "",
    "options": null,
    "optionsFile": "options.json",
    "packageID": "",
    "productID": "F79C97955FD1AF4686EB4EF4EF90F0DB",
    "sourcedir": "",
    "supportedTargets": 105553895391470,
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": null,
    "tvosdelegatename": null,
    "tvosmaccompilerflags": null,
    "tvosmaclinkerflags": null,
    "tvosplistinject": null,
    "version": "2.8.0"
}