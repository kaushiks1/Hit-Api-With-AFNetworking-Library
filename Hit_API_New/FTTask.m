//
//  ULTask.m
//  Catalog-App
//
//  Created by Kuliza on 10/15/14.
//  Copyright (c) 2014 Urban Ladder. All rights reserved.
//

#import "FTTask.h"



@interface FTTask()


@property (readwrite, nonatomic) NSString *taskIdentifier;

@property (strong, nonatomic) FTTaskResponseBlock successBlock;

@property (strong, nonatomic) FTTaskResponseBlock errorBlock;


@end

@implementation FTTask


#pragma mark - Lifecycle

- (id) init {
	self = [super init];
	if(self)
	{
        self.state = STARTING;
    }
    return self;
}

#pragma mark - Custom Accessors

- (NSString *)taskIdentifier {
    if (!_taskIdentifier) {
        _taskIdentifier = [[NSUUID UUID] UUIDString];
    }
    return _taskIdentifier;
}

#pragma mark - Public

- (id)getCleanedUpParams {
    id params = [self.taskParams mutableCopy];
    if (!params) {
        params = [[NSMutableDictionary alloc] init];
    }
    return [params copy];
}

- (id)getOptionalParams {
    id params = [self.optionalParams mutableCopy];
    if (!params) {
        params = [[NSMutableDictionary alloc] init];
    }
    return [params copy];
}


- (AFHTTPRequestSerializer *)getRequestSerializer {
    return [AFHTTPRequestSerializer serializer];
}

- (NSArray *)getRequestHeaders
{
    NSMutableArray *headers = [[NSMutableArray alloc] init];
    [headers addObject:@[@"Authorization", self.optionalParams[@"authorization"]]];
    return headers;
}

- (void)setCompletionhandler:(FTTaskResponseBlock)successBlock error:(FTTaskResponseBlock)errorBlock {
    self.successBlock = successBlock;
    self.errorBlock = errorBlock;
}

- (BOOL)finishWithSuccess:(id)response request:(NSDictionary *)request {
    if (self.successBlock) {
        self.successBlock(request, response);
    }
	return TRUE;
}

- (void)finishWithError:(NSDictionary *)response request:(NSDictionary *)request {
    if (self.errorBlock) {
        self.errorBlock(request, response);
    }
}

- (NSDictionary *)processDBCall {
    return nil;
}

- (BOOL)storeInDB:(NSDictionary *)response {
    return NO;
}

- (NSString *)description {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    if (self.taskIdentifier) dict[@"taskidentifier"] = self.taskIdentifier;
    if (self.url) dict[@"url"] = self.url;
    if (self.callType) dict[@"callType"] = self.callType;
    if (self.type) dict[@"type"] = [NSNumber numberWithInt:self.type];
    if (self.state) dict[@"state"] = [NSNumber numberWithInt:self.state];
    dict[@"isDBRequired"] = (self.isDBRequired) ? @YES: @NO;
    if (self.taskParams) dict[@"taskParams"] = self.taskParams;
    
    if(self.className)  dict[@"className"] = self.className;

    
    return [dict description];
}

@end
