//
//  FTGeolocationJsonModel.h
//  fitternity
//
//  Created by Amanpreet Singh on 30/11/15.
//  Copyright © 2015 kuliza. All rights reserved.
//

#import "JSONModel.h"

@interface FTGeolocationJsonModel : JSONModel
@property (nonatomic, strong) NSNumber *lat;
@property (nonatomic, strong) NSNumber *longitude;
@end
