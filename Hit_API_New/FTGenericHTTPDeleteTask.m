//
//  ULGenericHTTPDeleteTask.m
//  Catalog-App
//
//  Created by Sachidanand on 22/12/2014.
//  Copyright (c) 2014 Urban Ladder. All rights reserved.
//

#import "FTGenericHTTPDeleteTask.h"
#import "NetworkConstants.h"

@implementation FTGenericHTTPDeleteTask

- (BOOL)isDBRequired {
    return NO;
}

- (NSString *)callType {
    return DELETE;
}


@end
