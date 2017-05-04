//
//  FTContactJsonModel.h
//  fitternity
//
//  Created by Amanpreet Singh on 30/11/15.
//  Copyright © 2015 kuliza. All rights reserved.
//

#import "JSONModel.h"

@interface FTContactJsonModel : JSONModel
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *website;
@end
