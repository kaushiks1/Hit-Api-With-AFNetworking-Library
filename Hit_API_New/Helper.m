//
//  Helper.m
//  fitternity
//
//  Created by Nagendra Chowdary on 07/11/2015.
//  Copyright © 2015 kuliza. All rights reserved.
//

#import "Helper.h"
//#import <BBBadgeBarButtonItem/BBBadgeBarButtonItem.h>
#import "UIColor+FitternityColor.h"
#import "AppConstants.h"
#import "FTTask.h"
#import "RequestManager.h"
//#import "FTJBookMarkFinder.h"
#import "UIFont+FitternityFont.h"
#import "FTUserDefaults.h"
//#import "HomeViewController.h"
@implementation Helper

+(NSString *) getDateFormatFromDateString:(NSString *)dateAPI withFormat:(NSDateFormatter *)wFormat toFormat:(NSDateFormatter *)tFormat{

    NSDate *dated = [wFormat dateFromString:dateAPI];

    NSString *newDate = [tFormat stringFromDate:dated];
    
    return  newDate;
}

+(CGFloat)findWidthOfString:(NSString *)title font:(UIFont *)font{
    return [title sizeWithAttributes:@{NSFontAttributeName:font}].width + 1;
}

+(NSMutableAttributedString *) noncolorString:(NSString *)nonColorString colorString:(NSString *)colorString color:(UIColor *)color{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@", nonColorString, colorString]];
    
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, nonColorString.length)];
    
    [attString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(nonColorString.length, colorString.length)];
    
    return attString;
}

+(CGFloat)heightForWidth:(CGFloat)width usingLabel:(UILabel *)label
{
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGSize labelSize = (CGSize){width, FLT_MAX};
    CGRect r = [label.text boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: label.font} context:context];
    return r.size.height;
}

+(NSString *) stringByStrippingHTML:(NSString *)htmlString{
    NSRange r;
    while ((r = [htmlString rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        htmlString = [htmlString stringByReplacingCharactersInRange:r withString:@""];
    
    return htmlString;
}

+(NSString *) stringByStrippingHTMLListTags:(NSString *) htmlString
{
    NSString *removeTag0 = [htmlString stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *removeTag1 = [removeTag0 stringByReplacingOccurrencesOfString:@"<ul><li>" withString:@" "];
    NSString *removeTag2 = [removeTag1 stringByReplacingOccurrencesOfString:@"</li><li>" withString:@" "];
    NSString *removeTag3 = [removeTag2 stringByReplacingOccurrencesOfString:@"</li></ul>" withString:@" "];
    NSString *removeTag4 = [removeTag3 stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
    NSString *removeTag5 = [removeTag4 stringByReplacingOccurrencesOfString:@" and " withString:@""];
    NSString *removeTag6 = [removeTag5 stringByReplacingOccurrencesOfString:@"<strong>" withString:@""];
    NSString *removeTag7 = [removeTag6 stringByReplacingOccurrencesOfString:@"</strong>" withString:@""];
    NSString *removeTag8 = [removeTag7 stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    NSString *removeTag9 = [removeTag8 stringByReplacingOccurrencesOfString:@"</p><p>" withString:@" "];
    NSString *removeTag10 = [removeTag9 stringByReplacingOccurrencesOfString:@"</p>" withString:@" "];
    NSString *removeTag11 = [removeTag10 stringByReplacingOccurrencesOfString:@"&#39;" withString:@"'"];
    NSString *removeTag12 = [removeTag11 stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];

    return removeTag12;
}

+(NSString *) stringByStrippingHTMLTags:(NSString *) htmlString
{
    NSString *removeTag1 = [htmlString stringByReplacingOccurrencesOfString:@"<ul><li>" withString:@" "];
    NSString *removeTag2 = [removeTag1 stringByReplacingOccurrencesOfString:@"</li><li>" withString:@" "];
    NSString *removeTag3 = [removeTag2 stringByReplacingOccurrencesOfString:@"</li></ul>" withString:@" "];
    NSString *removeTag4 = [removeTag3 stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
    NSString *removeTag5 = [removeTag4 stringByReplacingOccurrencesOfString:@" and " withString:@""];
    NSString *removeTag6 = [removeTag5 stringByReplacingOccurrencesOfString:@"<strong>" withString:@""];
    NSString *removeTag7 = [removeTag6 stringByReplacingOccurrencesOfString:@"</strong>" withString:@""];
    NSString *removeTag8 = [removeTag7 stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    NSString *removeTag9 = [removeTag8 stringByReplacingOccurrencesOfString:@"</p>" withString:@""];
    NSString *removeTag10 = [removeTag9 stringByReplacingOccurrencesOfString:@"</p><p>" withString:@" "];
    NSString *removeTag11 = [removeTag10 stringByReplacingOccurrencesOfString:@"&#39;" withString:@"'"];
    NSString *removeTag12 = [removeTag11 stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    
    return removeTag12;
}

+ (NSArray<NSString *> *) stringByStrippingByList:(NSString *) htmlString
{
    NSString *removeTag1 = [htmlString stringByReplacingOccurrencesOfString:@"<ul>" withString:@""];
    NSString *removeTag2 = [removeTag1 stringByReplacingOccurrencesOfString:@"</ul>" withString:@""];
    NSString *removeTag3 = [removeTag2 stringByReplacingOccurrencesOfString:@"<li>" withString:@""];
    NSString *removeTag4 = [removeTag3 stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    NSString *removeTag5 = [removeTag4 stringByReplacingOccurrencesOfString:@"</p>" withString:@""];

    NSString *removeTag6 = [removeTag5 stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
    
    NSArray<NSString *> *splittedStrings = [removeTag6 componentsSeparatedByString:@"</li>"];
    
    return [splittedStrings filteredArrayUsingPredicate:
            [NSPredicate predicateWithFormat:@"length > 0"]];
}




+(BOOL)isValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

+(BOOL) isValidPhone:(NSString *) checkString
{
    NSString *phoneRegex = @"^((\\+)|(00))[0-9]{6,14}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:checkString];
}

+(void) makeAlert:(NSString *) msg withTitle:(NSString *) title
{    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

+(UIActivityIndicatorView *)getActivityView:(UIView *)parentView withStyle:(UIActivityIndicatorViewStyle ) style{
    
    UIActivityIndicatorView *activityIndicator= [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    activityIndicator.tag=100;
    activityIndicator.center = parentView.center;
    activityIndicator.activityIndicatorViewStyle = style;
    CGAffineTransform transform = CGAffineTransformMakeScale(1.75f, 1.75f);
    activityIndicator.transform = transform;
    [parentView addSubview:activityIndicator];
    [parentView bringSubviewToFront:activityIndicator];
    return  activityIndicator;
}

+(void)navigationHeaderWithBackButton:(UIViewController *)mainController selector:(SEL)action
{
    //bar 20 14
    /*UIButton *sideButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0,40,40)];
    [sideButton setImageEdgeInsets:UIEdgeInsetsMake(13, 0, 13, 20)];
    [sideButton setImage:[UIImage imageNamed:@"filter_backbtn"]  forState:UIControlStateNormal];
    [sideButton addTarget:mainController action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* sideMenuButton3 = [[UIBarButtonItem alloc] initWithCustomView:sideButton];
    [sideMenuButton3 setStyle:UIBarButtonItemStylePlain];
    
    NSMutableArray *buttonArray = [NSMutableArray arrayWithObjects:sideMenuButton3, nil];
    
    mainController.navigationItem.leftBarButtonItems = buttonArray;*/
    
}
+(void)navigationHeaderWithCrossButton:(UIViewController *)mainController selector:(SEL)action
{
    //bar 20 14
    UIButton *sideButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0,40,41)];
    [sideButton setImageEdgeInsets:UIEdgeInsetsMake(13, 2, 13, 24)];
    [sideButton setImage:[UIImage imageNamed:@"closeBtn"]  forState:UIControlStateNormal];
    [sideButton addTarget:mainController action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* sideMenuButton3 = [[UIBarButtonItem alloc] initWithCustomView:sideButton];
    [sideMenuButton3 setStyle:UIBarButtonItemStylePlain];
    
    NSMutableArray *buttonArray = [NSMutableArray arrayWithObjects:sideMenuButton3, nil];
    
    mainController.navigationItem.leftBarButtonItems = buttonArray;
    
}

+(UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+(void)navigationHeaderUpdateWithHomeScreenButtons:(UIViewController *)mainController withActions:(NSArray *) action withNotifications:(NSString *) num
{
    UIButton *searchButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0,18,19)];
    [searchButton setBackgroundImage:[UIImage imageNamed:@"search_black_icon"]  forState:UIControlStateNormal];
    [searchButton addTarget:mainController action:NSSelectorFromString(action[0]) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *fixedItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedItem.width = 0.0f;
    
    UIBarButtonItem* searchBarButton = [[UIBarButtonItem alloc] initWithCustomView:searchButton];
    [searchBarButton setStyle:UIBarButtonItemStylePlain];
    
    NSMutableArray *buttonArray2 = [NSMutableArray arrayWithObjects:fixedItem,searchBarButton, nil];
    mainController.navigationItem.rightBarButtonItems = buttonArray2;
}

+(void)navigationHeaderWithHomeScreenButtons:(UIViewController *)mainController withActions:(NSArray *) actions withNotifications:(NSString *) num{
    //bar
    UIButton *logo =[[UIButton alloc] initWithFrame:CGRectMake(0, 0,14,21)];
    [logo setBackgroundImage:[UIImage imageNamed:@"f_logo_yellow"]  forState:UIControlStateNormal];
    [logo setEnabled:NO];
    [logo setUserInteractionEnabled:NO];
    
    UIButton *sideButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0,18,13)];
    [sideButton setBackgroundImage:[UIImage imageNamed:@"menu_icon"]  forState:UIControlStateNormal];
    [sideButton addTarget:mainController action:NSSelectorFromString(actions[0]) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* sideMenuButton3 = [[UIBarButtonItem alloc] initWithCustomView:sideButton];
    [sideMenuButton3 setStyle:UIBarButtonItemStylePlain];
    
    UIBarButtonItem* logoBarButton = [[UIBarButtonItem alloc] initWithCustomView:logo];
    [logoBarButton setStyle:UIBarButtonItemStylePlain];
    
    UIBarButtonItem *fixedItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedItem.width = 0.0f;
    
    NSMutableArray *buttonArray = [NSMutableArray arrayWithObjects:sideMenuButton3,fixedItem,logoBarButton, nil];
    
    mainController.navigationItem.leftBarButtonItems = buttonArray;
    
    UIButton *searchButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0,18,19)];
    [searchButton setBackgroundImage:[UIImage imageNamed:@"search_black_icon"]  forState:UIControlStateNormal];
    [searchButton addTarget:mainController action:NSSelectorFromString(actions[1]) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* searchBarButton = [[UIBarButtonItem alloc] initWithCustomView:searchButton];
    [searchBarButton setStyle:UIBarButtonItemStylePlain];
    
//    UIButton *notifButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0,19,22)];
//    [notifButton setBackgroundImage:[UIImage imageNamed:@"notification_black_icon"]  forState:UIControlStateNormal];
//    [notifButton addTarget:mainController action:NSSelectorFromString(actions[2]) forControlEvents:UIControlEventTouchUpInside];
//    BBBadgeBarButtonItem *barButton = [[BBBadgeBarButtonItem alloc] initWithCustomUIButton:notifButton];
//    barButton.badgeBGColor = [UIColor getYellowColor];
//    barButton.badgeValue = num;
//    barButton.shouldHideBadgeAtZero = YES;
//    barButton.badgeFont = [UIFont getFitternityRegularFont:10.0];
//    barButton.badgeTextColor = [UIColor whiteColor];
    NSMutableArray *buttonArray2 = [NSMutableArray arrayWithObjects:fixedItem,searchBarButton, nil];
    mainController.navigationItem.rightBarButtonItems = buttonArray2;
}

+(void)navigationHeaderUpdateWithHomeScreenButtons:(UIViewController *)mainController locationName: (NSString *)locationName areaName: (NSString *)areaName withAreaSelectionAction:(NSArray *) action
{
    
}

+(UINavigationController *) getPresentViewController:(NSString *) controllerName fromStoryBoard:(NSString *) storyBoardName{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    UINavigationController *navBar = [[UINavigationController alloc] initWithRootViewController:[storyBoard instantiateViewControllerWithIdentifier:controllerName]];
    return navBar;
}

+(void) putStatusBarColor:(UIColor *) color{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 20)];
    view.backgroundColor=[UIColor getYellowColor];
    [[[UIApplication sharedApplication] keyWindow] addSubview:view];
    [[[UIApplication sharedApplication] keyWindow] bringSubviewToFront:view];

}

/*+(UINavigationController *) navigateToHomeScreen{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:HOME_STORYBOARD bundle:nil];
    
    REFrostedViewController *frostedViewCont = [[REFrostedViewController alloc] initWithContentViewController:[storyBoard instantiateViewControllerWithIdentifier:HOME_NAV_CONTROLLER] menuViewController:[storyBoard instantiateViewControllerWithIdentifier:SIDE_MENU_NAV_CONTROLLER]];
    UINavigationController *navBar = [[UINavigationController alloc] initWithRootViewController:frostedViewCont];
    navBar.navigationBarHidden = YES;
    return navBar;
}*/

/*+(UINavigationController *) navigateToOffersScreen{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:HOME_STORYBOARD bundle:nil];
    
    HomeViewController *homeVC = [storyBoard instantiateViewControllerWithIdentifier:HOME_CONTROLLER];
    homeVC.openOfferTab  = YES;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:homeVC];

    
    REFrostedViewController *frostedViewCont = [[REFrostedViewController alloc] initWithContentViewController:navigationController menuViewController:[storyBoard instantiateViewControllerWithIdentifier:SIDE_MENU_NAV_CONTROLLER]];
    UINavigationController *navBar = [[UINavigationController alloc] initWithRootViewController:frostedViewCont];
    navBar.navigationBarHidden = YES;
    return navBar;
}*/

/*+(UINavigationController *) navigateToDiscoverScreen{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:HOME_STORYBOARD bundle:nil];
    
    HomeViewController *homeVC = [storyBoard instantiateViewControllerWithIdentifier:HOME_CONTROLLER];
    homeVC.showDiscoverScreen  = YES;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    
    REFrostedViewController *frostedViewCont = [[REFrostedViewController alloc] initWithContentViewController:navigationController menuViewController:[storyBoard instantiateViewControllerWithIdentifier:SIDE_MENU_NAV_CONTROLLER]];
    UINavigationController *navBar = [[UINavigationController alloc] initWithRootViewController:frostedViewCont];
    navBar.navigationBarHidden = YES;
    return navBar;
}*/


+(NSString *) getOffersImageBaseUrl{
    return @"https://b.fitn.in/";
}

+(NSString *) getCategoryImageBaseUrl{
    return @"https://b.fitn.in/iconsv1/";
}
+(NSString *) getCollectionsImageBaseUrl{
    return @"https://b.fitn.in/c/collections/";
}

+(NSString *) getSelectedVenderImageUrl{
    return @"https://b.fitn.in/f/c/";
}

+(NSString *) getOffersTabBannerImageBaseUrl{
    return @"https://b.fitn.in/o/b/";
}

+(NSString *) getOffersTabBannerIconBaseUrl{
    return @"https://b.fitn.in/o/i/";
}

+(NSArray *) splitTheSentence:(NSString *) name{
    __block NSString *lastWord = nil;
    __block NSString *firstWord = nil;
    [name enumerateSubstringsInRange:NSMakeRange(0, [name length]) options:NSStringEnumerationByWords | NSStringEnumerationReverse usingBlock:^(NSString *substring, NSRange subrange, NSRange enclosingRange, BOOL *stop) {
        lastWord = substring;
        firstWord = [name stringByReplacingOccurrencesOfString:lastWord withString:@""];
        *stop = YES;
    }];
    return @[firstWord,lastWord];
}

+(NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)dateFormat{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"IST"]];
   // [formatter setLocale:[NSLocale systemLocale]];
    [formatter setDateFormat:dateFormat];
    /*** exception crash issue******/
    if([formatter dateFromString:dateString]==nil)

        return [NSDate date];
    
    return  [formatter dateFromString:dateString];
    

}

+ (NSString*)stringFromDate:(NSDate*)date inFormat:(NSString*)requiredFormat{
    
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    [df setDateFormat:requiredFormat];
    return  [df stringFromDate:date];

}

+ (NSArray*)timeUnitPassedbetween:(NSDate*)laterDate andPreviousDate:(NSDate*)previousDate{
    
    NSDate *startDate = previousDate;
    NSDate *endDate = laterDate;
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekOfMonth | NSCalendarUnitHour | NSCalendarUnitMinute
                                                        fromDate:startDate
                                                          toDate:endDate
                                                         options:NSCalendarWrapComponents];
    
    NSInteger year = [components year];
    NSInteger month = [components month];
   // NSInteger week = [components weekday];
    NSInteger days = [components day];
    NSInteger hour = [components hour];
    NSInteger minutes = [components minute];
    NSString *stringToUse;
    if (year > 0) {
        if (year==1) {
            stringToUse = @"year";
        }else{
            stringToUse = @"years";
        }
        return [NSArray arrayWithObjects:[NSNumber numberWithInteger:year],stringToUse, nil];
    }if (month>0) {
        if (year==1) {
            stringToUse = @"month";
        }else{
            stringToUse = @"months";
        }
        return [NSArray arrayWithObjects:[NSNumber numberWithInteger:month],stringToUse, nil];
    }
    if (days>0) {
        if (days>7) {
            if (days>14) {
                stringToUse = @"weeks";
            }else{
                stringToUse= @"week";
            }
            return [NSArray arrayWithObjects:[NSNumber numberWithInteger:days%7],stringToUse,nil];
        }else{
            if (days == 1) {
                stringToUse = @"day";
            }else{
                stringToUse = @"days";
            }
            return [NSArray arrayWithObjects:[NSNumber numberWithInteger:days],stringToUse,nil];
        }
    }if (hour>0) {
        if (hour == 1) {
            stringToUse = @"hour";
        }else{
            stringToUse = @"hours";
        }
        return [NSArray arrayWithObjects:[NSNumber numberWithInteger:hour],stringToUse,nil];
    }
    if (minutes>=0) {
        if (minutes <= 1) {
            stringToUse = @"minute";
        }else{
            stringToUse = @"minutes";
        }
    }
    return [NSArray arrayWithObjects:[NSNumber numberWithInteger:minutes],stringToUse,nil];

    
}

+ (NSDate *)addDays:(NSInteger)days toDate:(NSDate *)originalDate {
    NSDateComponents *components= [[NSDateComponents alloc] init];
    [components setDay:days];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar dateByAddingComponents:components toDate:originalDate options:0];
}

+ (NSInteger) dayOfMonth:(NSDate *)date{
    NSDateComponents *comps = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    
    NSInteger dayOfMonth = [comps day];
    return dayOfMonth;
}

+ (NSInteger) weekDayOfDate:(NSDate *) date{
    NSDateComponents *comps = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay | NSCalendarUnitWeekday fromDate:date];
    
    NSInteger dayOfMonth = [comps weekday];
    return dayOfMonth;

}

+ (NSString *) monthOfDate:(NSDate *) date{
//    NSDateComponents *comps = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay | NSCalendarUnitWeekday fromDate:date];
//    
//    NSString *monthDate = [comps month];
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MMM"];
   // NSDate *now = [[NSDate alloc] init];
    NSString *dateString = [format stringFromDate:date];
    return dateString;
    
   // return monthDate;
    
}

+ (NSString *) getSortWeekDayFromDate:(NSDate *) date{
    NSInteger weekDay = [self weekDayOfDate:date];
    NSString *sortWeekDayName = @"";
    switch (weekDay) {
        case 1:
            // Sunday
            sortWeekDayName = FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_SUNDAY;
            break;
        case 2:{
            // Monday
            sortWeekDayName = FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_MONDAY;
        }
            break;
        case 3:
            // Tuesday
            sortWeekDayName = FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_TUESDAY;
            break;
        case 4:{
            // Wednesday
            sortWeekDayName = FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_WEDNESDAY;
        }
            break;
        case 5:
            // Thursday
            sortWeekDayName = FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_THURSDAY;
            break;
        case 6:{
            // Friday
            sortWeekDayName = FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_FRIDAY;
        }
            break;
        case 7:{
            // Saturday
            sortWeekDayName = FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_SATURDAY;
        }
            break;
        default:
            break;
    }
    return sortWeekDayName;
}

+ (NSString *) suffixForDay:(NSInteger) day{
    // Finding suffix for date
    NSString *suffix_string = @"|st|nd|rd|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|st|nd|rd|th|th|th|th|th|th|th|st";
    NSArray *suffixes = [suffix_string componentsSeparatedByString: @"|"];
    NSString *suffix = [suffixes objectAtIndex:day];
    return suffix;
}

+(void) addStatusBar:(UIViewController *) mainVC{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 20)];
    view.backgroundColor=[UIColor getYellowColor];
    [mainVC.view addSubview:view];
    [mainVC.view bringSubviewToFront:view];
}

+(NSString *) getCityName:(NSString *) locality{
    NSString *city = @"mumbai";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *cities = [defaults objectForKey:@"userCities"];
    for(int i = 0; i<cities.count; i++){
        if([locality rangeOfString:[cities[i][@"name"] capitalizedString] options:NSCaseInsensitiveSearch].location != NSNotFound){
            city = cities[i][@"name"];
        }else if([locality rangeOfString:@"Bengaluru"].location != NSNotFound) {
            city = @"bangalore";
        }
    }
    
    return city;
}

//+(NSNumber *) getCityIdFromCity:(NSString *) city{
//    NSArray *cities = [[FTUserDefaults shared] getCities];
//    for(int i = 0; i<cities.count; i++){
//        FTUserCityModel *cityModel = cities[i];
//        if([cityModel.cityName isEqualToString:city]){
//            return cityModel.cityId;
//        }
//    }
//    return nil;
//}
+ (NSDate *) combineDateComponentFromDate:(NSDate *) date1 timeComponentFromDate:(NSDate *) date2{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"IST"]];

    // Extract date components into components1
    NSDateComponents *components1 = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                                         fromDate:date1];
    
    // Extract time components into components2
    NSDateComponents *components2 = [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond
                                                         fromDate:date2];
    
    // Combine date and time into components3
    NSDateComponents *components3 = [[NSDateComponents alloc] init];
    
    [components3 setYear:components1.year];
    [components3 setMonth:components1.month];
    [components3 setDay:components1.day];
    
    [components3 setHour:components2.hour];
    [components3 setMinute:components2.minute];
    [components3 setSecond:components2.second];
    
    // Generate a new NSDate from components3.
    NSDate *combinedDate = [calendar dateFromComponents:components3];
    // combinedDate contains both your date and time!
    return combinedDate;
}

+ (NSUInteger )getWeekdayFromDate:(NSDate *) date{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:date];
    NSUInteger weekday = [comps weekday];
    return weekday;
}

+(NSDictionary *) getBase64DecodedDictionary:(NSString *) base64String{
    
    NSArray *stringData = [base64String componentsSeparatedByString:@"."];
    NSData *rawData = [[NSData alloc] initWithBase64EncodedString:stringData[1] options:0];
    
    NSString *decodedString = [[NSString alloc] initWithData:rawData encoding:NSUTF8StringEncoding];
    NSData *objectData = [decodedString dataUsingEncoding:NSUTF8StringEncoding];
    NSError* error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                         options:
                          NSJSONReadingMutableContainers
                                                           error:&error];
    return json;
}

+(BOOL) isUserLoggedIn
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([[[defaults dictionaryRepresentation] allKeys] containsObject:@"userProfile"])
    {
        return YES;
    }
    return NO;
}

+(NSDictionary *) getUserProfileData{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *userData = [NSKeyedUnarchiver unarchiveObjectWithData:[defaults objectForKey:@"userProfile"]];
    return userData;
    
}
+(NSMutableArray *) getSideMenuData:(BOOL) loggedIn
{
    NSDictionary *profileMenu = @{
                            @"name": @"Profile",
                            @"icon": @"name_yellow_icon",
                            };
    NSDictionary *aboutFitternityMenu = @{
                            @"name": @"About Fitternity",
                            @"icon": @"about_icon",
                            };
    
    NSDictionary *favMenu = @{
                            @"name": @"Favorites",
                            @"icon": @"favorites_icon",
                            };
    
    NSDictionary *memberMenu = @{
                            @"name": @"My Membership",
                            @"icon": @"membership_icon",
                            };
    
    NSDictionary *trialsMenu = @{
                            @"name": @"My Trials",
                            @"icon": @"trail_icon",
                            };
    
    NSDictionary *changePwd = @{
                            @"name": @"Change Password",
                            @"icon": @"change_pswd_icon",
                            };
    NSDictionary *notification = @{
                            @"name": @"Notification Settings",
                            @"icon": @"notifications_gear_icon",
                            };
    NSDictionary *logout = @{
                            @"name": @"Logout",
                            @"icon": @"logout_icon",
                            };
    NSDictionary *login = @{
                            @"name": @"Login",
                            @"icon": @"logout_icon",
                            };
    NSDictionary *registerMenu = @{
                            @"name": @"Register",
                            @"icon": @"logout_icon",
                            };
    
    if(loggedIn)
    {
        NSDictionary *userData = [self getUserProfileData];
        if(![userData[@"identity"] isEqualToString:@"email"])
        {
            return [[NSMutableArray alloc ] initWithObjects:
                profileMenu, favMenu, memberMenu, trialsMenu,aboutFitternityMenu,logout,nil];
        }
        else
        {
            return [[NSMutableArray alloc ] initWithObjects:
                    profileMenu, favMenu, memberMenu, trialsMenu,aboutFitternityMenu,changePwd,logout,nil];
        }
    }
    return [[NSMutableArray alloc ] initWithObjects:
            aboutFitternityMenu, login,registerMenu,nil];
}

+ (NSString *) deviceUUID{
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

+(BOOL)callPhoneNumber:(NSString *)phoneNo{
    NSString *phoneNumber = phoneNo;
    NSURL *phoneUrl = [NSURL URLWithString:[@"telprompt://" stringByAppendingString:phoneNumber]];
    NSURL *phoneFallbackUrl = [NSURL URLWithString:[@"tel://" stringByAppendingString:phoneNumber]];

    if ([UIApplication.sharedApplication canOpenURL:phoneUrl]) {
        [UIApplication.sharedApplication openURL:phoneUrl];
        return YES;
    } else if ([UIApplication.sharedApplication canOpenURL:phoneFallbackUrl]) {
        [UIApplication.sharedApplication openURL:phoneFallbackUrl];
        return YES;
    } else {
        return NO;
        // Show an error message: Your device can not do phone calls.
    }
    
}

+(NSArray *)getUserFavoriteList{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:BOOKMARK_LIST];
}

+ (void)saveUserFavoriteList:(NSArray*)userFavoriteList{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userFavoriteList forKey:BOOKMARK_LIST];
}

//+ (void)removeFinderIdFromFavorite:(id)serviceId{
//    NSArray *favoriteList = [Helper getUserFavoriteList];
//    NSMutableArray *newFavoriteList =  [[NSMutableArray alloc] init];
//    for (id favoriteId in favoriteList) {
//        if (![favoriteId isEqualToValue:serviceId]) {
//            [newFavoriteList addObject:favoriteId];
//        }
//    }
//    
//    [Helper saveUserFavoriteList:newFavoriteList];
//    
//    if ([Helper isUserLoggedIn]) {
//        NSDictionary *dict = [Helper getUserProfileData];
//        NSString *userId = dict[@"_id"];
//        if (!userId ||  !serviceId) {
//            return;
//        }
//        FTTask *removeBookMarkTask = [[RequestManager sharedInstance] getRemoveBookmarksForUserId:userId forFinderId:serviceId];
//        [removeBookMarkTask setCompletionhandler:^(NSDictionary *request,FTJBookMarkFinder *response) {
//            [Helper storeBookMarkListInUserDefault:response];
//        } error:^(NSDictionary *request, id response) {
//            NSLog(@"%@",response);
//        }];
//
//    }
//    
//}

//+(void)addFinderIdInFavorite:(id)serviceId{
//    NSArray *favoriteList = [Helper getUserFavoriteList];
//    NSMutableArray *newFavoriteList =  [[NSMutableArray alloc] init];
//    [newFavoriteList addObjectsFromArray:favoriteList];
//    if (![newFavoriteList containsObject:serviceId]) {
//        [newFavoriteList addObject:serviceId];
//
//    }
//    
//    [Helper saveUserFavoriteList:newFavoriteList];
//    
//    if ([Helper isUserLoggedIn]) {
//        NSDictionary *dict = [Helper getUserProfileData];
//        NSString *userId = dict[@"_id"];
//        if (!userId ||  !serviceId) {
//            return;
//        }
//        FTTask *addBookMarkTask = [[RequestManager sharedInstance] getAddBookmarksForUserId:userId forFinderId:serviceId];
//        [addBookMarkTask setCompletionhandler:^(NSDictionary *request,FTJBookMarkFinder *response) {
//            [Helper storeBookMarkListInUserDefault:response];
//        } error:^(NSDictionary *request, id response) {
//            NSLog(@"%@",response);
//        }];
//        
//    }
//}
//
//+(void)fetchAndStoreUserFavoriteList{
//    if([Helper isUserLoggedIn]){
//        NSDictionary *dict = [Helper getUserProfileData];
//        NSString *userId = dict[@"_id"];
//        if (!userId) {
//            return;
//        }
//        FTTask *bookMarkTask = [[RequestManager sharedInstance] getAllBookmarks:userId];
//        [bookMarkTask setCompletionhandler:^(NSDictionary *request,FTJBookMarkFinder *response) {
//            [Helper storeBookMarkListInUserDefault:response];
//                    } error:^(NSDictionary *request, id response) {
//            NSLog(@"%@",response);
//        }];
//        
//    }
//
//}

//+ (void)storeBookMarkListInUserDefault:(FTJBookMarkFinder*)bookmarkList{
//    if ([bookmarkList.bookmarksfinders count]>0) {
//        NSMutableArray *bookMarkList = [bookmarkList.bookmarksfinders valueForKeyPath:@"_id"];
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        [defaults setObject:bookMarkList forKey:BOOKMARK_LIST];
//        
//    }
//}

+ (BOOL)isServiceIdUserFavorite:(id)serviceId{
    BOOL isFavorite = NO;
    if (![Helper isUserLoggedIn]) {
        isFavorite = NO;
    }
    
    NSArray *favoriteList = [Helper getUserFavoriteList];
    if ([favoriteList containsObject:serviceId]) {
        isFavorite = YES;
    }

    return isFavorite;
    
}

+ (UIFont *)boldFont:(UIFont *) font{
    NSString *fontName = [[font.fontName componentsSeparatedByString:@"-"] objectAtIndex:0];
    UIFont *newFont = [UIFont fontWithName:[NSString stringWithFormat:@"%@-Bold",fontName] size:font.pointSize];
    return newFont;
}

+ (UIFont *)italicFont:(UIFont *) font{
    NSString *fontName = [[font.fontName componentsSeparatedByString:@"-"] objectAtIndex:0];
    UIFont *newFont = [UIFont fontWithName:[NSString stringWithFormat:@"%@-Italic",fontName] size:font.pointSize];
    return newFont;
}

+(NSUInteger) getWeekDayNumber:(NSString *) weekday{
    NSUInteger day = 0;
    if([weekday isEqualToString:@"sunday"]){
        day = SUNDAY;
    }else if([weekday isEqualToString:@"monday"]){
        day = MONDAY;
    }else if([weekday isEqualToString:@"tuesday"]){
        day = TUESDAY;
    }else if([weekday isEqualToString:@"wednesday"]){
        day = WEDNESDAY;
    }else if([weekday isEqualToString:@"thursday"]){
        day = THURSDAY;
    }else if([weekday isEqualToString:@"friday"]){
        day = FRIDAY;
    }else if([weekday isEqualToString:@"saturday"]){
        day = SATURDAY;
    }
    return day;
}

+(void)getErrorView:(UIView *)parentView errorMessage:(NSString *)errorMsg{
    
    
    UIView *errorView=[[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 44)];
    UILabel* errorMessage;
    errorView.backgroundColor=[UIColor whiteColor];
    if([parentView isMemberOfClass: [UITableView class]] == YES){
    
    errorMessage = [[UILabel alloc] initWithFrame:CGRectMake(10, 64, parentView.frame.size.width - 20,44 )];

    }
    else{
    errorMessage = [[UILabel alloc] initWithFrame:CGRectMake(10, (SCREEN_HEIGHT + 20 - 22)/2.0, SCREEN_WIDTH - 20,44 )];
    }
    if(errorMsg.length !=0)
    {
        errorMessage.text = errorMsg;
    }
    else
    {
        errorMessage.text = @"Sorry Something Went Wrong";
    }
    errorMessage.textAlignment = NSTextAlignmentCenter;
    errorMessage.numberOfLines=0;
    errorMessage.textColor = [UIColor getYellowColor];
    [errorView addSubview:errorMessage];
    [parentView addSubview:errorView];
    [parentView bringSubviewToFront:errorView];
}

+ (void)setupReachability {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusNotReachable) {
            NSLog(@"Offline");
        } else {
            NSLog(@"Online");
        }
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

+ (BOOL)internetIsOn {
    return [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus != AFNetworkReachabilityStatusNotReachable;
}
+(UIAlertView *) makeNetworkAlert{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Network Error" message:@"Your network connection is offline, please check your network connection." delegate:nil cancelButtonTitle:@"Retry" otherButtonTitles:nil, nil];
    return alert;
}

+(NSArray *) getUserCategories:(NSString *) interest
{
    return [interest componentsSeparatedByString:@","];
}

+(NSString *)trimString:(NSString *)string
{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}


+(NSString *)descriptionForObject:(id)objct

{
    
    unsigned int varCount;
    
    NSMutableString *descriptionString = [[NSMutableString alloc]init];
    
    
    
    objc_property_t *vars = class_copyPropertyList(object_getClass(objct), &varCount);
    
    
    
    for (int i = 0; i < varCount; i++)
        
    {
        
        objc_property_t var = vars[i];
        
        
        
        const char* name = property_getName (var);
        
        
        
        NSString *keyValueString = [NSString stringWithFormat:@"n%@ = %@",[NSString stringWithUTF8String:name],[objct valueForKey:[NSString stringWithUTF8String:name]]];
        
        [descriptionString appendString:keyValueString];
        
    }
    
    
    
    free(vars);
    
    return descriptionString;
    
}


@end
