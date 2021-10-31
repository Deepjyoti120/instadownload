import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:instaget/cubit/introscreen_cubit.dart';
import 'package:instaget/screens/UI/IntroScreen/introScreen.dart';
import 'package:instaget/screens/UI/homeScreen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);
  FlutterDownloader.registerCallback(FlutterDownload.callback);
  MobileAds.instance.initialize();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(MyApp());
}

class FlutterDownload {
  static void callback(String id, DownloadTaskStatus status, int progress) {}
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IntroscreenCubit(),
      child: MaterialApp(
        // theme: ThemeData(
        //   textTheme: GoogleFonts.ptSansTextTheme(
        //     Theme.of(context).textTheme,
        //   ),
        // ),
        title: 'Insta Export',
        // home: MainInsta(),
        home: BlocBuilder<IntroscreenCubit, IntroscreenState>(
          builder: (context, state) {
            if (state.introScreenValue == false) {
              return IntroInsta();
            }
            return MainInsta();
          },
        ),
      ),
    );
  }
}
