//
//  ULTaskBuilder.m
//  Catalog-App
//
//  Created by Kuliza on 10/20/14.
//  Copyright (c) 2014 Urban Ladder. All rights reserved.
//

#import "RequestManager.h"
#import "FTGenericHTTPGetTask.h"
#import "FTGenericHTTPPostTask.h"
#import "FTGenericHTTPPutTask.h"
#import "FTGenericHTTPDeleteTask.h"
#import <AdSupport/AdSupport.h>
#import "FTTaskProcessor.h"
#import "NetworkConstants.h"
#import "Helper.h"
//#import "MyMembershipModel.h"

static RequestManager *sharedInstance;

@implementation RequestManager

#pragma mark - Lifecycle

+ (RequestManager *) sharedInstance {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance = [[RequestManager alloc] init];
	});
	return sharedInstance;
}

#pragma mark - Public

- (FTTask *)createTask:(id)inputParams type:(FTTaskType)type optionalParams:(NSDictionary *)optionalParams withClassName:(NSString *) className {
    FTTask *task = nil;
    switch (type)
    {
        case GENERIC_HTTP_GET:{
            task = [[FTGenericHTTPGetTask alloc] init];
            break;
        }
        case GENERIC_HTTP_POST:{
            task = [[FTGenericHTTPPostTask alloc] init];
            break;
        }
        case GENERIC_HTTP_DELETE:{
            task = [[FTGenericHTTPDeleteTask alloc] init];
            break;
        }
        case GENERIC_HTTP_PUT:
        default:
            task = [[FTGenericHTTPPutTask alloc] init];
            break;
    }
    task.type = type;
    task.taskParams = inputParams;
    task.className = className;
    task.optionalParams=optionalParams;
    
    return task;
}

-(FTTask *)createRankFinderTask:(NSDictionary *)params{
    FTTask *rankFinderTask = [self createTask:params type:GENERIC_HTTP_POST optionalParams:nil withClassName:@"nil"];
    rankFinderTask.url = [NetworkConstants getRankFinderUrl];
    [[FTTaskProcessor sharedInstance] execute:rankFinderTask];
    return rankFinderTask;
}

-(FTTask *)createKeywordSearchTask:(NSDictionary *)params{
    FTTask *keywordSearchText = [self createTask:params type:GENERIC_HTTP_POST optionalParams:nil withClassName:@"nil"];
    keywordSearchText.url = [NetworkConstants getKeywordSearchUrl];
    [[FTTaskProcessor sharedInstance] execute:keywordSearchText];
    return keywordSearchText;
}

-(FTTask *)createAutoSuggestedSearchTask:(NSDictionary *)params{
    FTTask *autoSuggestedSearchTask = [self createTask:params type:GENERIC_HTTP_POST optionalParams:nil withClassName:@"FTAutoSuggestedSearchJsonModel"];
    autoSuggestedSearchTask.url = [NetworkConstants getAutoSuggestedUrl];
    [[FTTaskProcessor sharedInstance] execute:autoSuggestedSearchTask];
    return autoSuggestedSearchTask;
}

-(FTTask *)createAutoSuggestedSearchLocation:(NSDictionary *)params searchString:(NSString *)asearchString {
    FTTask *autoSuggestedSearchTask = [self createTask:params type:GENERIC_HTTP_GET optionalParams:nil withClassName:@"nil"];
    autoSuggestedSearchTask.url = [NetworkConstants getAutoSuggestedUrlHomeScreen:asearchString];
    [[FTTaskProcessor sharedInstance] execute:autoSuggestedSearchTask];
    return autoSuggestedSearchTask;
}


-(FTTask *) getMyMembershipList:(NSString *)param{
        FTTask *membershipList = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:nil withClassName:@"MyMembershipModel"];
       membershipList.url = [NetworkConstants getMyMembershipListUrl:param];
     //   membershipList.url = @"http://a1.fitternity.com/orderhistory/ut.mehrotra@gmail.com";
        [[FTTaskProcessor sharedInstance] execute:membershipList];
        return membershipList;
    }

-(FTTask *) getRegistrationTask:(NSDictionary *) params{
    FTTask *registration = [self createTask:params type:GENERIC_HTTP_POST optionalParams:nil withClassName:@"nil"];
    registration.url = [NetworkConstants getCustomerRegisterUrl];
    [[FTTaskProcessor sharedInstance] execute:registration];
    return registration;
}

-(FTTask *) getUserLoginTask:(NSDictionary *) params{
    FTTask *login = [self createTask:params type:GENERIC_HTTP_POST optionalParams:nil withClassName:@"nil"];
    login.url = [NetworkConstants getCustomerLoginUrl];
    [[FTTaskProcessor sharedInstance] execute:login];
    return login;
}

-(FTTask *)postNotificationSettings:(NSDictionary *)params optionalParams:(NSDictionary *)aOptionalParams
{
    FTTask *notificationSetting = [self createTask:params type:GENERIC_HTTP_POST optionalParams:aOptionalParams withClassName:@"nil"];
    notificationSetting.url = [NetworkConstants postNotificationSetting];
    [[FTTaskProcessor sharedInstance] execute:notificationSetting];
    return notificationSetting;
}

-(FTTask *) getHomeScreenData:(NSString *) city{
    FTTask *homeTask = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:nil withClassName:@"HomeScreenModel"];
    homeTask.url = [NetworkConstants getHomeScreenDataUrl:city];
    [[FTTaskProcessor sharedInstance] execute:homeTask];
    return homeTask;
}

-(FTTask *)vendorDetailTask:(NSString *)vendorName
{
    FTTask *vendorDetailTask = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:nil withClassName:@"FTJFinderDetailModel"];
    //vendorDetailTask.url = @"http://a1.fitternity.com/finderdetail/20-15-fitness-tardeo";
    vendorDetailTask.url = [NetworkConstants getVendorDetailUrl:vendorName];
    [[FTTaskProcessor sharedInstance] execute:vendorDetailTask];
    return vendorDetailTask;

}

-(FTTask *) getFilterCategoriesTagOfferingsData:(NSString *) city{
    FTTask *filterCategoryOfferingsTask = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:nil withClassName:@"FilterCategoryTagsModel"];
    filterCategoryOfferingsTask.url = [NetworkConstants getCategoryTagOfferingUrlForCity:city];
    [[FTTaskProcessor sharedInstance] execute:filterCategoryOfferingsTask];
    return filterCategoryOfferingsTask;
}
-(FTTask *) getFinderResults:(NSDictionary *) params{
    FTTask *finderTask = [self createTask:params type:GENERIC_HTTP_POST optionalParams:nil withClassName:@"nil"];
    finderTask.url = [NetworkConstants getFinderResultUrl];
    [[FTTaskProcessor sharedInstance] execute:finderTask];
    return finderTask;
}

-(FTTask *) getSelectedVenderList:(NSString *) param{
    FTTask *venderList = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:nil withClassName:@"SelectedVenderCollectionModel"];
    venderList.url = [NetworkConstants getSelectedVenderListUrl:param];
    [[FTTaskProcessor sharedInstance] execute:venderList];
    return venderList;
}

-(FTTask *) getTrialsList:(NSString *)param{
    FTTask *trialsList = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:nil withClassName:@"TrialsListModel"];
    trialsList.url = [NetworkConstants getTrialsListUrl:param];
    [[FTTaskProcessor sharedInstance] execute:trialsList];
    return trialsList;
}
-(FTTask *) getCities{
    FTTask *cityList = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:nil withClassName:@"nil"];
    cityList.url = [NetworkConstants getCityListUrl];
    [[FTTaskProcessor sharedInstance] execute:cityList];
    return cityList;
}

-(FTTask *) getArea :(NSString*)cityName
{
    FTTask *areaList = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:nil withClassName:@"nil"];
    areaList.url = [NetworkConstants getAreaListUrl:cityName];
    NSLog(@"areaList.url  : %@",areaList.url);
    [[FTTaskProcessor sharedInstance] execute:areaList];
    return areaList;
}

-(FTTask *) getTrialScheduleForVenderId:(NSString *) venderId date:(NSDate *) date{
    FTTask *trialSchdule = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:nil withClassName:@"nil"];
    trialSchdule.url = [NetworkConstants getTrailScheduleUrlForVenderId:venderId date:date];
    [[FTTaskProcessor sharedInstance] execute:trialSchdule];
    return trialSchdule;
}

-(FTTask *) getServiceScheduleForVenderId:(NSString *) venderId date:(NSDate *) date{
    FTTask *serviceSchedule = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:nil withClassName:@"nil"];
    serviceSchedule.url = [NetworkConstants getServiceScheduleUrlForVenderId:venderId date:date];
    [[FTTaskProcessor sharedInstance] execute:serviceSchedule];
    return serviceSchedule;
}

-(FTTask *) getBookTrialTask:(NSDictionary *) params{
    FTTask *bookTrial = [self createTask:params type:GENERIC_HTTP_POST optionalParams:nil withClassName:@"nil"];
    bookTrial.url = [NetworkConstants getBookTrialUrl];
    [[FTTaskProcessor sharedInstance] execute:bookTrial];
    return bookTrial;
}

-(FTTask *) getManualBookTrialTask:(NSDictionary *) params{
    FTTask *bookTrial = [self createTask:params type:GENERIC_HTTP_POST optionalParams:nil withClassName:@"nil"];
    bookTrial.url = [NetworkConstants getManualBookTrialUrl];
    [[FTTaskProcessor sharedInstance] execute:bookTrial];
    return bookTrial;
}
-(FTTask *) getAllBookmarks:(NSString*)userId{
    FTTask *bookMarkList = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:nil withClassName:@"FTJBookMarkFinder"];
    bookMarkList.url = [NetworkConstants getAllBookmarkUrl:userId];
    [[FTTaskProcessor sharedInstance] execute:bookMarkList];
    return bookMarkList;
}

-(FTTask *) getRemoveBookmarksForUserId:(NSString*)userId forFinderId:(id)finderID{
    FTTask *removeBookMark = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:nil withClassName:@"FTJBookMarkFinder"];
    removeBookMark.url = [NetworkConstants getRemoveBookmarkUrlForUserId:userId forServiceId:finderID];
    [[FTTaskProcessor sharedInstance] execute:removeBookMark];
    return removeBookMark;
}

-(FTTask *) getAddBookmarksForUserId:(NSString*)userId forFinderId:(id)finderID{
    FTTask *addBookmark = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:nil withClassName:@"FTJBookMarkFinder"];
    addBookmark.url = [NetworkConstants getAddBookmarkUrlForUserId:userId forServiceId:finderID];
    [[FTTaskProcessor sharedInstance] execute:addBookmark];
    return addBookmark;
}
-(FTTask *) getOffersTabData:(NSString *) city{
    FTTask *offersData = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:nil withClassName:@"OffersModel"];
    offersData.url = [NetworkConstants getOffersTabUrl:city];
    [[FTTaskProcessor sharedInstance] execute:offersData];
    return offersData;
}

-(FTTask *) getGenerateTempOrderTask:(NSDictionary *) params{
    FTTask *tempOrderTask = [self createTask:params type:GENERIC_HTTP_POST optionalParams:nil withClassName:@"nil"];
    tempOrderTask.url = [NetworkConstants getGenerateTempOrderUrl];
    [[FTTaskProcessor sharedInstance] execute:tempOrderTask];
    return tempOrderTask;
}

-(FTTask *) getGenerateCODOrderTask:(NSDictionary *) params{
    FTTask *codOrderTask = [self createTask:params type:GENERIC_HTTP_POST optionalParams:nil withClassName:@"nil"];
    codOrderTask.url = [NetworkConstants getGenerateCODOrderUrl];
    [[FTTaskProcessor sharedInstance] execute:codOrderTask];
    return codOrderTask;
}

-(FTTask *) getLandingCallbackOrderTask:(NSDictionary *) params{
    FTTask *landingCallbackOrderTask = [self createTask:params type:GENERIC_HTTP_POST optionalParams:nil withClassName:@"nil"];
    landingCallbackOrderTask.url = [NetworkConstants getLandingCallbackUrl];
    [[FTTaskProcessor sharedInstance] execute:landingCallbackOrderTask];
    return landingCallbackOrderTask;
}

-(FTTask *) getRequestCallBackTask:(NSDictionary *) params{
    FTTask *callBack = [self createTask:params type:GENERIC_HTTP_POST optionalParams:nil withClassName:@"nil"];
    callBack.url = [NetworkConstants getRequestCallBackUrl];
    [[FTTaskProcessor sharedInstance] execute:callBack];
    return callBack;
}
-(FTTask *) getUserProfile:(NSDictionary *) params
{
    FTTask *profile = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:params withClassName:@"nil"];
    profile.url = [NetworkConstants getUserProfileUrl];
    [[FTTaskProcessor sharedInstance] execute:profile];
    return profile;
}
-(FTTask *) getOffersTabDetailData:(NSString *) city offer:(NSString *) offer{
    FTTask *offerDetail = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:nil withClassName:@"OffersListModel"];
    offerDetail.url = [NetworkConstants getOffersTabDetailUrl:city offer:offer];
    [[FTTaskProcessor sharedInstance] execute:offerDetail];
    return offerDetail;
}

-(FTTask *) getAddReviewTask:(NSDictionary*)params{
    FTTask *reviewTask = [self createTask:params type:GENERIC_HTTP_POST optionalParams:nil withClassName:@"nil"];
    reviewTask.url = [NetworkConstants getReviewTask];
    [[FTTaskProcessor sharedInstance] execute:reviewTask];
    return reviewTask;
}

-(FTTask *) getUserCategories:(NSDictionary *) params{
    FTTask *categories = [self createTask:params type:GENERIC_HTTP_POST optionalParams:nil withClassName:@"nil"];
    categories.url = [NetworkConstants getCategoriesUrl];
    [[FTTaskProcessor sharedInstance] execute:categories];
    return categories;
}

-(FTTask *) getChangePassword:(NSDictionary *) params withAuthorization:(NSDictionary *) auth{
    FTTask *chngPaswd = [self createTask:params type:GENERIC_HTTP_POST optionalParams:auth withClassName:@"nil"];
    chngPaswd.url = [NetworkConstants getChangePasswordUrl];
    [[FTTaskProcessor sharedInstance] execute:chngPaswd];
    return chngPaswd;
}
-(FTTask *) getForgetPassword:(NSDictionary *) params{
    FTTask *forgetPswd = [self createTask:params type:GENERIC_HTTP_POST optionalParams:nil withClassName:@"nil"];
    forgetPswd.url = [NetworkConstants getForgotPassword];
    [[FTTaskProcessor sharedInstance] execute:forgetPswd];
    return forgetPswd;
}
-(FTTask *) getOtpVerification:(NSDictionary *) params{
    FTTask *otpPswd = [self createTask:params type:GENERIC_HTTP_POST optionalParams:nil withClassName:@"nil"];
    otpPswd.url = [NetworkConstants getOtpUrl];
    [[FTTaskProcessor sharedInstance] execute:otpPswd];
    return otpPswd;
}
-(FTTask *) getUserProfileUpdate:(NSDictionary *) params
{
    FTTask *userUpdate = [self createTask:params type:GENERIC_HTTP_POST optionalParams:params withClassName:@"nil"];
    userUpdate.url = [NetworkConstants getUserUpdateProfile];
    [[FTTaskProcessor sharedInstance] execute:userUpdate];
    return userUpdate;
}

-(FTTask *) getTrialMembershipsVIPSessionWorkoutSessionCount:(NSDictionary *)params
{
    FTTask *userUpdate = [self createTask:params type:GENERIC_HTTP_GET optionalParams:params withClassName:@"nil"];
    userUpdate.url = [NetworkConstants getTrialMembershipVipSessionWorkoutSessionEmail];
    [[FTTaskProcessor sharedInstance] execute:userUpdate];
    return userUpdate;
    
}

-(FTTask *) getGoogleDirectionTask:(NSDictionary *) params{
    FTTask *directionTask = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:nil withClassName:@"nil"];
    directionTask.url = [NetworkConstants getGoogleDirectionUrlForParams:params];
    [[FTTaskProcessor sharedInstance] execute:directionTask];
    return directionTask;
}

-(FTTask *) sendDeviceToken:(NSDictionary *) params{
    FTTask *sendDeviceToken = [self createTask:params type:GENERIC_HTTP_POST optionalParams:nil withClassName:@"nil"];
    sendDeviceToken.url = [NetworkConstants sendDeviceTokenURL];
    [[FTTaskProcessor sharedInstance] execute:sendDeviceToken];
    return sendDeviceToken;
}
/**** New method added to capture payment*******/
-(FTTask *) capturePaymentSuccess:(NSDictionary *) params{
    FTTask *capturePayment = [self createTask:params type:GENERIC_HTTP_POST optionalParams:nil withClassName:@"nil"];
    capturePayment.url = [NetworkConstants trackPaymentSuccess];
    [[FTTaskProcessor sharedInstance] execute:capturePayment];
    return capturePayment;
}


-(FTTask *)getUpcomingTrialsData:(NSDictionary *) params
{
    FTTask *trialTask = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:params withClassName:nil];
    trialTask.url = [NetworkConstants getUpcomingTrials];
    [[FTTaskProcessor sharedInstance] execute:trialTask];
    return trialTask;
}

-(FTTask *)getLoginHomeData:(NSDictionary *) params CityName:(NSString *)cityName
{
    //+(NSString *) getHomeScreenDataUrl:(NSString *)city
    FTTask *homeTask = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:params withClassName:nil];
    homeTask.url = [NetworkConstants getHomeScreenDataUrl:cityName];
    [[FTTaskProcessor sharedInstance] execute:homeTask];
    return homeTask;
}

-(FTTask *)trialAction: (NSDictionary *) params Action:(NSString *) trial_action forTrialID :(NSString *)trialId
{
    FTTask *trialTask = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:params withClassName:nil];
    trialTask.url = [NetworkConstants performTrialAction:trial_action forTrialID:trialId];
    [[FTTaskProcessor sharedInstance] execute:trialTask];
    return trialTask;
}

-(FTTask *)getTrialDetailsPageDataForTrialId:(int) trialId
{
    FTTask *trialTask = [self createTask:nil type:GENERIC_HTTP_GET optionalParams:nil withClassName:nil];
    trialTask.url = [NetworkConstants getTrialPageDetailsForId:trialId];
    [[FTTaskProcessor sharedInstance] execute:trialTask];
    return trialTask;
}


-(FTTask *)eventAttendNotAttendForTrialWith:(NSDictionary *) params
{
    FTTask *trialTask = [self createTask:params type:GENERIC_HTTP_POST optionalParams:params withClassName:nil];
    trialTask.url = [NetworkConstants eventAttendedNotAttended];
    [[FTTaskProcessor sharedInstance] execute:trialTask];
    return trialTask;
}



@end
