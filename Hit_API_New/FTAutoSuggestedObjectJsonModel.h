//
//  FTAutoSuggestedObjectJsonModel.h
//  fitternity
//
//  Created by Amanpreet Singh on 29/11/15.
//  Copyright © 2015 kuliza. All rights reserved.
//

#import "JSONModel.h"
#import "FTLocationJsonModel.h"

@interface FTAutoSuggestedObjectJsonModel : JSONModel
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) FTLocationJsonModel *location;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *tag;
@end
