//
//  ULHTTPResponseSerializerWithData.m
//  Catalog-App
//
//  Created by Kuliza on 10/20/14.
//  Copyright (c) 2014 Urban Ladder. All rights reserved.
//


#import "FTHTTPResponseSerializerWithData.h"


@implementation FTHTTPResponseSerializerWithData

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error {
    id HTTPObject = [super responseObjectForResponse:response data:data error:error];
    if (*error) {
        NSMutableDictionary *userInfo = [(*error).userInfo mutableCopy];
        if (!data) {
            userInfo[HTTPResponseSerializerWithDataKey] = [[NSMutableDictionary alloc] init];
		} else {
			NSError *err = nil;
			id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
			if (jsonObject) {
				userInfo[HTTPResponseSerializerWithDataKey] = jsonObject;
			} else {
				userInfo[HTTPResponseSerializerWithDataKey] = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
			}
		}
		
		
        NSError *newError = [NSError errorWithDomain:(*error).domain code:(*error).code userInfo:userInfo];
        (*error) = newError;
    }
    return (HTTPObject);
}

@end
