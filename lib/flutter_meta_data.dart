
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterMetaData {
  static const MethodChannel _channel = MethodChannel('flutter_meta_data');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> getMetaDataValue(String mateDataName) async {
    final String value =
    await _channel.invokeMethod('getMetaDataValue', mateDataName);
    return value;
  }
}
