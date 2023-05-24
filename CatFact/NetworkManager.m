#import <Foundation/Foundation.h>
#import "NetworkManager.h"

@implementation NetworkManager

+ (void)performGETRequestWithURL:(NSURL *)url completionHandler:(void (^)(NSDictionary *responseDict, NSError *error))completionHandler {
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            // Handle error
            completionHandler(nil, error);
        } else {
            NSError *jsonError = nil;
            NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            if (jsonError) {
                // Handle JSON parsing error
                completionHandler(nil, jsonError);
            } else {
                // Process the response data
                completionHandler(responseDict, nil);
            }
        }
    }];
    
    [dataTask resume];
}
+ (void)performGETRequestArray:(NSURL *)url completionHandler:(void (^)(NSArray *responseArray, NSError *error))completionHandler {
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            // Handle error
            completionHandler(nil, error);
        } else {
            NSError *jsonError = nil;
            NSArray *responseArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            if (jsonError) {
                // Handle JSON parsing error
                completionHandler(nil, jsonError);
            } else {
                // Process the response data
                completionHandler(responseArray, nil);
            }
        }
    }];
    
    [dataTask resume];
}


@end
