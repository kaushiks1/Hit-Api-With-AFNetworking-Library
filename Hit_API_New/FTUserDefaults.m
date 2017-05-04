//
//  WLUserDefaults.m
//  Wally
//
//  Created by Ashish Prasad on 11/13/15.
//  Copyright © 2015 napkin. All rights reserved.
//

#import "FTUserDefaults.h"
#import "Helper.h"
#import "AppConstants.h"

@implementation FTUserDefaults


+ (FTUserDefaults *) shared{
    static FTUserDefaults *userDefaults = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userDefaults = [[FTUserDefaults alloc] init];
    });
    return userDefaults;
}

-(instancetype)init __attribute__((unavailable("init not available"))){
    self = [super init];
    if (self) {

        
    }
    return self;
}


//- (FTLocationUserDefaultModel *) getUserLocationData
//{
//    NSData *newData = [[NSUserDefaults standardUserDefaults] objectForKey:USER_LOCATION];
//    NSDictionary *locationDictData = [NSKeyedUnarchiver unarchiveObjectWithData:newData];
//    
//    FTLocationUserDefaultModel *location = [[FTLocationUserDefaultModel alloc] initWithDict:locationDictData];
//    return location;
//}
//
//
//- (FTUserProfileUserDefaultModel *) getUserProfileData{
//    NSDictionary *profileData = [Helper getUserProfileData];
//    FTUserProfileUserDefaultModel *userModel = [[FTUserProfileUserDefaultModel alloc] initWithDict:profileData];
//    return userModel;
//}
//
//- (NSArray<FTUserCityModel *> *) getCities
//{
//    NSArray *cities = [[NSUserDefaults standardUserDefaults] objectForKey:USER_CITIES];
//    
//    NSMutableArray<FTUserCityModel *> *allCities = [[NSMutableArray alloc] init];
//    for (NSDictionary *city in cities)
//    {
//        FTUserCityModel *cityModel = [[FTUserCityModel alloc] initWithDict:city];
//        [allCities addObject:cityModel];
//    }
//    
//    return [allCities copy];
//}
//
//- (NSArray<FTUserAreaModel *> *) getArea
//{
//    NSArray *area = [[NSUserDefaults standardUserDefaults] objectForKey:USER_AREA];
//    
//    NSMutableArray<FTUserAreaModel *> *allCities = [[NSMutableArray alloc] init];
//    NSLog(@"FTUserAreaModel allCities >>>> %@",allCities);
////    for (NSDictionary *city in area)
////    {
////        FTUserAreaModel *areaModel = [[FTUserAreaModel alloc] initWithDict:city];
////        [allCities addObject:areaModel];
////    }
//    
//    return [allCities copy];
//}

- (NSArray *) getCategoryData
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:USER_CATEGORIES];
}

+(NSString *)getUserToken
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults stringForKey:@"userToken"];
}

@end
