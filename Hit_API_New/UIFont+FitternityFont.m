//
//  UIFont+FitternityFont.m
//  fitternity
//
//  Created by Nagendra on 10/12/15.
//  Copyright © 2015 kuliza. All rights reserved.
//

#import "UIFont+FitternityFont.h"

@implementation UIFont (FitternityFont)

+(UIFont *) getFitternityRegularFont:(CGFloat) size{
    return [UIFont fontWithName:@"Roboto-Regular" size:size];
}

+(UIFont *) getFitternityLightFont:(CGFloat) size{
    return [UIFont fontWithName:@"Roboto-Light" size:size];
}
+(UIFont *) getFitternityBoldFont:(CGFloat) size{
    return [UIFont fontWithName:@"Roboto-Bold" size:size];
}

+(UIFont *) getFitternityLightItalicFont:(CGFloat) size{
    return [UIFont fontWithName:@"Roboto-LightItalic" size:size];
}

+(UIFont *) getFitternityRegularItalicFont:(CGFloat)size{
    return [UIFont fontWithName:@"Roboto-Italic" size:size];
}

+(UIFont *) getFitternitySemiBoldFont:(CGFloat)size
{
    return [UIFont fontWithName:@"Roboto-Medium" size:size];
}

@end
