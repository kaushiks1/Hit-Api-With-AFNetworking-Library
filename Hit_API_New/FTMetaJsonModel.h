//
//  FTMetaJsonModel.h
//  fitternity
//
//  Created by Amanpreet Singh on 29/11/15.
//  Copyright © 2015 kuliza. All rights reserved.
//

#import "JSONModel.h"

@interface FTMetaJsonModel : JSONModel
@property (nonatomic, strong) NSNumber *total_records;
@property (nonatomic, strong) NSNumber *number_of_records;
@property (nonatomic, strong) NSNumber *from;
@end
