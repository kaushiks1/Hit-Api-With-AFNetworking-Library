//
//  FTAutoSuggestedSearchJsonModel.h
//  fitternity
//
//  Created by Amanpreet Singh on 29/11/15.
//  Copyright © 2015 kuliza. All rights reserved.
//

#import "JSONModel.h"
#import "FTAutoSuggestedResultsJsonModel.h"
#import "FTMetaJsonModel.h"

@interface FTAutoSuggestedSearchJsonModel : JSONModel
@property (nonatomic, strong) NSArray <FTAutoSuggestedResultsJsonModel> *results;
@property (nonatomic, strong) FTMetaJsonModel *meta;
@end
