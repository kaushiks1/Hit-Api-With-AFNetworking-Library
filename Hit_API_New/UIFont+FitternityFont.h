//
//  UIFont+FitternityFont.h
//  fitternity
//
//  Created by Nagendra on 10/12/15.
//  Copyright © 2015 kuliza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (FitternityFont)
+(UIFont *) getFitternityRegularFont:(CGFloat) size;
+(UIFont *) getFitternityLightFont:(CGFloat) size;

+(UIFont *) getFitternityLightItalicFont:(CGFloat) size;


+(UIFont *) getFitternityBoldFont:(CGFloat) size;
+(UIFont *) getFitternityRegularItalicFont:(CGFloat)size;

+(UIFont *) getFitternitySemiBoldFont:(CGFloat)size;
@end
