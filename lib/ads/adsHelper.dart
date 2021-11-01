import 'dart:io';

class AdsHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-7265627105635702/6833425176';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-7265627105635702/6833425176';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
  static String get mediumRectangleAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-7265627105635702/5035760798';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-7265627105635702/5035760798';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  // static String get interstitialAdUnitId {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-3940256099942544/1033173712";
  //   } else if (Platform.isIOS) {
  //     return "ca-app-pub-3940256099942544/4411468910";
  //   } else {
  //     throw UnsupportedError("Unsupported platform");
  //   }
  // }

  // static String get rewardedAdUnitId {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-3940256099942544/5224354917";
  //   } else if (Platform.isIOS) {
  //     return "ca-app-pub-3940256099942544/1712485313";
  //   } else {
  //     throw UnsupportedError("Unsupported platform");
  //   }
  // }
}
