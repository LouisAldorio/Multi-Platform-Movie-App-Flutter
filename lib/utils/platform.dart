// ignore_for_file: constant_identifier_names

import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

enum PlatformType {
  Android,
  IOS,
  Web,
  MacOS,
  Windows,
  Linux,
  Fuchsia,
  Unknown,
}

enum DeviceType { Phone, Tablet }

class PlatformUtils {
  static DeviceType _getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    return data.size.shortestSide < 550 ? DeviceType.Phone : DeviceType.Tablet;
  }

  static PlatformType _getPlatform() {
    if (kIsWeb) {
      return PlatformType.Web;
    } else if (Platform.isIOS) {
      return PlatformType.IOS;
    } else if (Platform.isAndroid) {
      return PlatformType.Android;
    } else if (Platform.isFuchsia) {
      return PlatformType.Fuchsia;
    } else if (Platform.isLinux) {
      return PlatformType.Linux;
    } else if (Platform.isMacOS) {
      return PlatformType.MacOS;
    } else if (Platform.isWindows) {
      return PlatformType.Windows;
    }
    return PlatformType.Unknown;
  }

  static bool isPhone() {
    return _getDeviceType() == DeviceType.Phone;
  }

  static bool isTablet() {
    return _getDeviceType() == DeviceType.Tablet;
  }

  static bool isWeb() {
    return (_getPlatform() == PlatformType.Web);
  }

  static bool isAndroid() {
    return (_getPlatform() == PlatformType.Android);
  }

  static bool isIOS() {
    return (_getPlatform() == PlatformType.IOS);
  }

  static bool isMacOS() {
    return (_getPlatform() == PlatformType.MacOS);
  }

  static bool isWindows() {
    return (_getPlatform() == PlatformType.Windows);
  }

  static bool isLinux() {
    return (_getPlatform() == PlatformType.Linux);
  }

  static bool isFuchsia() {
    return (_getPlatform() == PlatformType.Fuchsia);
  }
}
