import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:package_info/package_info.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class PlatformUtils {
  static String getChannelName() {
    if(kIsWeb) {
      return 'web';

    } else {
      if (Platform.isAndroid) {
        return 'android';
      }
      if (Platform.isIOS) {
        return 'ios';
      }
      if (Platform.isFuchsia) {
        return 'fuchsia';
      }
      if (Platform.isLinux) {
        return 'linux';
      }
      if (Platform.isWindows) {
        return 'windows';
      }
      if (Platform.isMacOS) {
        return 'macos';
      }
    }
    throw Exception("Unknown platform");
  }

  static Future<bool> hasConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  static Future<String> getBuildNumber() async {
    if(kIsWeb) {
      return Future.value("Web");
    } else {
      final PackageInfo info = await PackageInfo.fromPlatform();
      return info.buildNumber;
    }
  }
}
