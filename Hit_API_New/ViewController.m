//
//  ViewController.m
//  Hit_API_New
//
//  Created by Kaushik on 20/07/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "ViewController.h"
#import "FTTask.h"
#import "Helper.h"
#import "RequestManager.h"
#import "NetworkConstants.h"
#import "AppConstants.h"
#import "FTAutoSuggestedSearchJsonModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonActionClickToHitAPI:(id)sender
{
    
    [self hitAPIsearchString:@"u"];
    
    /*
    [self getTrialDetailsTrialID:40786];
    */
    
    /*
    [self hitlocationcityAPI:@"u"];
    
     */
    
    /*
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjects:@[@"email",@"amit@yopmail.com",@"123456"] forKeys:@[@"identity",@"email",@"password"]];
    
    [self customerLogin:dictionary];
     */
    
}


-(void)customerLogin:(NSDictionary *) params
{
   // if([Helper internetIsOn])
    {
        
        FTTask *login = [[RequestManager sharedInstance] getUserLoginTask:params];
        [login setCompletionhandler:^(NSDictionary *request, id response) {
            
            NSLog(@"%@",response);
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:response[@"token"] forKey:@"userToken"];
            
            FTTask *getProfile = [[RequestManager sharedInstance] getUserProfile:@{@"authorization":response[@"token"]}];
            [getProfile setCompletionhandler:^(NSDictionary *request, id response)
             {
                 NSLog(@"%@",response[@"customer"]);
                 NSData *userProfileData = [NSKeyedArchiver archivedDataWithRootObject:response[@"customer"]];
                 [defaults setObject:userProfileData forKey:@"userProfile"];
                 
                 

                 
             } error:^(NSDictionary *request, id response) {
                 
                 NSString *errorMessage = response[@"message"];
                 if ([response[ERRORCODE] isEqualToNumber:[NSNumber numberWithInteger:666]])
                 {
                     errorMessage = NETWORK_ERROR_MESSAGE;
                 }
                 
                 [Helper makeAlert:errorMessage  withTitle:ERROR_TEXT];
                 
              
             }];
            
           
            
        } error:^(NSDictionary *request, id response) {
            
            NSLog(@"%@",response);
 
                
                NSString *errorMessage = response[@"message"];
                if ([response[ERRORCODE] isEqualToNumber:[NSNumber numberWithInteger:666]]) {
                    errorMessage = NETWORK_ERROR_MESSAGE;
                }
                
                [Helper makeAlert:errorMessage  withTitle:ERROR_TEXT];
            
        }];
    }
//    else
//    {
//        UIAlertView *alert = [Helper makeNetworkAlert];
//        [alert show];
//    }
}


- (void)hitlocationcityAPI:(NSString *)searchString
{
    
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    //        params[@"keyword"] = self.searchString;
    //        FTLocationUserDefaultModel *location = [[FTUserDefaults shared] getUserLocationData];
    //
    //        if((location.latitude != nil && (![location.latitude isEqual:[NSNull null]])) && (location.longitude != nil && ![location.longitude isEqual:[NSNull null]]))
    //        {
    //            params[@"location"] = @{@"city" : location.selectedCity,
    //                                    @"lat":location.latitude,
    //                                    @"long":location.longitude
    //                                    };
    //        }
    //        else
    //        {
    //            params[@"location"] = @{@"city" : location.selectedCity};
    //        }
    //
    //        if (isNew == YES)
    //        {
    //            self.currentPage = @0;
    //            self.recordsPerPage = @20;
    //        }
    //
    //        params[@"offset"] = @{@"from" : self.currentPage , @"number_of_records" : [self.recordsPerPage stringValue]};
    
    //        FTLocationUserDefaultModel *location = [[FTUserDefaults shared] getUserLocationData];
    //        NSLog(@"%@",[location.selectedCity capitalizedString]);
    //        NSLog(@"%@",[[location.selectedCity capitalizedString] stringByReplacingOccurrencesOfString:@" " withString:@"-"]);
    //        params[@"city"] = [[location.selectedCity capitalizedString] stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    
    
    NSString *stringSearchLocation = [searchString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    FTTask *keywordSearchTask = [[RequestManager sharedInstance] createAutoSuggestedSearchLocation:params searchString:stringSearchLocation];
    [keywordSearchTask setCompletionhandler:^(NSDictionary *request, id response)
     {
         
         
         //    self.totalRecords = response.meta.total_records;
         NSLog(@"%@",response);
                 DebugLog(@"response results==>%lu", (unsigned long)[[response objectForKey:@"location"] count]);
         
        
         
     }error:^(NSDictionary *request, NSDictionary *response)
     {
         NSLog(@"error in getting rank finder api");
     }];
}


-(void)getTrialDetailsTrialID:(int)trialId
{
    
 //   if([Helper isUserLoggedIn])
    {
        
        FTTask *homeData = [[RequestManager sharedInstance]getTrialDetailsPageDataForTrialId:trialId];
        
        [homeData setCompletionhandler:^(NSDictionary *request, id response) {
            NSLog(@"%@",response);
            
        }error:^(NSDictionary *request, id response) {
            
             NSLog(@"%@",response);
        }];
        
    }
    
    
}


- (void)hitAPIsearchString:(NSString *)searchString
{
    NSMutableDictionary *params = [NSMutableDictionary new];
    params[@"keyword"] = searchString;
   
    params[@"location"] = @{@"city" : @"mumbai"};
    
    self.currentPage = 0;
    //self.recordsPerPage = 20;
    
    params[@"offset"] = @{@"from" : @"0" , @"number_of_records" : @"20"};
    
    FTTask *keywordSearchTask = [[RequestManager sharedInstance] createAutoSuggestedSearchTask:params];
    [keywordSearchTask setCompletionhandler:^(NSDictionary *request, FTAutoSuggestedSearchJsonModel *response)
     {
         
        NSLog(@"%@",response);
         
        DebugLog(@"response results==>%lu", (unsigned long)response.results.count);
         
     }error:^(NSDictionary *request, NSDictionary *response)
     {
         NSLog(@"%@",response);
         NSLog(@"error in getting rank finder api");
     }];
}


@end
