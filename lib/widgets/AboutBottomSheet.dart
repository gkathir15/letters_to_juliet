import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:letters_to_juliet/AppColors.dart';

class AboutBottomSheet extends StatefulWidget {
  const AboutBottomSheet({Key? key}) : super(key: key);

  @override
  _AboutBottomSheetState createState() => _AboutBottomSheetState();
}

class _AboutBottomSheetState extends State<AboutBottomSheet>
    with SingleTickerProviderStateMixin {
  RewardedAd? _rewardedAd;
  AnimationController? _animationController;
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
        maxChildSize: 1,
        expand: true,
        minChildSize: 0.90,
        initialChildSize: 1,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Container(
              color: Colors.purple[100],
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Read Stories from the Sub Reddit \n r/UnsentLetters",
                      style: GoogleFonts.sarabun(
                          fontSize: 30,
                          color: AppColors.lightTxt,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text("Things you wish you could say to them.",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        color: AppColors.lightTxt,
                      )),
                  Text("&",
                      style: GoogleFonts.inter(
                          fontSize: 18, color: AppColors.lightTxt)),
                  Text("A place to write a letter you don't intend to send.",
                      style: GoogleFonts.inter(
                          fontSize: 20, color: AppColors.lightTxt)),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text("Like the app ?",
                        style: GoogleFonts.roboto(
                            fontSize: 25,
                            color: AppColors.lightTxt,
                            fontWeight: FontWeight.bold)),
                  ),
                  Text("Tap to share a Pizza.",
                      style: GoogleFonts.roboto(
                          fontSize: 34,
                          color: AppColors.lightTxt,
                          fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 50),
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: InkWell(
                        child: RotationTransition(
                            turns: Tween(begin: 0.0, end: 1.0)
                                .animate(CurvedAnimation(
                              parent: _animationController!,
                              curve: Curves.elasticOut,
                            )),
                            child: Image.asset("images/piz.png")),
                        onTap: () {
                          _rewardedAd!.show(onUserEarnedReward:
                              (RewardedAd ad, RewardItem rewardItem) {
                            print(rewardItem.toString());
                          });
                        },
                      ),
                    ),
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
        adUnitId: kReleaseMode ? AppColors.rewardid : AppColors.testRewardid,
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

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
}
