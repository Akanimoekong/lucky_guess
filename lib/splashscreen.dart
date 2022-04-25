import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lucky_guess/luckdice.dart';

import 'data/add_helper.dart';

// Admob const
const int maxFailedLoadAttempts = 3;

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  // interstitialLoadAttempts variable
  int _interstitialLoadAttempts = 0;
  InterstitialAd? _interstitialAd;
  @override
  void initState() {
    super.initState();
    _createInterstitialAd();

    Timer(Duration(seconds: 4), () {
      _showInterstitialAd();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => GuessPage()));
    });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   // _createBottomBannerAd();
  //   _createInterstitialAd();
  // }

  @override
  void dispose() {
    super.dispose();
    // _bottomBannerAd.dispose();
    _interstitialAd?.dispose();
  }

  // InterstitialAd Function
  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _interstitialLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _interstitialLoadAttempts += 1;
          _interstitialAd = null;
          if (_interstitialLoadAttempts <= maxFailedLoadAttempts) {
            _createInterstitialAd();
          }
        },
      ),
    );
  }

  // showInterstitialAd
  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          _createInterstitialAd();
        },
      );
      _interstitialAd!.show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
