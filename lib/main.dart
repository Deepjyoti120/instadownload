import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:instadownload/cubit/introscreen_cubit.dart';
import 'package:instadownload/screens/UI/IntroScreen/introScreen.dart';
import 'package:instadownload/screens/UI/homeScreen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IntroscreenCubit(),
      child: MaterialApp(
        title: 'Instaexport',
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
