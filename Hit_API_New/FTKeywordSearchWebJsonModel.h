//
//  FTKeywordSearchWebJsonModel.h
//  fitternity
//
//  Created by Amanpreet Singh on 30/11/15.
//  Copyright © 2015 kuliza. All rights reserved.
//

#import "JSONModel.h"
#import "FTGeolocationJsonModel.h"
#import "FTContactJsonModel.h"

@interface FTKeywordSearchWebJsonModel : JSONModel
@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSArray *categorytags;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSArray *locationtags;
@property (nonatomic, strong) NSNumber *average_rating;
@property (nonatomic, strong) NSString *membership_discount;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *info_service;
@property (nonatomic, strong) NSArray *info_service_list;
@property (nonatomic, strong) NSString *coverimage;
@property (nonatomic, strong) NSNumber *commercial_type;
@property (nonatomic, strong) NSNumber *business_type;
@property (nonatomic, strong) NSString *fitternityno;
@property (nonatomic, strong) NSArray *facilities;
@property (nonatomic, strong) NSString *logo;
@property (nonatomic, strong) NSArray *offerings;
@property (nonatomic, strong) NSString *price_range;
@property (nonatomic, strong) NSNumber *popularity;
@property (nonatomic, strong) NSString *special_offer_title;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSNumber *total_rating_count;
@property (nonatomic, strong) NSNumber *views;
@property (nonatomic, strong) NSNumber *instantbooktrial_status;
@property (nonatomic, strong) NSArray *photos;
@property (nonatomic, strong) NSString *locationcluster;
@property (nonatomic, strong) NSNumber *price_rangeval;
@property (nonatomic, strong) NSArray *servicelist;
@property (nonatomic, strong) NSArray *servicephotos;
@property (nonatomic, strong) NSNumber *finder_type;
@property (nonatomic, strong) FTGeolocationJsonModel *geolocation;
@property (nonatomic, strong) FTContactJsonModel *contact;
@end
