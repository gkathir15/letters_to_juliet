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
    return DraggableScrollableSheet(

        maxChildSize: .90,
        expand: false,
        minChildSize: 0.25,
        initialChildSize: 0.5,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Container(
              child: Column(
                children: [
                  Text("Read Stories from the Sub Reddit"
                      "r/UnsentLetters"),
                  Text("Things you wish you could say to them."),
                  Text("&"),
                  Text("A place to write a letter you don't intend to send."),
                  Text("Like the app ?"),
                  Text("Tap to share a Pizza free of cost"),
                  InkWell(child: Image.asset("images/piz.png"),onTap: (){
                    _rewardedAd!.show(onUserEarnedReward: (RewardedAd ad, RewardItem rewardItem) {
                      print(rewardItem.toString());
                    });
                  },
                  ),


                ],
              ),
            ),
          );
        });
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
              onAdFailedToShowFullScreenContent:
                  (RewardedAd ad, AdError error) {
                print('$ad onAdFailedToShowFullScreenContent: $error');
                ad.dispose();
              },
              onAdImpression: (RewardedAd ad) =>
                  print('$ad impression occurred.'),
            );
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
          },
        ));

    super.initState();
  }
}
