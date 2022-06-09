import 'package:flutter/cupertino.dart';
import 'package:multi_platform_movie_app/utils/platform.dart';
import 'package:multi_platform_movie_app/views/home_page/android.dart';
import 'package:multi_platform_movie_app/views/home_page/ios.dart';
import 'package:multi_platform_movie_app/views/home_page/web.dart';

class RootView {

  static String homeRoute = "/";

  static Widget renderHome() {
    if(PlatformUtils.isAndroid() && PlatformUtils.isPhone()) {
      return HomeAndroidView();
    } else if(PlatformUtils.isIOS() && PlatformUtils.isPhone()) {
      return const HomeIOSView();
    } else if(PlatformUtils.isWeb()) {
      return const HomeWebView();
    }

    return const Center(child: Text('This Platform is not supported'));
  }
}