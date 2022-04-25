import 'dart:io';

class AdHelper {
  // banner AdUnit Id

  // static String get bannerAdUnitId {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-3940256099942544/6300978111";
  //   } else {
  //     throw UnsupportedError("Unsupported platform");
  //   }
  // }

  // interstitial AdUnit Id
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9803945050008647/9042129381";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
