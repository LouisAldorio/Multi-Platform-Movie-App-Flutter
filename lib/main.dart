import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_platform_movie_app/bindings/home.dart';
import 'package:multi_platform_movie_app/utils/platform.dart';
import 'package:multi_platform_movie_app/views/root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List<GetPage<dynamic>>? _pages = [
    GetPage(
      name: RootView.homeRoute,
      page: () => RootView.renderHome(),
      binding: HomeBinding(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return PlatformUtils.isAndroid() || PlatformUtils.isWeb()
        ? GetMaterialApp(
            title: 'Multi-platform Movie App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: RootView.homeRoute,
            getPages: _pages,
          )
        : GetCupertinoApp(
            localizationsDelegates: const [
              DefaultMaterialLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
            ],
            title: 'Multi-platform Movie App',
            theme: const CupertinoThemeData(
              primaryColor: CupertinoColors.activeBlue,
            ),
            initialRoute: RootView.homeRoute,
            getPages: _pages,
          );
  }
}
