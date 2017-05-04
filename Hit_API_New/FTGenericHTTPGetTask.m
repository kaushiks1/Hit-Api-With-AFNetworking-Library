//
//  ULGenericHTTPGetTask.m
//  Catalog-App
//
//  Created by Kuliza on 10/20/14.
//  Copyright (c) 2014 Urban Ladder. All rights reserved.
//

#import "FTGenericHTTPGetTask.h"
#import "NetworkConstants.h"

@implementation FTGenericHTTPGetTask

#pragma mark - Custom Accessors

- (BOOL)isDBRequired {
    return NO;
}

- (NSString *)callType {
    return GET;
}


@end
