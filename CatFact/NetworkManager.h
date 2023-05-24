//
//  NetworkManager.h
//  CatFact
//
//  Created by TribalScale on 2023-05-17.
//

#ifndef NetworkManager_h
#define NetworkManager_h

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject

+ (void)performGETRequestWithURL:(NSURL *)url completionHandler:(void (^)(NSDictionary *responseDict, NSError *error))completionHandler;

+ (void)performGETRequestArray:(NSURL *)url completionHandler:(void (^)(NSArray *responseArray, NSError *error))completionHandler;

@end

#endif /* NetworkManager_h */
