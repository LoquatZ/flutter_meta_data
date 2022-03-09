#import "FlutterMetaDataPlugin.h"

@implementation FlutterMetaDataPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_meta_data"
            binaryMessenger:[registrar messenger]];
  FlutterMetaDataPlugin* instance = [[FlutterMetaDataPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if([@"getMetaDataValue" isEqualToString:call.method]) {
      result(@"NULL");
  }else{
      result(FlutterMethodNotImplemented);
  }
}

@end
