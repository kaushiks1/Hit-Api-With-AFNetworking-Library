//
//  FTGeolocationJsonModel.m
//  fitternity
//
//  Created by Amanpreet Singh on 30/11/15.
//  Copyright © 2015 kuliza. All rights reserved.
//

#import "FTGeolocationJsonModel.h"

@implementation FTGeolocationJsonModel
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"long": @"longitude"}];
}
@end
