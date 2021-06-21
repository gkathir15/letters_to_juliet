import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:letters_to_juliet/AppColors.dart';

class AboutBottomSheet extends StatefulWidget {
  const AboutBottomSheet({Key? key}) : super(key: key);

  @override
  _AboutBottomSheetState createState() => _AboutBottomSheetState();
}

class _AboutBottomSheetState extends State<AboutBottomSheet> {
  RewardedAd? _rewardedAd;
  var adcallback = FullScreenContentCallback(
  onAdShowedFullScreenContent: (RewardedAd ad) =>
  print('$ad onAdShowedFullScreenContent.'),
  onAdDismissedFullScreenContent: (RewardedAd ad) {
  print('$ad onAdDismissedFullScreenContent.');
  ad.dispose();
  },
  onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
  print('$ad onAdFailedToShowFullScreenContent: $error');
  ad.dispose();
  },
  onAdImpression: (RewardedAd ad) => print('$ad impression occurred.'),
  );
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(onPressed: () {
_rewardedAd!.show(onUserEarnedReward: (RewardedAd ad, RewardItem rewardItem) {
  print(rewardItem.toString());
});
      },child: Text("ad"),),
    );
  }

  @override
  void initState() {
    RewardedAd.load(
        adUnitId: AppColors.testRewardid,
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            this._rewardedAd = ad;
            _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
              onAdShowedFullScreenContent: (RewardedAd ad) =>
                  print('$ad onAdShowedFullScreenContent.'),
              onAdDismissedFullScreenContent: (RewardedAd ad) {
                print('$ad onAdDismissedFullScreenContent.');
                ad.dispose();
              },
              onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
                print('$ad onAdFailedToShowFullScreenContent: $error');
                ad.dispose();
              },
              onAdImpression: (RewardedAd ad) => print('$ad impression occurred.'),
            );
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
          },
        ));

    super.initState();
  }
}
