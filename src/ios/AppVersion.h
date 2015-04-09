#import <Cordova/CDVPlugin.h>

@interface AppVersion : CDVPlugin

- (void)getVersionNumber:(CDVInvokedUrlCommand*)command;
- (void)getBundleIdentifier:(CDVInvokedUrlCommand*)command;
- (void)getBundleDisplayName:(CDVInvokedUrlCommand*)command;

@end
