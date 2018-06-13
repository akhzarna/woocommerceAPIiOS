//
//  AFOAuth1OneLeggedClientWooParser.m
//  OrangeFashion
//
//  Created by Triệu Khang on 20/6/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "AFOAuth1OneLeggedClientWooParser.h"
#import "AFOAuth1OneLeggedClient.h"

@interface AFOAuth1OneLeggedClientWooParser()
<
AFOAuth1OneLeggedClientWooParserProtocol
>

@end

@implementation AFOAuth1OneLeggedClientWooParser

- (NSArray *)wooCommerceParsedResponseObject:(id)responseObject {
    BOOL isData = [responseObject isKindOfClass:[NSData class]];

    if (!isData) {
        NSLog(@"The response object is not correct type ( shoud be NSData )");
        return @{};
    }

    NSError *error = nil;
    
    
    NSArray *dictionnary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&error];


//    NSLog(@"Response Meta: %@", dict);
//    
//    NSString *jsonString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//    NSRange range = [jsonString rangeOfString:@"{"];
//    if (range.location != NSNotFound) {
//        jsonString = [jsonString substringFromIndex:range.location];
//    }
//
//    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
//    NSDictionary *dictionnary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
//    NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
//
//    BOOL isDictionary = [dictionnary isKindOfClass:[NSDictionary class]];
//    if (!isDictionary) {
//        NSLog(@"The parsed response object is not correct type ( shoud be NSDictionary )");
//        return @{};
//    }

    return dictionnary;
}

@end
