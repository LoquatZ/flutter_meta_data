
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterMetaData {
  static const MethodChannel _channel = MethodChannel('flutter_meta_data');

  static Future<String> getMetaDataValue(String mateDataName) async {
    final String value =
    await _channel.invokeMethod('getMetaDataValue', mateDataName);
    return value;
  }
}
