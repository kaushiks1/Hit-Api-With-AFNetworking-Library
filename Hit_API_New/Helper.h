//
//  Helper.h
//  fitternity
//
//  Created by Nagendra Chowdary on 07/11/2015.
//  Copyright © 2015 kuliza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>


#define SCREEN_HEIGHT [[UIScreen mainScreen] applicationFrame].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen] applicationFrame].size.width

typedef NS_ENUM(NSUInteger , WeekDay){
    SUNDAY = 1,
    MONDAY,
    TUESDAY,
    WEDNESDAY,
    THURSDAY,
    FRIDAY,
    SATURDAY
};


@interface Helper : NSObject
+(BOOL)internetIsOn;
+ (void)setupReachability;
+(UIAlertView *) makeNetworkAlert;
+(void)getErrorView:(UIView *)parentView errorMessage:(NSString *)errorMsg;
+(CGFloat)findWidthOfString:(NSString *)title font:(UIFont *)font;
+(NSMutableAttributedString *) noncolorString:(NSString *)nonColorString colorString:(NSString *)colorString color:(UIColor *)color;
+(CGFloat)heightForWidth:(CGFloat)width usingLabel:(UILabel *)label;
+(NSString *) stringByStrippingHTML:(NSString *)htmlString;
+(NSString *) stringByStrippingHTMLListTags:(NSString *) htmlString;
+(NSString *) stringByStrippingHTMLTags:(NSString *) htmlString;
+ (NSArray<NSString *> *) stringByStrippingByList:(NSString *) htmlString;
+(BOOL)isValidEmail:(NSString *)checkString;
+(BOOL) isValidPhone:(NSString *) checkString;
+(void) makeAlert:(NSString *) msg withTitle:(NSString *) title;
+(UIActivityIndicatorView *)getActivityView:(UIView *)parentView withStyle:(UIActivityIndicatorViewStyle ) style;
+(void)navigationHeaderWithBackButton:(UIViewController *)mainController selector:(SEL)action;
+(void)navigationHeaderWithHomeScreenButtons:(UIViewController *)mainController withActions:(NSArray *) actions withNotifications:(NSString *) num;

+(void)navigationHeaderUpdateWithHomeScreenButtons:(UIViewController *)mainController withActions:(NSArray *) action withNotifications:(NSString *) num;

+(UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
+(void) putStatusBarColor:(UIColor *) color;
+(UINavigationController *) getPresentViewController:(NSString *) controllerName fromStoryBoard:(NSString *) storyBoardName;
+(UINavigationController *) navigateToHomeScreen;
+(UINavigationController *) navigateToOffersScreen;
+(UINavigationController *) navigateToDiscoverScreen;
+(NSString *) getCollectionsImageBaseUrl;
+(NSString *) getOffersImageBaseUrl;
+(NSArray *) splitTheSentence:(NSString *) name;
+(NSString *) getSelectedVenderImageUrl;
+ (NSString *) suffixForDay:(NSInteger) day;
+(void) addStatusBar:(UIViewController *) mainVC;
+(NSString *) getCityName:(NSString *) locality;
+(NSDictionary *) getBase64DecodedDictionary:(NSString *) base64String;
+ (NSDate *)addDays:(NSInteger)days toDate:(NSDate *)originalDate ;
+ (NSInteger) dayOfMonth:(NSDate *)date;
+(BOOL) isUserLoggedIn;
+(NSDictionary *) getUserProfileData;
+(NSMutableArray *) getSideMenuData:(BOOL) loggedIn;
+ (NSString *) getSortWeekDayFromDate:(NSDate *) date;
+(NSString *) getCategoryImageBaseUrl;
+ (NSDate*)dateFromString:(NSString*)dateString withFormat:(NSString*)dateFormat;
+(NSString *) getOffersTabBannerIconBaseUrl;
+(NSString *) getOffersTabBannerImageBaseUrl;
+ (NSArray*)timeUnitPassedbetween:(NSDate*)laterDate andPreviousDate:(NSDate*)previousDate;
+(void)navigationHeaderWithCrossButton:(UIViewController *)mainController selector:(SEL)action;
+(NSArray *) getUserCategories:(NSString *) interest;
+ (NSDate *) combineDateComponentFromDate:(NSDate *) date1 timeComponentFromDate:(NSDate *) date2;
+ (NSUInteger )getWeekdayFromDate:(NSDate *) date;
+ (NSString *) deviceUUID;
+ (BOOL)callPhoneNumber:(NSString*)phoneNo;

+ (NSArray*)getUserFavoriteList;

+ (void)removeFinderIdFromFavorite:(id)serviceId;
+ (void)addFinderIdInFavorite:(id)serviceId;
+ (void)fetchAndStoreUserFavoriteList;
+ (BOOL)isServiceIdUserFavorite:(id)serviceId;
+(NSUInteger) getWeekDayNumber:(NSString *) weekday;
+(NSString *) getDateFormatFromDateString:(NSString *)dateAPI withFormat:(NSDateFormatter *)wFormat toFormat:(NSDateFormatter *)tFormat;
+(NSNumber *) getCityIdFromCity:(NSString *) city;
+ (UIFont *)boldFont:(UIFont *) font;
+ (UIFont *)italicFont:(UIFont *) font;

+(NSString *)trimString:(NSString *)string;
+(NSString *)descriptionForObject:(id)objct;
+ (NSString *) monthOfDate:(NSDate *) date;

@end
