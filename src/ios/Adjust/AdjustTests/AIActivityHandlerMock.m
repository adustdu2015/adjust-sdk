//
//  AIActivityHandlerMock.m
//  Adjust
//
//  Created by Pedro Filipe on 11/02/14.
//  Copyright (c) 2014 adjust GmbH. All rights reserved.
//

#import "AIActivityHandlerMock.h"
#import "AILoggerMock.h"
#import "AIAdjustFactory.h"

static NSString * const prefix = @"AIActivityHandler ";

@interface AIActivityHandlerMock()

@property (nonatomic, strong) AILoggerMock *loggerMock;

@end

@implementation AIActivityHandlerMock

@synthesize environment;
@synthesize bufferEvents;
@synthesize trackMacMd5;
@synthesize delegate;
@synthesize isIad;

- (id)initWithAppToken:(NSString *)yourAppToken {
    self = [super init];
    if (self == nil) return nil;

    self.loggerMock = (AILoggerMock *) [AIAdjustFactory logger];

    [self.loggerMock test:[prefix stringByAppendingFormat:@"initWithAppToken yourAppToken:%@", yourAppToken]];

    return self;
}

- (void)setSdkPrefix:(NSString *)sdkPrefix {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"setSdkPrefix sdkPrefix:%@", sdkPrefix]];
}

- (void)trackSubsessionStart {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"trackSubsessionStart"]];
}
- (void)trackSubsessionEnd {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"trackSubsessionEnd"]];
}

- (void)trackEvent:(NSString *)eventToken
    withParameters:(NSDictionary *)parameters {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"trackEvent eventToken:%@ parameters:%@", eventToken, parameters]];
}

- (void)trackRevenue:(double)amount
       transactionId:(NSString *)transactionId
            forEvent:(NSString *)eventToken
      withParameters:(NSDictionary *)parameters {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"trackRevenue amount:%f eventToken:%@ parameters:%@", amount, eventToken, parameters]];
}

- (void)finishedTrackingWithResponse:(AIResponseData *)response deepLink:(NSString *)deepLink{
    [self.loggerMock test:[prefix stringByAppendingFormat:@"finishedTrackingWithResponse response:%@", response]];
}

- (void)setEnabled:(BOOL)enabled {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"setEnabled enabled:%d", enabled]];
}

- (BOOL)isEnabled {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"isEnabled"]];
    return YES;
}

- (void)readOpenUrl:(NSURL *)url {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"readOpenUrl"]];
}

- (void)savePushToken:(NSData *)pushToken {
    [self.loggerMock test:[prefix stringByAppendingFormat:@"savePushToken"]];
}

@end
