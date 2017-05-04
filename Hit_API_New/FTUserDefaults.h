//
//  WLUserDefaults.h
//  Wally
//
//  Created by Ashish Prasad on 11/13/15.
//  Copyright © 2015 napkin. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "FTLocationUserDefaultModel.h"
//#import "FTUserProfileUserDefaultModel.h"
//#import "FTUserCityModel.h"
//#import "FTUserAreaModel.h"
@interface FTUserDefaults : NSObject
+ (FTUserDefaults *) shared;

//- (FTLocationUserDefaultModel *) getUserLocationData;
//- (FTUserProfileUserDefaultModel *) getUserProfileData;
//- (NSArray<FTUserCityModel *> *) getCities;
//- (NSArray<FTUserAreaModel *> *) getArea;
- (NSArray *) getCategoryData;

+(NSString *)getUserToken;

@end
