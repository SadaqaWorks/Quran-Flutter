import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart' show kIsWeb;

class Device {
  static double devicePixelRatio = ui.window.devicePixelRatio;
  static ui.Size size = ui.window.physicalSize;
  static double width = size.width;
  static double height = size.height;
  static double screenWidth = width / devicePixelRatio;
  static double screenHeight = height / devicePixelRatio;
  static ui.Size screenSize = new ui.Size(screenWidth, screenHeight);
  final bool? isTablet, isPhone, isComputer, isIos, isAndroid, isWeb;
  static Device? _device;

  Device(
      {this.isTablet,
      this.isPhone,
      this.isComputer,
      this.isIos,
      this.isAndroid,
      this.isWeb});

  factory Device.get() {
    if (_device != null) return _device!;

    bool isTablet;
    bool isPhone;
    bool isIos = Platform.isIOS;
    bool isAndroid = Platform.isAndroid;
    bool isWeb = kIsWeb;
    bool isComputer = Platform.isWindows ||
        Platform.isLinux ||
        Platform.isMacOS ||
        Platform.isFuchsia;

    if (devicePixelRatio < 2 && (width >= 1000 || height >= 1000)) {
      isTablet = true;
      isPhone = false;
    } else if (devicePixelRatio == 2 && (width >= 1920 || height >= 1920)) {
      isTablet = true;
      isPhone = false;
    } else {
      isTablet = false;
      isPhone = true;
    }

    return _device = new Device(
        isTablet: isTablet,
        isPhone: isPhone,
        isComputer: isComputer,
        isAndroid: isAndroid,
        isIos: isIos,
        isWeb: isWeb);
  }
}
