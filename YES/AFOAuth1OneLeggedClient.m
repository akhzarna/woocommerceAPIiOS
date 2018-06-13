//
//  AFOAuth1OneLeggedClient.m
//  OrangeFashion
//
//  Created by Triệu Khang on 19/6/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//


#import "AFOAuth1OneLeggedClient.h"
#import "AFOAuth1OneLeggedClientWooParser.h"

@interface AFOAuth1OneLeggedClient()

@property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@property (strong, nonatomic) AFOAuth1OneLeggedClientWooParser *parser;

@end

@implementation AFOAuth1OneLeggedClient

@synthesize defaultHeaders = _defaultHeaders;

- (instancetype)initWithBaseURL:(NSURL *)url key:(NSString *)key secret:(NSString *)secret
{
    if (self = [super initWithBaseURL:url key:key secret:secret]) {
        _parser = [[AFOAuth1OneLeggedClientWooParser alloc] init];
    }

    return self;
}

- (NSDictionary *)OAuthParameters {

    NSMutableDictionary *params = [[super OAuthParameters] mutableCopy];
    return params;
}

- (NSDictionary *)OAuthParametersWithRequest:(NSURLRequest *)request andAdditionalParams:(NSDictionary *)additionalParams{
    NSMutableDictionary *basicParams = [[self OAuthParameters] mutableCopy];
    // get full path
    NSString *requestPath = [request.URL absoluteString];
    NSString *method = request.HTTPMethod;
    // generator signature
    NSString *signature = [self OAuthSignatureForMethod:method
                                                   path:requestPath
                                             parameters:basicParams
                                                  token:nil];
    // append to basic params
    if (![method isEqualToString:@"POST"]) {
    [basicParams addEntriesFromDictionary:additionalParams];
    }
    [basicParams addEntriesFromDictionary:@{
                                           @"oauth_signature": signature
                                           }];
    return basicParams;
}

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      path:(NSString *)path
                                parameters:(NSDictionary *)parameters
{
    NSParameterAssert(method);

    if (!path) {
        path = @"";
    }

    NSURL *url = [NSURL URLWithString:path relativeToURL:self.baseURL];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:method];
    [request setAllHTTPHeaderFields:_defaultHeaders];

    if (parameters) {
        if ([method isEqualToString:@"GET"] || [method isEqualToString:@"HEAD"] || [method isEqualToString:@"DELETE"] || [method isEqualToString:@"PUT"]) {
             url = [NSURL URLWithString:[[url absoluteString] stringByAppendingFormat:[path rangeOfString:@"?"].location == NSNotFound ? @"?%@" : @"&%@", AFQueryStringFromParametersWithEncoding(parameters, self.stringEncoding)]];
            [request setURL:url];
        } else {
            NSLog(@"Post Params = %@",parameters);
            if([parameters valueForKey:@"oauth_signature"] != nil) {
                url = [NSURL URLWithString:[[url absoluteString] stringByAppendingFormat:[path rangeOfString:@"?"].location == NSNotFound ? @"?%@" : @"&%@", AFQueryStringFromParametersWithEncoding(parameters, self.stringEncoding)]];
                [request setURL:url];
            }else{
            
                NSString *charset = (__bridge NSString *)CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(self.stringEncoding));
                NSError *error = nil;
                
                switch (self.parameterEncoding) {
                    case AFFormURLParameterEncoding:
                        [request setValue:[NSString stringWithFormat:@"application/x-www-form-urlencoded; charset=%@", charset] forHTTPHeaderField:@"Content-Type"];
                        [request setHTTPBody:[AFQueryStringFromParametersWithEncoding(parameters, self.stringEncoding) dataUsingEncoding:self.stringEncoding]];
                        break;
                    case AFJSONParameterEncoding:
                        NSLog(@"Params are = %@",parameters);
                        [request setValue:[NSString stringWithFormat:@"application/json; charset=%@", charset] forHTTPHeaderField:@"Content-Type"];
                        [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:parameters options:(NSJSONWritingOptions)0 error:&error]];
                        break;
                    case AFPropertyListParameterEncoding:
                        [request setValue:[NSString stringWithFormat:@"application/x-plist; charset=%@", charset] forHTTPHeaderField:@"Content-Type"];
                        [request setHTTPBody:[NSPropertyListSerialization dataWithPropertyList:parameters format:NSPropertyListXMLFormat_v1_0 options:0 error:&error]];
                        break;
                }
                
                if (error) {
                    NSLog(@"%@ %@: %@", [self class], NSStringFromSelector(_cmd), error);
                }
                
            }
        }
    }
	return request;
}

- (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
	NSURLRequest *request = [self requestWithMethod:@"GET" path:path parameters:parameters];
    NSMutableDictionary *paramsWithOAuth = [[self OAuthParametersWithRequest:request andAdditionalParams:parameters] mutableCopy];

    void (^successAfterParsing)(AFHTTPRequestOperation *operation, id parsedResponseObject) = ^void(AFHTTPRequestOperation *operation, id responseObject) {
        id parsedResponseObject = [self.parser wooCommerceParsedResponseObject:responseObject];
        if (success) {
            success(operation, parsedResponseObject);
        }
    };

    [super getPath:path parameters:paramsWithOAuth success:successAfterParsing failure:failure];
}

- (void)postPath:(NSString *)path
      parameters:(NSDictionary *)parameters
         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
	NSURLRequest *request = [(AFHTTPClient *)self requestWithMethod:@"POST" path:path parameters:parameters];
    NSMutableDictionary *paramsWithOAuth = [[self OAuthParametersWithRequest:request andAdditionalParams:parameters] mutableCopy];
    void (^successAfterParsing)(AFHTTPRequestOperation *operation, id parsedResponseObject) = ^void(AFHTTPRequestOperation *operation, id responseObject) {
        id parsedResponseObject = [self.parser wooCommerceParsedResponseObject:responseObject];
        if (success) {
            success(operation, parsedResponseObject);
        }
    };

    [super postPath:path parameters:paramsWithOAuth parametersURL:parameters success:successAfterParsing failure:failure];
}

- (void)putPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    AFHTTPClient *fakeSelf = (AFHTTPClient *)self;
	NSURLRequest *request = [fakeSelf requestWithMethod:@"PUT" path:path parameters:parameters];
    NSMutableDictionary *paramsWithOAuth = [[self OAuthParametersWithRequest:request andAdditionalParams:parameters] mutableCopy];

    void (^successAfterParsing)(AFHTTPRequestOperation *operation, id parsedResponseObject) = ^void(AFHTTPRequestOperation *operation, id responseObject) {
        id parsedResponseObject = [self.parser wooCommerceParsedResponseObject:responseObject];
        if (success) {
            success(operation, parsedResponseObject);
        }
    };

    [super putPath:path parameters:paramsWithOAuth parametersURL:parameters success:successAfterParsing failure:failure];

}

- (void)deletePath:(NSString *)path
        parameters:(NSDictionary *)parameters
           success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
	NSURLRequest *request = [(AFHTTPClient *)self requestWithMethod:@"DELETE" path:path parameters:parameters];
    NSMutableDictionary *paramsWithOAuth = [[self OAuthParametersWithRequest:request andAdditionalParams:parameters] mutableCopy];

    void (^successAfterParsing)(AFHTTPRequestOperation *operation, id parsedResponseObject) = ^void(AFHTTPRequestOperation *operation, id responseObject) {
        id parsedResponseObject = [self.parser wooCommerceParsedResponseObject:responseObject];
        if (success) {
            success(operation, parsedResponseObject);
        }
    };

    [super deletePath:path parameters:paramsWithOAuth parametersURL:parameters success:successAfterParsing failure:failure];
}

- (void)patchPath:(NSString *)path
       parameters:(NSDictionary *)parameters
          success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
          failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
	NSURLRequest *request = [(AFHTTPClient *)self requestWithMethod:@"PATCH" path:path parameters:parameters];
    NSMutableDictionary *paramsWithOAuth = [[self OAuthParametersWithRequest:request andAdditionalParams:parameters] mutableCopy];

    void (^successAfterParsing)(AFHTTPRequestOperation *operation, id parsedResponseObject) = ^void(AFHTTPRequestOperation *operation, id responseObject) {
        id parsedResponseObject = [self.parser wooCommerceParsedResponseObject:responseObject];
        if (success) {
            success(operation, parsedResponseObject);
        }
    };

    [super patchPath:path parameters:paramsWithOAuth parametersURL:parameters success:successAfterParsing failure:failure];

}

- (NSString *)defaultValueForHeader:(NSString *)header {
	return [self.defaultHeaders valueForKey:header];
}

- (void)setDefaultHeader:(NSString *)header value:(NSString *)value {
	[self.defaultHeaders setValue:value forKey:header];
}

@end
