import 'dart:io';
// Please replace app unit id : 
class AdsHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-7265627105635702/6722007860';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-7265627105635702/6722007860';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
  static String get rectangleAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-7265627105635702/9156599510';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-7265627105635702/9156599510';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
