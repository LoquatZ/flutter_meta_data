import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_android_meta_data/flutter_android_meta_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _channel = "Unknown";
  @override
  void initState() {
    super.initState();
    initMateDataState();
  }

  Future<void> initMateDataState() async {
    String mateData;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      mateData = await FlutterMetaData.getMetaDataValue("UMENG_CHANNEL");
    } on PlatformException {
      mateData = 'Failed to get mata data.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _channel = mateData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin MetaData'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Channel is: [ $_channel ]\n',
                textScaleFactor: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
