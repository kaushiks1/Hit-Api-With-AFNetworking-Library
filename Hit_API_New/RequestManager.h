//
//  ULTaskBuilder.h
//  Catalog-App
//
//  Created by  on 10/20/14.
//  Copyright (c) 2014 Urban Ladder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTTask.h"


@interface RequestManager : NSObject
+ (RequestManager *) sharedInstance;

-(FTTask *)createRankFinderTask:(NSDictionary *)params;
-(FTTask *)createKeywordSearchTask:(NSDictionary *)params;
-(FTTask *) getRegistrationTask:(NSDictionary *) params;
-(FTTask *) getUserLoginTask:(NSDictionary *) params;
-(FTTask *)postNotificationSettings:(NSDictionary *)params optionalParams:(NSDictionary *)aOptionalParams;
-(FTTask *) getHomeScreenData:(NSString *) city;
-(FTTask *)createAutoSuggestedSearchTask:(NSDictionary *)params;
-(FTTask *)createAutoSuggestedSearchLocation:(NSDictionary *)params searchString:(NSString *)asearchString;
-(FTTask *) getFinderResults:(NSDictionary *) params;
-(FTTask *) getSelectedVenderList:(NSString *) param;
-(FTTask *) getTrialsList:(NSString *) param;
-(FTTask *) getCities;
-(FTTask *) getArea :(NSString*)cityName;
- (FTTask*)vendorDetailTask:(NSString*)vendorName;
-(FTTask *) getAllBookmarks:(NSString*)userId;
-(FTTask *) getOffersTabData:(NSString *) city;
-(FTTask *) getRequestCallBackTask:(NSDictionary *) params;
-(FTTask *) getUserProfile:(NSDictionary *) params;
-(FTTask *) getOffersTabDetailData:(NSString *) city offer:(NSString *) offer;
-(FTTask *)getMyMembershipList:(NSString *) param;
-(FTTask *) getUserCategories:(NSDictionary *) params;
-(FTTask *) getAddReviewTask:(NSDictionary*)params;
-(FTTask *) getForgetPassword:(NSDictionary *) params;
-(FTTask *) getOtpVerification:(NSDictionary *) params;
-(FTTask *) getUserProfileUpdate:(NSDictionary *) params;
-(FTTask *) getTrialMembershipsVIPSessionWorkoutSessionCount:(NSDictionary *)params;
-(FTTask *) getChangePassword:(NSDictionary *) params withAuthorization:(NSDictionary *) auth;
-(FTTask *) getGoogleDirectionTask:(NSDictionary *) params;
/**
 *  Used to fetch categories and associated offerings for applying filter
 *
 *  @param city - name of city
 *
 *  @return - FTTask
 */
-(FTTask *) getFilterCategoriesTagOfferingsData:(NSString *) city;
/**
 *  Used to fetch sessions for a vendor on a corresponding date
 *
 *  @param venderId  id of Vender
 *  @param date     date for when sessions are to be fetched
 *
 *  @return task
 */
-(FTTask *) getTrialScheduleForVenderId:(NSString *) venderId date:(NSDate *) date;
/**
 *  Used to fetch sessions
 *
 *  @param venderId id of vender
 *  @param date     date for when sessions are to be fetched
 *
 *  @return task
 */
-(FTTask *) getServiceScheduleForVenderId:(NSString *) venderId date:(NSDate *) date;
/**
 *   Task to post bookTrial Request
 *
 *  @param params params to send to Server
 *
 *  @return task
 */
-(FTTask *) getBookTrialTask:(NSDictionary *) params;
/**
 *  Task to post BookTrial Manual Request (Offline Booking)
 *
 *  @param params to send to Server
 *
 *  @return task
 */
-(FTTask *) getManualBookTrialTask:(NSDictionary *) params;

-(FTTask *) getAddBookmarksForUserId:(NSString*)userId forFinderId:(id)finderID;

-(FTTask *) getRemoveBookmarksForUserId:(NSString*)userId forFinderId:(id)finderID;
/**
 *  Generate Temp Order Task
 *
 *  @param params payload
 *
 *  @return task
 */
-(FTTask *) getGenerateTempOrderTask:(NSDictionary *) params;
/**
 *  Generate COD Order Task
 *
 *  @param params payload
 *
 *  @return task
 */
-(FTTask *) getGenerateCODOrderTask:(NSDictionary *) params;
/**
 *  Landing Callback Order Task
 *
 *  @param params payload
 *
 *  @return task
 */
-(FTTask *) getLandingCallbackOrderTask:(NSDictionary *) params;

-(FTTask *) sendDeviceToken:(NSDictionary *) params;

/**** New method added to capture payment*******/
-(FTTask *) capturePaymentSuccess:(NSDictionary *) params;

/******Login Home************/
-(FTTask *)getLoginHomeData:(NSDictionary *) params CityName:(NSString *)cityName;

/**** Trials List*******/
-(FTTask *)getUpcomingTrialsData:(NSDictionary *) params;

-(FTTask *)trialAction: (NSDictionary *) params Action:(NSString *) trial_action forTrialID :(NSString *)trialId;

-(FTTask *)getTrialDetailsPageDataForTrialId:(int) trialId;

-(FTTask *)eventAttendNotAttendForTrialWith:(NSDictionary *) params;
@end
