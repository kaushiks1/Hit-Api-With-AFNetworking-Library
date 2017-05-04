//
//  ULTask.h
//  Catalog-App
//
//  Created by Kuliza on 10/15/14.
//  Copyright (c) 2014 Urban Ladder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef NS_ENUM(NSInteger, FTTaskType){
    GENERIC_HTTP_POST,
	GENERIC_HTTP_GET,
    GENERIC_HTTP_PUT,
    GENERIC_HTTP_DELETE,
};

typedef NS_ENUM(NSInteger, FTTaskState){
    STARTING,
    CANCELLING,
    CANCELLED,
    PROCESSING,
    FINISHED,
};


typedef void (^FTTaskResponseBlock)(NSDictionary *request, id response);

@interface FTTask : NSObject //NSURLSessionTask

@property (readonly, nonatomic) NSString *taskIdentifier;

@property (strong, nonatomic) NSString *url;

@property (readonly, nonatomic) NSString *callType;

@property (assign, nonatomic) FTTaskType type;

@property (assign, nonatomic) FTTaskState state;

@property (readonly, nonatomic) BOOL isDBRequired;

@property (copy, nonatomic) id taskParams;

@property (copy, nonatomic) id optionalParams;

@property (strong, nonatomic) id networkObject;

@property (strong, nonatomic) NSString *className;

- (void)setCompletionhandler:(FTTaskResponseBlock)successBlock error:(FTTaskResponseBlock)errorBlock;

- (BOOL)finishWithSuccess:(NSDictionary *)response request:(NSDictionary *)request;

- (void)finishWithError:(NSDictionary *)response request:(NSDictionary *)request;

- (NSDictionary *)processDBCall;

- (BOOL)storeInDB:(NSDictionary *)response;

- (id)getCleanedUpParams;

- (AFHTTPRequestSerializer *)getRequestSerializer;

- (NSArray *)getRequestHeaders;

@end

