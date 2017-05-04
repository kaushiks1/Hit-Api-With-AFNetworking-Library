//
//  ULTaskProcessor.m
//  Catalog-App
//
//  Created by Kuliza on 10/20/14.
//  Copyright (c) 2014 Urban Ladder. All rights reserved.
//

#import "FTTaskProcessor.h"
#import "NetworkConstants.h"
#import "JSONModel.h"

static FTTaskProcessor *sharedInstance;

@interface FTTaskProcessor()

@property (strong, nonatomic) NSMutableArray *pendingTasks;
@property (strong, nonatomic) FTHTTPClient *httpClient;

@end

@implementation FTTaskProcessor

#pragma mark - Lifecycle

-(instancetype)init{
    if (!(self = [super init])) {
        return nil;
    }
    return self;
}

+ (FTTaskProcessor *) sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[FTTaskProcessor alloc] init];
    });
    return sharedInstance;
}



#pragma mark - Custom Accessors

- (FTHTTPClient *) httpClient {
    if (!_httpClient) {
        _httpClient= [[FTHTTPClient alloc]initWithBaseURL:[NSURL URLWithString:[NetworkConstants getBaseUrl]]
                                   sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        _httpClient.delegate = self;
    }
    return _httpClient;
}

- (NSMutableArray *) pendingTasks {
    if (!_pendingTasks) {
        _pendingTasks = [[NSMutableArray alloc] init];
    }
    return _pendingTasks;
}

#pragma mark - Public

- (void)cancelAllTasks {
    for (FTTask *task in self.pendingTasks) {
        if (task.networkObject) {
            task.state = CANCELLING;
            [task.networkObject cancel];
        }
    }
    [self.pendingTasks removeAllObjects];
}

- (void)cancelAllTasksOfType:(FTTaskType)type {
    NSMutableIndexSet *cancelTasks = [NSMutableIndexSet indexSet];
    for (int i=0; i < [self.pendingTasks count]; i++) {
        FTTask *task = [self.pendingTasks objectAtIndex:i];
        if (task.type == type) {
            task.state = CANCELLING;
            if (task.networkObject) {
                [task.networkObject cancel];
            }
            [cancelTasks addIndex:i];
        }
    }
    [self.pendingTasks removeObjectsAtIndexes:cancelTasks];
}

- (void)cancelTask:(NSString *)taskId {
    int i=0;
    for (i=0; i < [self.pendingTasks count]; i++) {
        FTTask *task = [self.pendingTasks objectAtIndex:i];
        if ([[task taskIdentifier] isEqualToString:taskId]) {
            task.state = CANCELLING;
            if (task.networkObject) {
                [task.networkObject cancel];
                break;
            }
        }
    }
    [self.pendingTasks removeObjectAtIndex:i];
}

/*
 * If execute returns NO, it means the task was not submitted successfully, so you can retry.
 */
- (BOOL)execute:(FTTask *)task
{
    NSDictionary *dbResults = nil;
    
    if ([task isDBRequired]) {
        dbResults = [task processDBCall];
    }
    
    NSMutableDictionary *cleanedUpParams = [[NSMutableDictionary alloc] init];
    id paramsData = [task getCleanedUpParams];
    
    if (paramsData)
    {
        [cleanedUpParams setObject:paramsData forKey:@"params"];
    }
    
    cleanedUpParams[@"task"] = task;
    
    cleanedUpParams[@"serializer"] = [task getRequestSerializer];
    if(task.optionalParams)
    {
        cleanedUpParams[@"headers"] = [task getRequestHeaders];
    }
    cleanedUpParams[@"className"] = task.className;
    
    if (dbResults)
    {
        [task finishWithSuccess:dbResults request:cleanedUpParams];
        task.state = FINISHED;
        return YES;
    }
    
    NSLog(@"check the params %@",paramsData);
    
    NSLog(@"check the url %@",[task url]);
    
    
   //5 Call the method:
    NSURLSessionTask *networkTask = [self.httpClient makeHTTPCall:[task url] withParams:cleanedUpParams callType:[task callType]];
    //if networkTask is nil, it means network is not reachable
    if (networkTask && task.state != CANCELLING)
    {
        //just in case someone cancelled the task even before execution could begin
        task.networkObject = networkTask;
        task.state = PROCESSING;
        [self.pendingTasks addObject:task];
        return YES;
    }
    return NO;
}

#pragma mark - Private

- (void)removeTask:(FTTask *)task {
    FTTask *taskToDelete = nil;
    for (FTTask *ulTask in self.pendingTasks) {
        if ([[ulTask taskIdentifier] isEqualToString:[task taskIdentifier]]) {
            taskToDelete = ulTask;
            break;
        }
    }
    
    if (taskToDelete) {
        [self.pendingTasks removeObject:taskToDelete];
    }
}

#pragma mark - NetworkLayer

- (void)NetworkAdapterDelegateDidFinish:(id)responseFromNetworkLayer{
    NSDictionary *requestObject = [responseFromNetworkLayer objectForKey:REQUESTOBJECT];
    NSDictionary *response = [responseFromNetworkLayer objectForKey:RESPONSE];
    //parsing logic...
    FTTask *task = [requestObject objectForKey:@"task"];
    NSError *error;
    NSString *className = requestObject[@"className"];
    id myObject;
    Class theClass ;
    if(![className isEqualToString:@"nil"])
    {
        theClass = NSClassFromString(className);
    }
    
    
    if ([theClass isSubclassOfClass:[JSONModel class]])
    {
        myObject = [[theClass alloc] initWithDictionary:response error:&error];
    }
    else
    {
        myObject = response;
    }
    
    if ([task state] == CANCELLED || [task state] == CANCELLING) {
        NSLog(@"task is cancelled, ignoring the result for task type %ld", task.type);
        [self removeTask:task];
        return;
    }
    
    //NSLog(@"task finishedWithSuccess for task type %ld", task.type);
    [task finishWithSuccess:myObject request:requestObject];
    task.state = FINISHED;
    
    if ([task isDBRequired]) {
        [task storeInDB:response];
    }
    [self removeTask:task];
}

- (void)NetworkAdapterDelegateDidFinishWithError:(id)errorresponseFromNetworkLayer {
    NSLog(@"NetworkAdapterDelegateDidFinishWithError %@", errorresponseFromNetworkLayer);
    
    NSDictionary *requestObject = [errorresponseFromNetworkLayer objectForKey:REQUESTOBJECT];
    NSDictionary *response = [errorresponseFromNetworkLayer objectForKey:RESPONSE];    
    
    FTTask *task = [requestObject objectForKey:@"task"];
    
    if ([task state] == CANCELLED || [task state] == CANCELLING) {
        NSLog(@"task is cancelled, ignoring the result for task type %ld", task.type);
        [self removeTask:task];
        return;
    }
    
    NSLog(@"task finishedWithError for task type %ld", task.type);
    [task finishWithError:response request:requestObject];
    
    task.state = FINISHED;
    [self removeTask:task];
}

@end
