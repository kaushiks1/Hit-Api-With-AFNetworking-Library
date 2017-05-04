

#import <Foundation/Foundation.h>

@interface NetworkConstants : NSObject
extern NSString * const GET;
extern NSString * const PUT;
extern NSString * const POST;
extern NSString * const DELETE;
extern NSString * const ERROR;
extern NSString * const ERRORCODE;
extern NSString * const ERRORMSG;
extern NSString * const ERRORBODY;
extern NSString * const RESPONSE;
extern NSString * const RESPONSEOBJECT;
extern NSString * const REQUEST;
extern NSString * const REQUESTOBJECT;
extern NSString * const ENVIRONMENT;
extern NSString * const TEST;
extern NSString *const MEMBERSHIP_LIST_URL;

extern NSString *const BASE_CUSTOMER_URLTEST;
extern NSString *const BASE_CUSTOMER_URL;
extern NSString *const CUSTOMER_SIGNUP_VERIFY_SUBURL;
extern NSString *const CUSTOMER_RESEND_SUBURL;
extern NSString *const NETWORK_ERROR_MESSAGE;

+(NSString *) getBaseUrl;
+(NSString *) getSearchImageBaseUrl;
+(NSString *) getRankFinderUrl;
+(NSString *) getCustomerRegisterUrl;
+(NSString *) getCustomerLoginUrl;
+(NSString *)postNotificationSetting;
+(NSString *) getHomeScreenDataUrl:(NSString *)city;
+(NSString *) getHomeScreenUrl:(NSString *)city;
+(NSString *) getKeywordSearchUrl;
+(NSString *) getAutoSuggestedUrl;
+(NSString *) getAutoSuggestedUrlHomeScreen:(NSString *)searchString;
+(NSString *) getVendorDetailUrl:(NSString*)vendorName;
+(NSString *) getCategoryTagOfferingUrlForCity:(NSString *) city;
+(NSString *) getFinderResultUrl;
+(NSString *) getSelectedVenderListUrl:(NSString *) param;
+(NSString *) getTrialsListUrl:(NSString *) param;
+(NSString *) getCategoriesUrl;
+(NSString*)getAllBookmarkUrl:(NSString*)userId;

+(NSString *) getOffersTabUrl:(NSString *) city;
+ (NSString*)getFullImageUrl;

+(NSString *) getCityListUrl;
+(NSString *) getAreaListUrl :(NSString*)selectedCity;
+(NSString*)getVendorDetailImageUrl:(NSString*)vendorId;
+(NSString *) getTrailScheduleUrlForVenderId:(NSString *) venderId date:(NSDate *) date;
+(NSString *) getServiceScheduleUrlForVenderId:(NSString *) venderId date:(NSDate *) date;
+(NSString *) getUserProfileUrl;
+(NSString *) getBookTrialUrl;
+(NSString *) getMyMembershipListUrl:(NSString *)param;
+(NSString *) getGenerateTempOrderUrl;
+(NSString *) getGenerateCODOrderUrl;
+(NSString *) getLandingCallbackUrl;
+(NSString *) getManualBookTrialUrl;
+(NSString*)getVendorDetailImageBaseUrl;
+(NSString *) getRequestCallBackUrl;
+(NSString*)getAddBookmarkUrlForUserId:(NSString*)userId forServiceId:(id)serviceId;
+(NSString*)getRemoveBookmarkUrlForUserId:(NSString*)userId forServiceId:(id)serviceId;
+(NSString *) getOffersTabDetailUrl:(NSString *)city offer:(NSString *) offer;
+(NSString *) getChangePasswordUrl;
+ (NSString*)getReviewTask;
+(NSString *) getForgotPassword;
+(NSString *) getOtpUrl;
+(NSString *) getUserUpdateProfile;
+(NSString *)getTrialMembershipVipSessionWorkoutSessionEmail;
+(NSString *)getGoogleDirectionUrlForParams:(NSDictionary*)params;

+(NSString *)getFacebookProfilePictureUrlForId:(NSString*)facebookId;
+(NSString *) sendDeviceTokenURL;

/**** New method added to capture payment*******/
+(NSString *) trackPaymentSuccess;

/**** Upcoming trials*******/
+(NSString *) getUpcomingTrials;
+(NSString *) performTrialAction:(NSString *)action forTrialID:(NSString *)trialId;
+(NSString *) getTrialPageDetailsForId:(int)trialId;
+(NSString *)eventAttendedNotAttended;
@end
