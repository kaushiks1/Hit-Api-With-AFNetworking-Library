//
//  FTLocationJsonModel.h
//  fitternity
//
//  Created by Amanpreet Singh on 29/11/15.
//  Copyright © 2015 kuliza. All rights reserved.
//

#import "JSONModel.h"

@protocol FTLocationJsonModel;

@interface FTLocationJsonModel : JSONModel
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, strong) NSNumber *lat;
@property (nonatomic, strong) NSNumber *longitude;
@end
