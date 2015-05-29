//
//  AIRequestHandlerMock.m
//  Adjust
//
//  Created by Pedro Filipe on 10/02/14.
//  Copyright (c) 2014 adjust GmbH. All rights reserved.
//

#import "AIRequestHandlerMock.h"
#import "AILoggerMock.h"
#import "AIAdjustFactory.h"
#import "AIResponseData.h"

static NSString * const prefix = @"AIRequestHandler ";

@interface AIRequestHandlerMock()

@property (nonatomic, assign) id<AIPackageHandler> packageHandler;
@property (nonatomic, assign) AILoggerMock *loggerMock;

@end

@implementation AIRequestHandlerMock

- (id)initWithPackageHandler:(id<AIPackageHandler>) packageHandler {
    self = [super init];
    if (self == nil) return nil;

    self.packageHandler = packageHandler;
    self.loggerMock = (AILoggerMock *) [AIAdjustFactory logger];

    [self.loggerMock test:[prefix stringByAppendingString:@"initWithPackageHandler"]];

    self.connectionError = NO;

    return self;
}

- (void)sendPackage:(AIActivityPackage *)activityPackage {
    [self.loggerMock test:[prefix stringByAppendingString:@"sendPackage"]];

    NSDictionary *jsonDict;
    AIResponseData *responseData;
    if (self.connectionError) {
        jsonDict = nil;
        responseData = [[AIResponseData alloc] initWithError:@"connection error"];
    } else {
        jsonDict = @{@"tracker_token": @"token",@"tracker_name":@"name"};
        responseData = [[AIResponseData alloc] initWithJsonDict:jsonDict jsonString:@"{\"tracker_token\":\"token\",\"tracker_name\":\"name\"}"];
    }

    [self.packageHandler finishedTrackingActivity:activityPackage withResponse:responseData jsonDict:jsonDict];

    if (self.connectionError) {
        [self.packageHandler closeFirstPackage];
    } else {
        [self.packageHandler sendNextPackage];
    }
}


@end
