//
//  ULHttpClient.m
//  Catalog-App
//
//  Created by Kuliza on 10/15/14.
//  Copyright (c) 2014 Urban Ladder. All rights reserved.
//

#import "FTHTTPResponseSerializerWithData.h"
#import "JSONModel.h"
#import "FTHttpClient.h"
#import "NetworkConstants.h"

@implementation FTHTTPClient

#pragma mark - Lifecycle

- (instancetype)initWithBaseURL:(NSURL *)url sessionConfiguration:(NSURLSessionConfiguration *)configuration {
    configuration.HTTPMaximumConnectionsPerHost=4;
    self = [super initWithBaseURL:url sessionConfiguration:configuration];
    
    if (self)
    {
        [self.reachabilityManager startMonitoring];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.requestSerializer.timeoutInterval = 30;
    }
    return self;
}

#pragma mark - Public

- (NSURLSessionTask *)makeHTTPCall:(NSString *)url withParams:(NSDictionary *)params callType:(NSString *)callType{
   // if([self.reachabilityManager isReachable]) {
        if([callType isEqualToString:GET]) {
            return [self getAPIObject:url params:params];
        } else if ([callType isEqualToString:POST]){
            return [self postAPIObject:url params:params];
        }else if([callType isEqualToString:PUT]){
            return [self putAPIObject:url params:params];
        }
        else if([callType isEqualToString:DELETE]){
            return [self deleteAPIObject:url params:params];
        }
//    } else {
//        NSDictionary *responseObject = @{ERROR: @"Network is not reachable", ERRORCODE: @666};
//        NSDictionary *response = @{RESPONSE: responseObject, RESPONSEOBJECT: params};
//        [[self delegate] NetworkAdapterDelegateDidFinishWithError:response];
//    }
    return nil;
}

#pragma mark - Private

- (NSURLSessionTask *)getAPIObject:(NSString *)url params:(NSDictionary *)requestObject
{
    //self.responseSerializer.acceptableContentTypes = [self.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
//    self.responseSerializer=[AFHTTPResponseSerializer serializer];
    for (NSArray *header in [requestObject objectForKey:@"headers"]) {
        [self.requestSerializer setValue:header[1] forHTTPHeaderField:header[0]];
   }
    
    //NSLog(@"get task %@",requestObject);
    //NSLog(@"url %@",url);
    return
    [self GET:url parameters:[requestObject objectForKey:@"params"] success:^(NSURLSessionDataTask *task, id responseObject) {
       // NSError *error = nil;
        //NSDictionary *parseObject=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        

        NSDictionary *response;
        if(responseObject){
            response = @{RESPONSE: responseObject, REQUESTOBJECT: requestObject};
        }else{
            response = @{RESPONSE: [[NSDictionary alloc]init], REQUESTOBJECT: requestObject};
            
        }
        [[self delegate] NetworkAdapterDelegateDidFinish:response];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self APIDataError:task Error:error requestObject:requestObject];
    }];
}

- (NSURLSessionTask *)postAPIObject:(NSString * )url params:(NSDictionary *)requestObject
{
   // self.requestSerializer = [requestObject objectForKey:@"serializer"];
    
    for (NSArray *header in [requestObject objectForKey:@"headers"])
    {
        [self.requestSerializer setValue:header[1] forHTTPHeaderField:header[0]];
    }
    
    //NSLog(@"Request serializer %@",self.requestSerializer);
    //NSLog(@"Response serializer %@",self.responseSerializer);
    
    //NSLog(@"Request Object %@ \n Url %@",requestObject,url);
    
	@try {
        return
        [self POST:url parameters:[requestObject objectForKey:@"params"] success:^(NSURLSessionDataTask *task, id responseObject) {
          //  NSError *error = nil;
//            NSDictionary *parseObject=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
            NSDictionary *response = @{RESPONSE: responseObject, REQUESTOBJECT: requestObject};
            
            [[self delegate] NetworkAdapterDelegateDidFinish:response];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [self APIDataError:task Error:error requestObject:requestObject];
        }];
    } @catch (NSException *exception) {
		NSLog(@"Exception in PostAPIObject : %@",exception);
	}
}

- (NSURLSessionTask *)putAPIObject:(NSString *)url params:(NSDictionary*)requestObject{
    
//    self.responseSerializer = [FTHTTPResponseSerializerWithData serializer];
//    for (NSArray *header in [requestObject objectForKey:@"headers"]) {
//        [self.requestSerializer setValue:header[1] forHTTPHeaderField:header[0]];
//    }

    return [self PUT:url parameters:[requestObject objectForKey:@"params"] success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error = nil;
        //NSDictionary *parseObject=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        NSDictionary *response = @{RESPONSE: responseObject, REQUESTOBJECT: requestObject};
        [[self delegate] NetworkAdapterDelegateDidFinish:response];

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self APIDataError:task Error:error requestObject:requestObject];

    }];
}


- (NSURLSessionTask *)deleteAPIObject:(NSString *)url params:(NSDictionary*)requestObject{

//    self.responseSerializer.acceptableContentTypes = [self.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
//    self.responseSerializer=[AFHTTPResponseSerializer serializer];
//    for (NSArray *header in [requestObject objectForKey:@"headers"]) {
//        [self.requestSerializer setValue:header[1] forHTTPHeaderField:header[0]];
//    }

    return [self DELETE:url parameters:[requestObject objectForKey:@"params"] success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error = nil;
        //NSDictionary *parseObject=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        NSDictionary *response;
        if(responseObject){
            response = @{RESPONSE: responseObject, REQUESTOBJECT: requestObject};
        }else{
            response = @{RESPONSE: [[NSDictionary alloc]init], REQUESTOBJECT: requestObject};
 
        }
        [[self delegate] NetworkAdapterDelegateDidFinish:response];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self APIDataError:task Error:error requestObject:requestObject];
        
    }];
}

-(void)APIDataError:(NSURLSessionTask *)task Error:(NSError *)error requestObject:(NSDictionary *)requestObject{
    NSHTTPURLResponse *httpURLResponse=(NSHTTPURLResponse *)task.response;
    NSNumber *errorCode = @666;
    if (httpURLResponse) {
        errorCode = @(httpURLResponse.statusCode);
    }
	id errorBody = error.userInfo[HTTPResponseSerializerWithDataKey];
    if(!errorBody) {
        errorBody = [[NSDictionary alloc]init];
    }
    
    if (![errorBody isKindOfClass:[NSDictionary class]]) {
        errorBody = @{ERRORCODE:@777,ERRORMSG:errorBody};
    }
    
    NSDictionary *responseObject = @{ERROR: [error localizedDescription], ERRORCODE: errorCode, error:errorBody};
    NSDictionary *response = @{RESPONSE: responseObject, REQUESTOBJECT: requestObject};
	[[self delegate] NetworkAdapterDelegateDidFinishWithError:response];
}


@end
