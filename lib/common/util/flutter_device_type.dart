import 'dart:io' as io;
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
  final bool isTablet, isPhone, isComputer, isIos, isAndroid, isWeb;

  Device(
      {required this.isTablet,
      required this.isPhone,
      required this.isComputer,
      required this.isIos,
      required this.isAndroid,
      required this.isWeb});

  factory Device.get() {
    bool isTablet;
    bool isPhone;
    bool isIos = !kIsWeb && io.Platform.isIOS;
    bool isAndroid =!kIsWeb && io.Platform.isAndroid;
    bool isWeb = kIsWeb;
    bool isComputer =!kIsWeb && (io.Platform.isWindows ||
        io.Platform.isLinux ||
        io.Platform.isMacOS ||
        io.Platform.isFuchsia);

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

    return new Device(
        isTablet: isTablet,
        isPhone: isPhone,
        isComputer: isComputer,
        isAndroid: isAndroid,
        isIos: isIos,
        isWeb: isWeb);
  }
}
