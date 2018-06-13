//
//  AFOAuth1OneLeggedClient.h
//  OrangeFashion
//
//  Created by Triệu Khang on 19/6/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "AFOAuth1Client.h"

@protocol AFOAuth1OneLeggedClientWooParserProtocol <NSObject>

- (NSDictionary *)wooCommerceParsedResponseObject:(id)responseObject;

@end

@interface AFOAuth1OneLeggedClient : AFOAuth1Client

- (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)postPath:(NSString *)path
      parameters:(NSDictionary *)parameters
         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)putPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)deletePath:(NSString *)path
        parameters:(NSDictionary *)parameters
           success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)patchPath:(NSString *)path
       parameters:(NSDictionary *)parameters
          success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
          failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
