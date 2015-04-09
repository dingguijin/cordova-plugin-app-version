#import "AppVersion.h"
#import <Cordova/CDVPluginResult.h>

@implementation AppVersion

- (void)getVersionNumber:(CDVInvokedUrlCommand*)command
{
    NSString* callbackId = command.callbackId;
    NSString* version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    if (version == nil) {
      NSLog(@"CFBundleShortVersionString was nil, attempting CFBundleVersion");
      version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
      if (version == nil) {
        NSLog(@"CFBundleVersion was also nil, giving up");
        // not calling error callback here to maintain backward compatibility
      }
    }

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:version];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

- (void)getBundleIdentifier:(CDVInvokedUrlCommand*)command
{
    NSString* callbackId = command.callbackId;
    NSString* bid = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    if (bid == nil) {
        NSLog(@"CFBundleIdentifier nil, giving up");
    }

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:bid];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

- (void)getBundleDisplayName:(CDVInvokedUrlCommand*)command
{
    NSString* callbackId = command.callbackId;
    NSString* name = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    if (name == nil) {
        NSLog(@"CFBundleDisplayName nil, giving up");
    }

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:name];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

@end
