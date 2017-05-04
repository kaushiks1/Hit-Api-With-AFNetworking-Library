//
//  ULTaskProcessor.h
//  Catalog-App
//
//  Created by Kuliza on 10/20/14.
//  Copyright (c) 2014 Urban Ladder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTTask.h"
#import "FTHttpClient.h"

@interface FTTaskProcessor : NSObject <NetworkLayerDelegate>

+ (FTTaskProcessor *) sharedInstance;

- (void)cancelAllTasks;

- (void)cancelAllTasksOfType:(FTTaskType)type;

- (void)cancelTask:(NSString *)taskId;

- (BOOL)execute:(FTTask *)task;

@end
