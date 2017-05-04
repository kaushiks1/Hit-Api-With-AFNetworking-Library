//
//  FTAutoSuggestedResultsJsonModel.h
//  fitternity
//
//  Created by Amanpreet Singh on 29/11/15.
//  Copyright © 2015 kuliza. All rights reserved.
//

#import "JSONModel.h"
#import "FTAutoSuggestedObjectJsonModel.h"

@protocol FTAutoSuggestedResultsJsonModel;

@interface FTAutoSuggestedResultsJsonModel : JSONModel
@property (nonatomic, strong) NSString *keyword;
@property (nonatomic, strong) FTAutoSuggestedObjectJsonModel *object;
@property (nonatomic, strong) NSString *object_type;
@end
