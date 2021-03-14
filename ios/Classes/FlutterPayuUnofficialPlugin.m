#import "FlutterPayuUnofficialPlugin.h"
#if __has_include(<flutter_payu_unofficial/flutter_payu_unofficial-Swift.h>)
#import <flutter_payu_unofficial/flutter_payu_unofficial-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_payu_unofficial-Swift.h"
#endif

@implementation FlutterPayuUnofficialPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPayuUnofficialPlugin registerWithRegistrar:registrar];
}
@end
