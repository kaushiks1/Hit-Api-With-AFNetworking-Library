#import "FTGenericHTTPPostTask.h"
#import "NetworkConstants.h"

@implementation FTGenericHTTPPostTask


#pragma mark - Custom Accessors

- (BOOL)isDBRequired {
    return NO;
}

- (NSString *)callType {
    return POST;
}
@end
