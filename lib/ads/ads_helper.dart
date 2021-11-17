import 'dart:io';

class AdsHelper {
  static String get rectangleAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-7265627105635702/9156599510';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-7265627105635702/9156599510';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAds {
    if (Platform.isAndroid) {
      return 'ca-app-pub-7265627105635702/4392503203';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-7265627105635702/4392503203';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
