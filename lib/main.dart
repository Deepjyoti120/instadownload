import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:getprofile/screens/UI/IntroScreen/intro_screen.dart';
import 'package:getprofile/screens/UI/home_screen_new.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:getprofile/cubit/introscreen_cubit.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  FlutterDownloader.registerCallback(FlutterDownload.callback);
  await MobileAds.initialize();
  runApp(const MyApp());
}

class FlutterDownload {
  static void callback(String id, DownloadTaskStatus status, int progress) {}
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IntroscreenCubit(),
      child: MaterialApp(
        title: 'Getprofile',
        home: BlocBuilder<IntroscreenCubit, IntroscreenState>(
          builder: (context, state) {
            if (state.introScreenValue == true) {
              return const NewHomePage();
            }
            return const IntroScreen();
          },
        ),
      ),
    );
  }
}
