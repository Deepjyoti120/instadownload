import 'package:flutter/cupertino.dart';
import 'package:getprofile/ads/ads_helper.dart';
import 'package:getprofile/screens/widgets/progress_awesome.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

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
      error: const Text('error'),
      size: BannerSize.ADAPTIVE,
    );
  }
}
