//
//  VyomoNetworkConstants.m
//  Vyomo-CustomerApp
//
//  Created by Amanpreet Singh on 13/08/15.
//  Copyright (c) 2015 Vyomo. All rights reserved.
//

#import "NetworkConstants.h"
#import "AppConstants.h"

@implementation NetworkConstants
NSString *const GET = @"Get";
NSString *const POST = @"Post";
NSString * const PUT = @"PUT";
NSString * const DELETE = @"DELETE";
NSString *const ERROR = @"Error";
NSString *const ERRORCODE = @"ErrorCode";
NSString * const ERRORMSG = @"ErrorMsg";
NSString * const ERRORBODY = @"ErrorBody";
NSString *const RESPONSE = @"Response";
NSString *const RESPONSEOBJECT = @"ResponseObject";
NSString *const REQUEST = @"Request";
NSString *const REQUESTOBJECT = @"RequestObject";
NSString *const MEMBERSHIP_LIST_URL = @"orderhistory/";

NSString *const NETWORK_ERROR_MESSAGE = @"You're not connected to the internet. Please try after some time.";


NSString * const ENVIRONMENT = @"Environment";
NSString * const TEST = @"TEST";
// End Points

#define USE_STAGING_URL 0

#if USE_STAGING_URL
static NSString *const PRODUCTION_BASE_URL = @"http://apistg.fitn.in/";
#else
static NSString *const PRODUCTION_BASE_URL = @"http://a1.fitternity.com/";
#endif

//NSString *const PRODUCTION_BASE_URL = @"https://a1.fitternity.com/";
NSString *const STAGE_BASE_URL = @"http://appstg.fitn.in/";
NSString *const CUSTOMER_REGISTER = @"customerregister";
NSString *const CUSTOMER_LOGIN = @"customerlogin";
NSString *const NOTIFICATION_SETTING = @"customer/update";

NSString *const rankFinderUrl = @"getrankedfinder";
/*NSString *const keywordSearchUrl = @"keywordsearchweb";*/
NSString *const keywordSearchUrl = @"keywordsearchwebv1"; //Modified 30th April 2016-Jagprit
NSString *const searchAutoSuggestedUrl = @"search/getautosuggestresults1";
NSString *const searchAutoSuggestedUrlHomeScreen = @"locationcity/";


NSString *const searchImageBaseUrl = @"https://b.fitn.in/f/g/thumbs/";
NSString *const fullImageBaseUrl = @"https://b.fitn.in/f/g/full/";
NSString *const vendorDetailImageBaseUrl = @"https://b.fitn.in/f/c/";
NSString *const vendorDetailLogoBaseUrl = @"https://b.fitn.in/f/l/";

NSString *const HOME_SUB_URL = @"homev2/";

NSString *const HOME_URL = @"customer/home/";

NSString *const finderUrl = @"finderdetail/";
NSString *const bookmark = @"bookmarks/";
NSString *const updateBookmark = @"updatebookmarks/";
NSString *const removeBookmark = @"remove";
NSString *const FORGOT_PASSWORD = @"customerforgotpasswordemailapp";
NSString *const CHANGE_PASSWORD = @"customer/resetpassword";
NSString *const addReview = @"addreview";

// Filter API URL Constants
NSString *const FILTERCATEGORYTAGOFFERINGS = @"categorytagofferings/";
NSString *const FINDER_RESULT_URL = @"search/getfinderresults";
NSString *const SELECTED_VENDER_URL = @"/getcollecitonfinders/";
NSString *const TRIALS_LIST_URL = @"autobooktrials/";

NSString *const CITIES = @"getcities";
NSString *const AREA = @"cityname";
NSString *const OFFERS_TAB = @"offertabs/";

// Special Classes Constants
NSString *const GETTRIALSCHEDULE= @"gettrialschedule";

NSString *const GETSERVICESCHEDULE = @"getserviceschedule";

NSString *const BOOKTRIAL = @"booktrial";
NSString *const MANUALBOOKTRIAL = @"manualbooktrial";
NSString *const GENERATETEMPORDER = @"generatetmporder";
NSString *const GENERATECODORDER = @"generatecodorder";
NSString *const LANDINGCALLBACK = @"landingpage/callback";
NSString *const REQUEST_CALL_BACK = @"email/requestcallback";
NSString *const USER_PROFILE = @"getcustomerdetail";
NSString *const OFFERS_DETAIL = @"offertabsoffers/";
NSString *const GET_CATEGORIES = @"getcategories";
NSString *const OTP_VERIFICATION = @"customervalidateotp";
NSString *const USER_UPDATE = @"customer/update";
NSString *const GETTRIAL_COUNT = @"getcustomertransactions";

// google direction apis
NSString *const GOOGLEDIRECTIONBASEURL = @"https://maps.googleapis.com/maps/api/directions/json";
NSString *const GOOGLEORIGIN = @"origin";
NSString *const GOOGLECOMMUTEMODE = @"mode";
NSString *const GOOGLEDESTINATION = @"destination";



/**************JAGPRIT'S CHANGES**************/
NSString *const GETWORKOUTSESSIONS_SCHEDULE= @"getworkoutsessionschedule";
NSString *const ADD_REG_ID = @"customer/addregid";
NSString *const TRACK_PAYMENT = @"capturepayment";


/******************Login Home****************/

NSString *const LOGIN_HOME = @"customer/home/";


/**************UPCOMING TRIALS**************/

NSString *const UPCOMING_TRIALS = @"upcomingtrials";


NSString *const TRIAL_ACTION = @"booktrials/";


NSString *const TRIAL_DETAIL = @"booktrialdetail/";

NSString *const ATTENDED_NOT_ATTENDED = @"posttrialaction/customer";


+(NSString *) getBaseUrl{
    
    return PRODUCTION_BASE_URL;
}

+(NSString *) getSearchImageBaseUrl
{
    return searchImageBaseUrl;
}

+(NSString *) getRankFinderUrl
{
    return [NSString stringWithFormat:@"%@%@", [self getBaseUrl], rankFinderUrl];
}

+(NSString *) getCustomerRegisterUrl
{
    return [NSString stringWithFormat:@"%@%@", [self getBaseUrl],CUSTOMER_REGISTER];
}

+(NSString *) getMyMembershipListUrl:(NSString *) param
{
    return [NSString stringWithFormat:@"%@%@%@",[self getBaseUrl],MEMBERSHIP_LIST_URL,param];
}
+(NSString *) getCustomerLoginUrl{
    return [NSString stringWithFormat:@"%@%@", [self getBaseUrl],CUSTOMER_LOGIN];
}

+(NSString *)postNotificationSetting
{
    return  [NSString stringWithFormat:@"%@%@", [self getBaseUrl],NOTIFICATION_SETTING];
}

+(NSString *) getHomeScreenUrl:(NSString *)city{
    return [NSString stringWithFormat:@"%@%@%@", [self getBaseUrl],HOME_SUB_URL,city];
}

+(NSString *) getHomeScreenDataUrl:(NSString *)city
{
   return [NSString stringWithFormat:@"%@%@%@", [self getBaseUrl],HOME_URL,city];
}

/****Modified API BY JAGPRIT 30TH APRIL 2016******/
+(NSString *) getKeywordSearchUrl{
    return [NSString stringWithFormat:@"%@%@", [self getBaseUrl],keywordSearchUrl];
}

+(NSString *) getAutoSuggestedUrl{
    return [NSString stringWithFormat:@"%@%@", [self getBaseUrl],searchAutoSuggestedUrl];
}

+(NSString *) getAutoSuggestedUrlHomeScreen:(NSString *)searchString{
    return [NSString stringWithFormat:@"%@%@%@", [self getBaseUrl],searchAutoSuggestedUrlHomeScreen,searchString];
}

+(NSString *)getVendorDetailUrl:(NSString *)vendorName{
    NSURL *url = [NSURL URLWithString:[self getBaseUrl]];
    url = [[url URLByAppendingPathComponent:finderUrl] URLByAppendingPathComponent:vendorName];
    return [url absoluteString];
}
+(NSString *) getCategoryTagOfferingUrlForCity:(NSString *) city{
    NSURL *url = [NSURL URLWithString:[self getBaseUrl]];
    url = [[url URLByAppendingPathComponent:FILTERCATEGORYTAGOFFERINGS] URLByAppendingPathComponent:city];
    return [url absoluteString];
}

+(NSString *) getFinderResultUrl{
    return [NSString stringWithFormat:@"%@%@",[self getBaseUrl],FINDER_RESULT_URL];
}
+(NSString *) getSelectedVenderListUrl:(NSString *) param{
    return [NSString stringWithFormat:@"%@%@%@",[self getBaseUrl],SELECTED_VENDER_URL,param];
}
+(NSString *) getTrialsListUrl:(NSString *) param{
    return [NSString stringWithFormat:@"%@%@%@",[self getBaseUrl],TRIALS_LIST_URL,param];
}

+ (NSString*)getFullImageUrl{
    return fullImageBaseUrl;
}

+(NSString *) getCityListUrl{
    return [NSString stringWithFormat:@"%@%@",[self getBaseUrl],CITIES];
}
+(NSString *) getAreaListUrl :(NSString*)selectedCity
{
   return [NSString stringWithFormat:@"%@%@/%@",[self getBaseUrl],@"homev2",selectedCity];
}
+ (NSString*)getVendorDetailImageUrl:(NSString*)vendorId{
    return [NSString stringWithFormat:@"%@%@",vendorDetailImageBaseUrl,vendorId];
    
}
+ (NSString*)getVendorDetailImageBaseUrl
{
    return [NSString stringWithFormat:@"%@",vendorDetailLogoBaseUrl];
}

+(NSString *) getTrailScheduleUrlForVenderId:(NSString *) venderId date:(NSDate *) date{
    NSURL *url = [NSURL URLWithString:[self getBaseUrl]];
    url = [[url URLByAppendingPathComponent:GETWORKOUTSESSIONS_SCHEDULE] URLByAppendingPathComponent:venderId];
    
    // Adding date
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd-MM-yyyy"];
    
    NSString *dateString = [dateFormat stringFromDate:date];
    
    url = [url URLByAppendingPathComponent:dateString];
    
    return [url absoluteString];
}

+(NSString *) getServiceScheduleUrlForVenderId:(NSString *) venderId date:(NSDate *) date{
    NSURL *url = [NSURL URLWithString:[self getBaseUrl]];
    url = [[url URLByAppendingPathComponent:GETSERVICESCHEDULE] URLByAppendingPathComponent:venderId];
    
    // Adding date
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd-MM-yyyy"];
    
    NSString *dateString = [dateFormat stringFromDate:date];
    
    url = [url URLByAppendingPathComponent:dateString];
    
    return [url absoluteString];
}

+(NSString *) getBookTrialUrl{
    return [NSString stringWithFormat:@"%@%@",[self getBaseUrl],BOOKTRIAL];
}

+(NSString *) getGenerateTempOrderUrl{

    return [NSString stringWithFormat:@"%@%@",[self getBaseUrl],GENERATETEMPORDER];
}

+(NSString *) getGenerateCODOrderUrl{
   
    return [NSString stringWithFormat:@"%@%@",[self getBaseUrl],GENERATECODORDER];
}

+(NSString *) getLandingCallbackUrl{
    return [NSString stringWithFormat:@"%@%@",[self getBaseUrl],LANDINGCALLBACK];
}

+(NSString *) getManualBookTrialUrl{
    return [NSString stringWithFormat:@"%@%@",[self getBaseUrl],MANUALBOOKTRIAL];
}


+(NSString*)getAllBookmarkUrl:(NSString*)userId{
    return [NSString stringWithFormat:@"%@%@%@",[self getBaseUrl],bookmark,userId];
}

+(NSString*)getRemoveBookmarkUrlForUserId:(NSString*)userId forServiceId:(id)serviceId{
    return [NSString stringWithFormat:@"%@%@%@/%@/%@",[self getBaseUrl],updateBookmark,userId,serviceId,removeBookmark];
}

+(NSString*)getAddBookmarkUrlForUserId:(NSString*)userId forServiceId:(id)serviceId{
    return [NSString stringWithFormat:@"%@%@%@/%@",[self getBaseUrl],updateBookmark,userId,serviceId];
}

+(NSString *)getOffersTabUrl:(NSString *)city{
    return [NSString stringWithFormat:@"%@%@%@",[self getBaseUrl],OFFERS_TAB,city];
}

+(NSString *) getRequestCallBackUrl{
    return [NSString stringWithFormat:@"%@%@",[self getBaseUrl],REQUEST_CALL_BACK];
}

+(NSString *) getUserProfileUrl{
    return [NSString stringWithFormat:@"%@%@",[self getBaseUrl],USER_PROFILE];
}
+(NSString *) getOffersTabDetailUrl:(NSString *)city offer:(NSString *) offer{
    NSURL *url = [NSURL URLWithString:[self getBaseUrl]];
    url = [[[url URLByAppendingPathComponent:OFFERS_DETAIL] URLByAppendingPathComponent:city] URLByAppendingPathComponent:offer];
    return [url absoluteString];
}


+ (NSString*)getReviewTask{
    return [NSString stringWithFormat:@"%@%@",[self getBaseUrl],addReview];
    
}
+(NSString *) getCategoriesUrl{
    return [NSString stringWithFormat:@"%@%@",[self getBaseUrl],GET_CATEGORIES];
}
+(NSString *) getChangePasswordUrl{
    return [NSString stringWithFormat:@"%@%@",[self getBaseUrl],CHANGE_PASSWORD];
}
+(NSString *) getForgotPassword{
    return [NSString stringWithFormat:@"%@%@",[self getBaseUrl],FORGOT_PASSWORD];
}
+(NSString *) getOtpUrl{
    return [NSString stringWithFormat:@"%@%@",[self getBaseUrl],OTP_VERIFICATION];
}
+(NSString *) getUserUpdateProfile{
    return [NSString stringWithFormat:@"%@%@",[self getBaseUrl],USER_UPDATE];
}

+(NSString *)getTrialMembershipVipSessionWorkoutSessionEmail
{
    return  [NSString stringWithFormat:@"%@%@",[self getBaseUrl],GETTRIAL_COUNT];
}
+(NSString *)getGoogleDirectionUrlForParams:(NSDictionary *)params{
    return [NSString stringWithFormat:@"%@?origin=%@,%@&destination=%@,%@&mode=%@&sensor=true&key=%@",GOOGLEDIRECTIONBASEURL,params[@"originlat"],params[@"originlong"],params[@"destinationlat"],params[@"destinationlong"],params[@"mode"],GOOGLE_DIRECTIONS_API_KEY];
    
}

+(NSString *)getFacebookProfilePictureUrlForId:(NSString *)facebookId{
    return [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large",facebookId];
}

+(NSString *) sendDeviceTokenURL{
    
        return [NSString stringWithFormat:@"%@%@",[self getBaseUrl],ADD_REG_ID];
    
    /*
    return [NSString stringWithFormat:@"%@%@",[self getBaseUrl],BOOKTRIAL];
     */
    
}

/**** New method added to capture payment*******/
+(NSString *) trackPaymentSuccess{
    
    return [NSString stringWithFormat:@"%@%@",[self getBaseUrl],TRACK_PAYMENT];
    
}

+(NSString *) getLoginHomeData{
    return [NSString stringWithFormat:@"%@%@", [self getBaseUrl],UPCOMING_TRIALS];
}

/**** Stop Page******/

+(NSString *) getUpcomingTrials{
    return [NSString stringWithFormat:@"%@%@", [self getBaseUrl],UPCOMING_TRIALS];
}

+(NSString *) performTrialAction:(NSString *)action forTrialID:(NSString *)trialId
{
    return [NSString stringWithFormat:@"%@%@%@%@", [self getBaseUrl],TRIAL_ACTION,action,trialId];
}

+(NSString *)getTrialPageDetailsForId:(int)trialId
{
    return [NSString stringWithFormat:@"%@%@%d", [self getBaseUrl],TRIAL_DETAIL,trialId];
}


+(NSString *)eventAttendedNotAttended
{
    return [NSString stringWithFormat:@"%@%@", [self getBaseUrl],ATTENDED_NOT_ATTENDED];
}


@end
