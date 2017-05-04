//
//  ULHttpClient.h
//  Catalog-App
//
//  Created by Kuliza on 10/15/14.
//  Copyright (c) 2014 Urban Ladder. All rights reserved.
//

#import "AFHTTPSessionManager.h"


@protocol NetworkLayerDelegate;

@interface FTHTTPClient : AFHTTPSessionManager

@property (weak, nonatomic) id<NetworkLayerDelegate> delegate;

- (NSURLSessionTask *)makeHTTPCall:(NSString *)url withParams:(NSDictionary *)params callType:(NSString *)callType;

@end

@protocol NetworkLayerDelegate

- (void)NetworkAdapterDelegateDidFinish:(id)responseFromNetworkLayer;
- (void)NetworkAdapterDelegateDidFinishWithError:(id)errorresponseFromNetworkLayer;


@end
