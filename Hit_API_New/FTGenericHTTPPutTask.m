//
//  ULGenericHTTPPutTask.m
//  Catalog-App
//
//  Created by kuliza on 12/5/14.
//  Copyright (c) 2014 Urban Ladder. All rights reserved.
//

#import "FTGenericHTTPPutTask.h"
#import "NetworkConstants.h"

@implementation FTGenericHTTPPutTask

- (BOOL)isDBRequired {
    return NO;
}

- (NSString *)callType {
    return PUT;
}

@end
