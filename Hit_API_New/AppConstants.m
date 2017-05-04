//
//  AppConstants.m
//  fitternity
//
//  Created by Nagendra Chowdary on 07/11/2015.
//  Copyright © 2015 kuliza. All rights reserved.
//

#import "AppConstants.h"

@implementation AppConstants

NSString *const TRIAL_AUTOMATED = @"TRIAL_AUTOMATED";
NSString *const TRIAL_MANUAL = @"TRIAL_MANUAL";
NSString *const TRIAL_PAID = @"TRIAL_PAID";
NSString *const WORKOUT_SESSION = @"WORKOUT_SESSION";

NSString *const MEMBERSHIP_PAYU = @"MEMBERSHIP_PAYU";
NSString *const MEMBERSHIP_COD = @"MEMBERSHIP_COD";
NSString *const MEMBERSHIP_FAKE = @"MEMBERSHIP_FAKE";

NSString *const LOCATIONUPDATESUCCESS = @"LOCATIONUPDATESUCCESS";
NSString *const LOCATIONUPDATEFAILURE = @"LOCATIONUPDATEFAILURE";

NSString *const FORGOTPASSWORD_PLEASECHECKYOUREMAIL = @"Please Check your email.";
NSString *const FILLPREFERENCE_PREFERENCESAVED = @"Thank you for letting us know your preferences.";

NSString *const NO_RESULTS_FOUND = @"No Results Found.";
// User Defaults

NSString *const USER_SELECTED_CITY = @"userSelectedCity";
NSString *const USER_CURRENT_CITY = @"userCurrentCity";
NSString *const USER_LATITUDE = @"userLatitude";
NSString *const USER_LONGITUDE = @"userLongitude";
NSString *const USER_SUB_LOCALITY = @"userSublocality";
NSString *const USER_LOCATION = @"userLocation";
NSString *const USER_STATE = @"userState";
NSString *const USER_CATEGORIES = @"userPreferenceCategories";
NSString *const USER_TIMINGS = @"userPreferenceTime";
NSString *const USER_CURRENT_LATITUDE = @"userCurrentLat";
NSString *const USER_CURRENT_LONGITUDE = @"userCurrentLng";
NSString *const USER_CITIES = @"userCities";
NSString *const USER_AREA = @"userArea";
NSString *const USER_TOKEN = @"userToken";
NSString *const USER_FACEBOOK_PICTURE = @"userFacebookPicture";
NSString *const USER_FACEBOOK_ID = @"userFacebookId";
NSString *const USER_LOGGED_IN_NOTIFICATION = @"userLoggedInNotification";

// Payment Gateway


#define PAYU_SANDBOX 0

#if PAYU_SANDBOX
NSString *const PAYUMONEY_PAYMENTGATEWAY_URL = @"https://test.payu.in/_payment";
NSString *const PAYUMONEY_SUCCESS_URL = @"https://www.fitternity.com/paymentsuccessios";
NSString *const PAYUMONEY_FAILURE_URL = @"https://www.fitternity.com/paymentsuccessios";
NSString *const PAYUMONEY_KEY = @"gtKFFx";
NSString *const PAYUMONEY_SALT = @"eCwWELxi";
#else
NSString *const PAYUMONEY_PAYMENTGATEWAY_URL = @"https://secure.payu.in/_payment";
NSString *const PAYUMONEY_SUCCESS_URL = @"https://www.fitternity.com/paymentsuccessios";
NSString *const PAYUMONEY_FAILURE_URL = @"https://www.fitternity.com/paymentsuccessios";
NSString *const PAYUMONEY_KEY = @"l80gyM";
NSString *const PAYUMONEY_SALT = @"QBl78dtK";
#endif




NSString *const PAYUMONEY_MSG_PLEASETRYAGAIN = @"Please Try Again";
NSString *const PAYUMONEY_MSG_PAYMENTFAILED = @"Payment Failed";

// PayTm SDK
NSString *const PAYTM_WAP = @"fitternitywap";
NSString *const PAYTM_MID = @"fitter45826906213917";
NSString *const PAYTM_MERCHANT_KEY = @"q1Lq3Gux0CMJg";
NSString *const PAYTM_INDUSTRY_TYPE_ID = @"Retail110";
NSString *const PAYTM_CHANNEL_ID = @"WAP";
NSString *const PAYTM_PROD_SERVER_URL = @"https://secure.paytm.in/oltp-web/processTransaction";

NSString *const PAYTM_MSG_PLEASETRYAGAIN = @"Please Try Again";
NSString *const PAYTM_MSG_PAYMENTFAILED = @"Payment Failed";

// UI Constant
NSString *const FT_PLACEHOLDER_IMAGE = @"fitternity_placeholder";

//  Common Constant
NSString *const FT_RUPEE_SYMBOL = @"₹";

NSString *const WALKTHROUGH_IMAGE_1 = @"slider1";
NSString *const WALKTHROUGH_IMAGE_2 = @"slider2";
NSString *const WALKTHROUGH_IMAGE_3 = @"slider4";

NSString *const WALKTHROUGH_TITLE_1 = @"DISCOVER";
NSString *const WALKTHROUGH_TITLE_2 = @"REACH YOUR PEAK";
NSString *const WALKTHROUGH_TITLE_3 = @"ACCESS";

NSString *const WALKTHROUGH_NAME_1 = @"Workout | Eat Healthy";
NSString *const WALKTHROUGH_NAME_2 = @"Anywhere | Pay per use";
NSString *const WALKTHROUGH_NAME_3 = @"Memberships | Packages";


NSString *const WALKTHROUGH_DESC_1 = @"Get access to awesome fitness options.Book free trails before purhcase";
NSString *const WALKTHROUGH_DESC_2 = @"With an app that takes you there. Chart your own coarse. Stay on it and Achieve greatness in fitness";
NSString *const WALKTHROUGH_DESC_3 = @"True flexibility in fitness with unlimited Trails. EMI Pay-per-Use and more";

// SB IDENTIFIERS
NSString *const SEARCH_SB = @"SearchFlow";
NSString *const SEARCH_HSLS_SB = @"HomeScreenLocationSearch";

// VC Identifiers
// Cell Identifiers

NSString *const FT_SEARCH_TV_CELL = @"FTSearchTableViewCell";
NSString *const FT_CATEGORY_TAG_CV_CELL = @"FTCategoryTagCollectionViewCell";
NSString *const FT_Images_CV_CELL = @"FTImagesCollectionViewCell";

#pragma mark - Default Values
NSString *const FT_API_PARAMS_LOCATION_DEFAULT_CITY = @"mumbai";

#pragma mark - Filter View
//NSString *const FT_FILTER_VIEW_IDENTIFIER = @"FilterView";
NSString *const FT_FILTER_SIDE_MENU_VIEW_IDENTIFIER = @"FilterSideMenuView";
NSString *const FT_FILTER_BUDGET_VIEW_IDENTIFIER = @"FilterBudgetView";

NSString *const FT_FILTER_AMENITIES_VIEW_IDENTIFIER = @"FilterAmenitiesView";
NSString *const FT_FILTER_SPECIAL_CLASSES_VIEW_IDENTIFIER = @"FilterSpecialClassesView";
NSString *const FT_FILTER_CATEGORIES_VIEW_IDENTIFIER = @"FilterCategoryView";
NSString *const FT_FILTER_LOCATION_VIEW_IDENTIFIER = @"FilterLocationView";

NSString *const FT_FILTER_SELECTION_VIEW_IDENTIFIER = @"FilterSelectionView";
NSString *const FT_FILTER_SELECTION_TABLE_VIEW_CELL_IDENTIFIER = @"FilterSelectionTableViewCell";

NSString *const FT_FILTER_HIERARCHY_SELECTION_TABLE_VIEW_HEADER_VIEW_IDENTIFIER = @"FilterHierarchySelectionTableViewHeaderView";

NSString *const FT_FILTER_HIERARCHY_SELECTION_TABLE_VIEW_IDENTIFIER = @"FilterHierarchySelectionView";

#pragma mark - Filters Side Menu
NSString *const FT_FILTER_SIDE_MENU_CATEGORIES = @"CATEGORIES";
NSString *const FT_FILTER_SIDE_MENU_LOCATIONS = @"LOCATIONS";
NSString *const FT_FILTER_SIDE_MENU_SPECIAL_CLASSES = @"SPECIAL CLASSES";
NSString *const FT_FILTER_SIDE_MENU_AMENITIES = @"AMENITIES";
NSString *const FT_FILTER_SIDE_MENU_BUDGET = @"BUDGET";

#pragma mark - Filter Special Classes
NSString *const FT_FILTER_SPECIAL_CLASSES_FREE_TRIAL = @"FREE TRIAL";
NSString *const FT_FILTER_SPECIAL_CLASSES_GROUP_CLASSES = @"GROUP CLASSES";
NSString *const FT_FILTER_SPECIAL_CLASSES_SUNDAY_OPEN = @"SUNDAY OPEN";
NSString *const FT_FILTER_SPECIAL_CLASSES_PERSONAL_TRAINING = @"PERSONAL TRAINING";

#pragma mark - Filter Budget
NSString *const FT_FILTER_BUDGET_LESS_THAN_1000 = @"< ₹ 1,000";
NSString *const FT_FILTER_BUDGET_BETWEEN_1000_2500 = @"₹ 1,000 - ₹ 2,500";
NSString *const FT_FILTER_BUDGET_BETWEEN_2500_5000 = @"₹ 2,500 - ₹ 5,000";
NSString *const FT_FILTER_BUDGET_BETWEEN_5000_7500 = @"₹ 5,000 - ₹ 7,500";
NSString *const FT_FILTER_BUDGET_BETWEEN_7500_15000 = @"₹ 7,500 - ₹ 15,000";
NSString *const FT_FILTER_BUDGET_GREATER_THAN_15000 = @"> ₹ 15,000";


#pragma mark - Sort Keywords
NSString *const FT_SORT_POPULARITY = @"Popularity";
NSString *const FT_SORT_RATING = @"Rating";
NSString *const FT_SORT_MEMBERSHIPFEEHIGHTOLOW = @"Membership fee High to Low";
NSString *const FT_SORT_MEMBERSHIPFEELOWTOHIGH = @"Membership fee Low to High";

NSString *const FT_SORT_FIELD_BUDGET = @"budget";
NSString *const FT_SORT_FIELD_RATING = @"average_rating";
NSString *const FT_SORT_FIELD_POPULARITY = @"popularity";
NSString *const FT_SORT_ORDER_ASC = @"asc";
NSString *const FT_SORT_ORDER_DESC = @"desc";


NSString *const FT_AUTOSUGGESTEDSEARCH_TV_CELL = @"FTAutoSuggestedSearchTableViewCell";
NSString *const FT_HOMESCREENLOCATIONSEARCH_CELL = @"HomeScreenLocationSearchTableViewCell";

#pragma mark - Upcoming Classes
NSString *const FT_UPCOMING_CLASSES_DATES_COLLECTION_VIEW_CELL = @"FTDatesCollectionViewCell";
NSString *const FT_UPCOMING_CLASSES_SESSION_TABLE_VIEW_CELL_IDENTIFIER = @"FTSessionTableViewCell";

NSString *const FT_UPCOMING_CLASSES_SESSION_FREESESSION = @"Free via Fitternity";
NSString *const FT_UPCOMING_CLASSES_SESSION_PERSESSION =@"";
NSString *const FT_UPCOMING_CLASSES_SESSION_SESSIONWILLSTARTIN = @" in ";
NSString *const FT_UPCOMING_CLASSES_SESSION_HOUR = @"hr";
NSString *const FT_UPCOMING_CLASSES_SESSION_HOURS = @"hrs";
NSString *const FT_UPCOMING_CLASSES_SESSION_AND = @"and";
NSString *const FT_UPCOMING_CLASSES_SESSION_MINUTE = @"min";
NSString *const FT_UPCOMING_CLASSES_SESSION_MINUTES = @"mins";

NSString *const FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_SUNDAY = @"Sun";
NSString *const FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_MONDAY = @"Mon";
NSString *const FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_TUESDAY = @"Tues";
NSString *const FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_WEDNESDAY = @"Wed";
NSString *const FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_THURSDAY = @"Thu";
NSString *const FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_FRIDAY = @"Fri";
NSString *const FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_SATURDAY = @"Sat";

NSString *const FT_UPCOMING_CLASSES_TITLE = @"Upcoming Classes";

#pragma mark - Slot Selection

NSString *const FT_SLOT_SELECTION_SESSION_COLLECTION_VIEW_CELL_IDENTIFIER = @"FTSlotSelectionSessionViewCellCollectionViewCell";
NSString *const FT_SLOTSELECTION_VC_TITLE = @"Choose Trial Date And Time";

#pragma mark - Book A Trial
NSString *const FT_BOOK_A_TRIAL_CELL_IDENTIFIER = @"BookATrialTableViewCell";


NSString *const SUCCESS_TEXT = @"Success";
NSString *const ERROR_TEXT = @"Error";

// Third Party Keys
//NSString *const GOOGLE_API_KEY = @"AIzaSyBQTX9KWBlNC3rj6xw-HQEPkyqmRnXJwrY";
NSString *const GOOGLE_API_KEY = @"AIzaSyAdvh5FsSJObMYQ4v7JP8TvZISlmsTNdjI";
NSString *const GOOGLE_DIRECTIONS_API_KEY = @"AIzaSyDft-oBwYuyqH53Om5wvbQG0_yDJpASkBw";

// Nib Names

NSString *const CATEGORY_GRID_CELL = @"CategoryGridCollectionViewCell";
NSString *const SELECTION_GRID_CELL = @"SelectionsGridCollectionViewCell";
NSString *const OFFERS_GRID_CELL = @"OffersGridCollectionViewCell";
NSString *const LOCATION_LIST_CELL = @"LocationListTableViewCell";
NSString *const CATEGORY_LIST_CELL = @"CategoryListTableViewCell";
NSString *const SELECTED_VENDER_CELL = @"SelectedVenderTableViewCell";
NSString *const SERVICES_MEMBERSHIP_CELL = @"ServiceMembershipTableViewCell";
NSString *const OFFERS_CATEGORY_CELL = @"OfferCategoryTableViewCell";
NSString *const OFFERS_TAB_CELL = @"OffersTabTableViewCell";
NSString *const MEMBERSHIP_SLOT_CELL = @"MembershipSlotTableViewCell";
NSString *const MEMBERSHIP_TIME_SLOT_CELL = @"MembershipTimeSlotCollectionViewCell";
NSString *const PREFERENCE_CATEGORY_CELL = @"CategoryPreferenceCollectionViewCell";
// Controller Names
NSString *const HOME_CONTROLLER = @"HomeViewController";
NSString *const LOGIN_CONTROLLER = @"LoginViewController";
NSString *const REGISTER_CONTROLLER = @"RegisterViewController";
NSString *const ROOT_CONTROLLER = @"RootViewController";
NSString *const SIDE_MENU_CONTROLLER = @"SideMenuViewController";
NSString *const SIDE_MENU_NAV_CONTROLLER = @"SideMenuNavController";
NSString *const HOME_NAV_CONTROLLER = @"HomeNavigationController";
NSString *const DISCOVER_CONTROLLER = @"DiscoverViewController";
NSString *const SELECTIONS_LIST_CONTROLLER = @"SelectionsListViewController";
NSString *const SELECTED_VENDER_CONTROLLER = @"SelectedVenderViewController";
NSString *const SERVICES_DETAIL_CONTROLLER = @"ServicesDetailViewController";
NSString *const FT_VENDER_DETAIL_CONTROLLER = @"FTVendorDetailViewController";
NSString *const ACCOUNT_VIEW_CONTROLLER = @"AccountViewController";
NSString *const SERVICES_TAB_CONTROLLER = @"ServicesTabViewController";
NSString *const CONFIRMATION_CONTROLLER = @"ConfirmationViewController";
NSString *const WRITEREVIEW_CONTROLLER = @"FTWriteReviewViewController";
NSString *const GOOGLEMAP_CONTROLLER = @"FTGmapViewController";
NSString *const MYTRIALS_TABLEVIEW_CELL=@"MyTrialsTableViewCell";
NSString *const OFFERS_LIST_CONTROLLER = @"OffersListViewController";
NSString *const REVIEW_VIEWALL_CONTROLLER =@"FTReviewViewAllViewController";
NSString *const FORGOT_PASSWORD_CONTROLLER= @"ForgotPasswordViewController";
NSString *const FTGALLERY_SINGLE_CONTROLLER= @"FTGalleryViewController";
NSString *const SPLASH_SCREEN_CONTROLLER = @"SplashScreenViewController";
NSString *const PERSONALIZE_EXPERIENCE_CONTROLLER = @"PersonalizeYourExperienceViewController";
NSString *const FILL_PREFERENCE_CONTROLLER = @"FillPreferenceViewController";
NSString *const CHANGE_PASSWORD_CONTROLLER = @"ChangePasswordViewController";
NSString *const OTP_CONTROLLER = @"OtpViewController";


NSString *const FT_TRIAL_PAGE_DETAIL_CONTROLLER = @"FTTrialDetailsPageVC";

NSString *const FT_BOOK_A_TRIAL_PROFILE_VIEW_CONTROLLER_IDENTIFIER = @"BookATrialProfileViewController";
NSString *const FT_BOOK_A_TRIAL_SERVICE_VIEW_CONTROLLER_IDENTIFIER = @"BookATrialViewController";
NSString *const FT_SLOT_SELECTION_VIEW_CONTROLLER_IDENTIFIER = @"SlotSelectionViewController";
NSString *const FT_SLOT_SELECTION_SESSION_STORYBOARD_IDENTIFIER = @"SlotSelectionSessionViewController";
NSString *const FT_UPCOMING_SESSION_VIEW_CONTROLLER_IDENTIFIER = @"FTUpcomingClassesSessionsViewController";
NSString *const FT_FILTERVIEWCONTROLLER_IDENTIFIER = @"FilterViewController";
NSString *const FT_SEARCH_VC = @"FTSearchViewController";
NSString *const FT_AUTOSUGGESTEDSEARCH_VC = @"FTAutoSuggestedSearchViewController";
NSString *const FT_HOMESCREENLOCATIONSEARCH_VC = @"HomeScreenLocationSearchViewController";
NSString *const THANKYOU_VC = @"ThankYouViewController";
NSString *const BOOKTRIALMANUALCONFIRMEDVC = @"BookTrialManualConfirmedViewController";
NSString *const PAYUMONEYVIEWCONTROLLER = @"PayUViewController";

NSString *const FINDER_OFFERINGS_CONTROLLER = @"FinderInfoViewController";
NSString *const OFFERS_VIEW_CONTROLLER = @"OffersViewController";
NSString *const MEMBERSHIP_SLOTS_CONTROLLER = @"SelectMembershipSlotViewController";
NSString *const FT_UPCOMING_CLASSES_VC = @"UpcomingClassesViewController";


NSString *const PAYMENTOPTIONVC = @"PaymentOptionsViewController";

//Storyboard Names
NSString *const HOME_STORYBOARD = @"Home";
NSString *const LOGIN_STORYBOARD = @"Login";
NSString *const FT_SLOT_SELECTION_STORYBOARD_IDENTIFIER = @"SlotSelection";
NSString *const FT_BOOK_A_TRIAL_STORYBOARD_IDENTIFIER = @"BookATrial";
NSString *const FT_FILTER_STORYBOARD_IDENTIFER = @"FilterStoryboard";
NSString *const PAYUMONEY_STORYBOARD = @"PayUStoryboard";
NSString *const UPCOMING_CLASSES_STORYBOARD = @"UpcomingClassesStoryboard";

//Custom Nib Names
NSString *const CUSTOME_BUTTON = @"CustomButton";
NSString *const CUSTOME_BUTTON2 = @"CustomButton2";

// NSNotifications Names

NSString *const USER_LOCATION_NOTIFICATION = @"Use Current Location";
NSString *const ROW_UPDATE_NOTIFICATION = @"Update Row Selector";


NSString *const ABOUT_FITTERNITY_TEXT = @"Fitternity is India’s biggest online fitness search and discovery platform which allow users to find their favourite form of fitness with free trials, appointments and in-depth information on each location. It enables you to shortlist a fitness activity in their vicinity and gives them the convenience of easy payment options including EMIs, convenient batches for trials & appointments and flexible membership start dates.With 8000 + fitness brands listed on the platform, across 15 + categories of fitness at great prices, Fitternity’s users are spoilt for choice. Fitternity operates in Mumbai, Thane, Navi Mumbai, Delhi, Gurgaon, Bangalore and Pune.  \nReach out to us on 022-61222222 and info@fitternity.com";

NSString *const EMAIL_MESSAGE = @"Hi, \n I would love to hear more form Fitternity. \n Thanks.";
NSString *const EMAIL_SUBJECT = @"Request Call Back";
NSString *const ABOUT_FITTERNITY_TITLE=@"About Fitternity";
NSString *const REQUEST_CALL_BACK_TITLE=@"Request a Call Back";
NSString *const ABOUT_FITTERNITY_EMAIL_BUTTON_ICON=@"about_fitternity_email";
NSString *const ABOUT_FITTERNITY_EMAIL_BUTTON_NAME=@"info@fitternity.com";
NSString *const ABOUT_FITTERNITY_PHONE_BUTTON_ICON=@"about_fitternity_phone";
NSString *const ABOUT_FITTERNITY_PHONE_BUTTON_NAME=@"02261222222";
// Book A Trial VC Constant
NSString *const BOOKATRIAL_PREFERREDDAY_MONWEDFRI = @"Mon - Wed - Fri";
NSString *const BOOKATRIAL_PREFERREDDAY_TUESTHRUSAT = @"Tues - Thur - Sat";
NSString *const BOOKATRIAL_PREFERREDDAY_SATSUN = @"Sat-Sun";

NSString *const BOOKATRIAL_PREFERREDTIME_BEFORE10AM = @"Before 10 AM";
NSString *const BOOKATRIAL_PREFERREDTIME_10AM2PM = @"10 AM - 2 PM";
NSString *const BOOKATRIAL_PREFERREDTIME_2PM6PM = @"2 PM - 6PM";
NSString *const BOOKATRIAL_PREFERREDTIME_6PM10PM = @"6PM - 10PM";

NSString *const BOOKATRIAL_VC_TITLE = @"Book A Trial";

// Confirmation Screen Constants
NSString *const CONFIRMATION_SCREEN_FREETRIALSESSION = @" ( Free via Fritternity)";
NSString *const CONFIRMATION_SCREEN_CUSTOMERIDENTITYEMAIL = @"email";
NSString *const CONFIRMATION_SCREEN_CUSTOMERSOURCE = @"iOS";
NSString *const CONFIRMATION_SCREEN_TYPE_MEMBERSHIP = @"memberships";
NSString *const CONFIRMATION_SCREEN_TYPE_UPCOMING_CLASSES = @"upcomingclass";

NSString *const CONFIRMATION_SCREEN_NAMESHOULDBEFILLED = @"Name should be filled";
NSString *const CONFIRMATION_SCREEN_EMAILSHOULDBEFILLED = @"Email should be filled";
NSString *const CONFIRMATION_SCREEN_EMAILSHOULDBEVALID = @"Email should be valid";
NSString *const CONFIRMATION_SCREEN_PHONESHOULDBEFILLED = @"Phone should be filled";
NSString *const CONFIRMATION_SCREEN_PHONESHOULDBEVALID = @"Phone should be valid";

NSString *const CONFIRMATION_SCREEN_EMAIL_ICON = @"email_icon_white";
NSString *const CONFIRMATION_SCREEN_PROFILE_ICON = @"profile_icon_white";
NSString *const CONFIRMATION_SCREEN_PHONE_ICON = @"phone_icon_white";

NSString *const CONFIRMATION_SCREEN_ALERTOKMSG = @"ok";

// Thank You Screen
NSString *const THANKYOU_SCREEN_HEADER_SUBTITLE_MEMBERHSIP = @"Your membership has been confirmed";
NSString *const THANKYOU_SCREEN_HEADER_SUBTITLE_UPCOMINGCLASSES = @"Your class has been confirmed";
NSString *const THANKYOU_SCREEN_HEADER_SUBTITLE_TRIAL_SESSION = @"Your trial session has been confirmed";
NSString *const THANKYOU_SCREEN_HEADER_SUBTITLE_SESSION = @"Your session has been confirmed";

NSString *const THANKYOU_SCREEN_HEADER_BOOKINGMEMBERSHIP_ABOUTYOURREQUEST = @"Here are details about your request:";
NSString *const THANKYOU_SCREEN_HEADER_BOOKINGMEMBERSHIP_ABOUTYOURTRIAL = @"Here are details about your trial:";

NSString *const THANKYOU_SCREEN_HEADER_BOOKINGMEMBERSHIP_NOTE1 = @"1.You will receive an email and SMS from Fitternity with the subscription code.\n2.Fitternity team will be reaching out to you to confirm the session.\n3.Please flash the subscription code at the gym/studio and attend your workout session.";
NSString *const THANKYOU_SCREEN_HEADER_BOOKINGMEMBERSHIP_NOTE2 = @"1.This is not a confirmed session.\n2.Fitternity team will be reaching out to you to arrange the session.\n3.Please flash the subscription code at the gym/studio and attend your workout session.";

NSString *const THANKYOU_SCREEN_HEADER_BOOKINGMEMBERSHIP_NOTE_TRIAL_AUTO_FREE = @"1. We will be sharing an email and SMS with all the details mentioned above\n2. Please flash the subscription ID at the gym / studio to access your trial session\n3. Our team will reach out to you post the trial to understand your feedback and help you purchase the membership at a discount\n4. In case of any queries - email us on support@fitternity.com or call us on 02261222233";
NSString *const THANKYOU_SCREEN_HEADER_BOOKINGMEMBERSHIP_NOTE_TRIAL_AUTO_PAID = @"1. We will be sharing an email and SMS with all the details mentioned above\n2. Please flash the subscription ID at the gym / studio to access your trial session\n3. Our team will reach out to you post the trial to understand your feedback and help you purchase the membership at a discount\n4. In case of any queries - email us on support@fitternity.com or call us on 02261222233";
NSString *const THANKYOU_SCREEN_HEADER_BOOKINGMEMBERSHIP_NOTE_TRIAL_MANUAL = @"1. Fitternity team will reach out to you shortly and coordinate your trial with the respective gym / studio\n2. After the trial is confirmed we will be sharing an email and SMS with all the details and a subscription ID\n3. To access the trial session you have to flash the subscription ID at the gym / studio\n4. In case of any queries - email us on support@fitternity.com or call us on 02261222233";
NSString *const THANKYOU_SCREEN_HEADER_BOOKINGMEMBERSHIP_NOTE_WORKOUT_SESSION = @"1. We will be sharing an email and SMS with all the details mentioned above\n2. Your details have been shared with the gym / studio along with slot you have selected\n3. Please flash the subscription ID at the gym / studio to access your workout session\n4. In case of any queries - email us on support@fitternity.com or call us on 02261222233";

NSString *const THANKYOU_SCREEN_HEADER_BOOKINGMEMBERSHIP_NOTE_MEMBERSHIP_DIRECT = @"1. We will be sharing an email and SMS with all the details mentioned above\n2. Your details have been shared with the gym / studio along with the preferred starting date\n3. Please flash the subscription ID at the gym / studio to start your membership\n4. In case of any queries - email us on support@fitternity.com or call us on 02261222233";
NSString *const THANKYOU_SCREEN_HEADER_BOOKINGMEMBERSHIP_NOTE_MEMBERSHIP_COD = @"1. Fitternity team will reach out to you shortly and coordinate your membership purchase\n2. Once the purchase details are confirmed - we will be sending across someone to pickup the cash and send you the payment receipt / invoice\n3. Basis the subscription ID provided by Fitternity - you can flash the code and start your membership\n4. In case of any queries - email us on support@fitternity.com or call us on 02261222233";
NSString *const THANKYOU_SCREEN_HEADER_BOOKINGMEMBERSHIP_NOTE_MEMBERSHIP_FAKE = @"1. Fitternity team will reach out to you shortly and coordinate your membership purchase\n2. Once the purchase details are confirmed - we will be sending you a link to make the payment\n3. You can make the make an online payment and also avail the EMI option\n4. In case of any queries - email us on support@fitternity.com or call us on 02261222233";

NSString *const THANKYOU_SCREEN_HEADER_BOOKINGMEMBERSHIP_THANKS0 = @"Your trial booking is confirmed.";
NSString *const THANKYOU_SCREEN_HEADER_BOOKINGMEMBERSHIP_THANKS1 = @"Thank you for request.";
NSString *const THANKYOU_SCREEN_HEADER_BOOKINGMEMBERSHIP_THANKS2 = @"Your trial booking has been confirmed.";
NSString *const THANKYOU_SCREEN_HEADER_BOOKINGMEMBERSHIP_THANKS3 = @"Membership purchased successful.";
NSString *const THANKYOU_SCREEN_HEADER_BOOKINGMEMBERSHIP_THANKS4 = @"Your membership purchased request has been received.";
NSString *const THANKYOU_SCREEN_HEADER_BOOKINGMEMBERSHIP_THANKS5 = @"Your workout session has been confirmed.";

NSString *const THANKYOU_SCREEN_HEADER_MEMBERSHIP_THANKS = @"Thank you for your request.";
NSString *const THANKYOU_SCREEN_HEADER_MEMBERSHIP_REACHOUT = @"We will reachout to you shortly and help you with the purchase.";
NSString *const THANKYOU_SCREEN_HEADER_MEMBERSHIP_DETAILS = @"Here are details you have enquired about: ";
NSString *const THANKYOU_SCREEN_HEADER_MEMBERSHIP_NOTE = @"1.Fitternity team will be reaching out to you to help you on the purchase.\n2.On purchasing the membership, you will receive the subscription ID which needs to be flashed at the gym / studio to start the membership.";

// Payment Screen
NSString *const PAYMENT_SCREEN_TITLE = @"Payment";
NSString *const PAYMENT_GENERATETEMPORDER_RESPONSE_ORDER = @"order";
NSString *const PAYMENT_GENERATETEMPORDER_RESPONSE_ORDER_ID = @"_id";

// Search View Constant
NSString *const FTSEARCHTABLEVIEWCELL_MULTIPLELOCATIONS = @"Multiple Locations";

// user default constants
NSString *const BOOKMARK_LIST = @"userBookmark";
NSString *const MAP_USERLAT = @"map_userlat";
NSString *const MAP_USERLONG= @"map_userlong";
NSString *const MAP_USERCITY = @"map_usercity";
NSString *const MAP_USERDATA = @"map_userdata";
NSString *const MAP_USERSUBLOCALITY = @"map_sublocality";

#pragma mark - Search Options
NSString *const FT_VENDORSEARCH_SEARCHBAR_NOTEXTFOUND_TEXT = @"All Fitness Options";


NSString *const HEALTHY_TIFFINS = @"healthy tiffins";
NSString *const HEALTHY_SNACKS_BEVERAGES= @"healthy snacks and beverages";
NSString *const PERSONAL_TRAINER=@"personal trainers";


NSString *const DEVICE_TYPE=@"ios";
NSString *const FT_DEVICE_TOKEN = @"deviceToken";



NSString *const TRIAL_CANCEL=@"cancel";
NSString *const TRIAL_RESCHEDULE = @"reschedule";
NSString *const TRIAL_CONFIRM=@"confirm";


@end
