# flutter_android_meta_data

Flutter get Android `<meta-data>` in AndroidManifest.xml.

## Use

### In AndroidManifest.xml.

```xml
<meta-data android:name="YOUR_CHANNEL" android:value="test" />
```

``` dart
    Future<void> initMateDataState() async {
        String mateData;
        try {
          mateData = await FlutterMetaData.getMetaDataValue("Your Channel");
        } on PlatformException {
          mateData = 'Failed to get mata data.';
        }
    }
```

---

### This Plugin only used for `Android` , The `iOS` return `NULL`