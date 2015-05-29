//
//  AdjustCordova.h
//  Adjust
//
//  Created by Pedro Filipe on 04/03/14.
//  Copyright (c) 2012-2014 adjust GmbH. All rights reserved.
//

#import <Cordova/CDV.h>
#import "Adjust.h"

@interface AdjustCordova : CDVPlugin<AdjustDelegate>

- (void)appDidLaunch:(CDVInvokedUrlCommand *)command;
- (void)trackEvent:(CDVInvokedUrlCommand *)command;
- (void)trackRevenue:(CDVInvokedUrlCommand *)command;
- (void)setFinishedTrackingCallback:(CDVInvokedUrlCommand *)command;
- (void)adjustFinishedTrackingWithResponse:(AIResponseData *)responseData;
- (void)onPause:(CDVInvokedUrlCommand *)command;
- (void)onResume:(CDVInvokedUrlCommand *)command;
- (void)setEnabled:(CDVInvokedUrlCommand *)command;
- (void)isEnabled:(CDVInvokedUrlCommand *)command;

@end
