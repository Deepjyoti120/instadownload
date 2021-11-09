import 'package:flutter/cupertino.dart';
import 'package:getprofile/ads/adsHelper.dart';
import 'package:getprofile/screens/widgets/progressAwesome.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

class BannerRectangle extends StatelessWidget {
  const BannerRectangle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BannerAd(
      unitId: AdsHelper.rectangleAdUnitId,
      builder: (context, child) {
        return Container(
          child: child,
        );
      },
      loading: Center(child: progressAwesome()),
      error: Text('error'),
      size: BannerSize.MEDIUM_RECTANGLE,
    );
  }
}

class BannerSmall extends StatelessWidget {
  const BannerSmall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BannerAd(
      unitId: AdsHelper.bannerAdUnitId,
      builder: (context, child) {
        return Container(
          child: child,
        );
      },
      loading: Center(child: progressAwesome()),
      error: Text('error'),
      size: BannerSize.ADAPTIVE,
    );
  }
}
