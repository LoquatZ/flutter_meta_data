package com.loquatz.flutter_meta_data

import androidx.annotation.NonNull
import android.app.Application
import android.content.pm.PackageManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterMetaDataPlugin */
class FlutterMetaDataPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var application: Application

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_meta_data")
    channel.setMethodCallHandler(this)
    application =
      flutterPluginBinding.applicationContext as Application
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      //获取Android MateData
      "getMetaDataValue" -> {
        var metaDataValue: String
        try {
          val appInfo = application.packageManager.getApplicationInfo(
            application.packageName,
            PackageManager.GET_META_DATA
          )
          metaDataValue = appInfo.metaData.getString(call.arguments.toString()).toString()
        } catch (e: PackageManager.NameNotFoundException) {
          metaDataValue = "";
          e.printStackTrace()
        }
        result.success(metaDataValue);
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
