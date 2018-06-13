//
//  ViewController.m
//  YES
//
//  Created by Akhzar Nazir on 16/06/2017.
//  Copyright © 2017 Akhzar Nazir. All rights reserved.
//

#import "ViewController.h"
#import "AFOAuth1OneLeggedClient.h"

@interface ViewController ()

@end

@implementation ViewController


static inline NSString * AFNounce() {
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    
    return (NSString *)CFBridgingRelease(string);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    // OAUTH_CONSUMER_KEY and OAUTH_CONSUMER_SECRET
    
    
    
 
    
//    AFOAuth1OneLeggedClient *clientGet = [[AFOAuth1OneLeggedClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.rahatayaz.me/spotless/wp-json/wc/v2/"] key:@"ck_ab8ad5a2c6ab56f06d0de7f13b2ff409e022206a" secret:@"cs_d24bf58e922ba9588c8d686857f3f438916930d0"];
//    
//    [clientGet getPath:@"products" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSArray *arr = responseObject;
////        NSLog(@"Get Products Response is = %@",arr);
//        for (int i = 0; i<arr.count; i++) {
//            NSDictionary *dict = [arr objectAtIndex:i];
//            NSLog(@"Get Product Response is = %@",[dict objectForKey:@"name"]);
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Response is = %@",error);
//    }];
    
   
//    NSDictionary *parameters = @{ @"customer_id": @5,
//                                  @"billing": @{ @"first_name": @"John", @"last_name": @"Doe", @"company": @"", @"address_1": @"969 Market", @"address_2": @"", @"city": @"San Francisco", @"state": @"PK", @"postcode": @"94103", @"country": @"US", @"email": @"john.doe@example.com", @"phone": @"(090) 078-6012" },
//                                  @"payment_method": @"paypal",
//                                  @"payment_method_title": @"PayPal"
//                                  ,
//                                  @"meta_data": @[ @{ @"key": @"_billing_lat", @"value": @"36.1415408" }, @{ @"key": @"_billing_lng", @"value": @"-86.80378819999999" } ],
//                                  @"line_items": @[ @{ @"product_id": @380, @"quantity": @1, @"meta_data": @[ @{ @"key": @"Booking Date", @"value": @"July 05, 2017" }, @{ @"key": @"Booking Time", @"value": @"4:30 pm" }, @{ @"key": @"Duration", @"value": @"45 minutes" } ] } ]
//                                  
//                                  };
    
    
    
    //    parameters[@"oauth_version"] = kAFOAuth1Version;
    //    parameters[@"oauth_signature_method"] = NSStringFromAFOAuthSignatureMethod(self.signatureMethod);
    //    parameters[@"oauth_consumer_key"] = self.key;
    //    parameters[@"oauth_timestamp"] = [@(floor([[NSDate date] timeIntervalSince1970])) stringValue];
    //    parameters[@"oauth_nonce"] = AFNounce();

    
//    NSDictionary *headers = @{ @"content-type": @"application/json"};
//
//        NSDictionary *parameters = @{ @"customer_id": @5,
//                                      @"billing": @{ @"first_name": @"akhzar", @"last_name": @"nazir", @"company": @"", @"address_1": @"Yaqoob Chok", @"address_2": @"", @"city": @"Lahore", @"state": @"PK", @"postcode": @"94103", @"country": @"PK", @"email": @"tahir@gmail.com", @"phone": @"(090) 078-6012" },
//                                      @"payment_method": @"paypal",
//                                      @"payment_method_title": @"PayPal",
//                                      @"transaction_id": @"",
//                                      @"cart_hash": @""
//    
//                                      ,@"meta_data": @{ @"key": @"_billing_lat", @"value": @"36.1415408" },
//                                       @"meta_data": @{ @"key": @"_billing_lng", @"value": @"-86.80378819999999" },
//                                      @"line_items": @{ @"product_id": @380, @"quantity": @1,
//    
//                                    @"meta_data": @{ @"key": @"Booking Date", @"value": @"July 05, 2017" },
//                                    @"meta_data": @{ @"key": @"Booking Time", @"value": @"4:30 pm" },
//                                    @"meta_data":@{ @"key": @"Duration", @"value": @"45 minutes" } }
//    
//                                      };
//
//    
//    NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
//    
//    NSString *strTimeStamp = [@(floor([[NSDate date] timeIntervalSince1970])) stringValue];
//    NSString *strNonce = AFNounce();
//    NSString *strOAuth_Signature = @"1zIK4Kl6Wb2U9SXdVKbFIP5DELU=";
//
//    NSString *strURL = [NSString stringWithFormat:@"http://spotless.ae/spotless/wp-json/wc/v2/orders?oauth_consumer_key=ck_ab8ad5a2c6ab56f06d0de7f13b2ff409e022206a&oauth_token=&oauth_signature_method=HMAC-SHA1&oauth_timestamp=%@&oauth_nonce=%@&oauth_version=1.0&oauth_signature=%@",strTimeStamp,strNonce,strOAuth_Signature];
//    
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:strURL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0];
//    
//    [request setHTTPMethod:@"POST"];
//    [request setAllHTTPHeaderFields:headers];
//    [request setHTTPBody:postData];
//    
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
//                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//                                                    if (error) {
//                                                        NSLog(@"%@", error);
//                                                    } else {
//                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
//                                                        NSLog(@"%@", httpResponse);
//                                                    }
//                                                }];
//    [dataTask resume];
//    
    
    
    

}
- (IBAction)address:(id)sender {
    
    AFOAuth1OneLeggedClient *clientPost = [[AFOAuth1OneLeggedClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://spotless.ae/spotless/wp-json/wc/v2/"] key:@"ck_ab8ad5a2c6ab56f06d0de7f13b2ff409e022206a" secret:@"cs_d24bf58e922ba9588c8d686857f3f438916930d0"];
    
    // Old
    //    ck_ab8ad5a2c6ab56f06d0de7f13b2ff409e022206a
    //    cs_d24bf58e922ba9588c8d686857f3f438916930d0
    
    // New
    //    ck_3bbea6218fe63020630ae80ffbb15054701fa1ea
    //    cs_8ae0f83da9a247606da03d634867ccdce8c03dd3

    // Most Latest
    //    ck_3bc54adffbcf532d061a4ce8a1d0bbdf51c766ac
    //    cs_7e8946908ccfc5fd3b45ffba2a2c8d9918d9440b

    NSDictionary *parameters = @{ @"billing": @{ @"first_name": @"Muhammad", @"last_name": @"Usman", @"company": @"My First Company", @"address_1": @"address 1", @"address_2": @"address 2", @"city": @"Hasiplur", @"state": @"PK", @"postcode": @"1234567", @"country": @"PK", @"email": @"usman_lucky555@yahoo.com", @"phone": @"090078601" },
                                  @"shipping": @{ @"first_name": @"Shakeel", @"last_name": @"Aslam", @"company": @"Company", @"address_1": @"Address 1", @"address_2": @"Address 2", @"city": @"Hasiplur", @"state": @"PK", @"postcode": @"63000", @"country": @"PK" } };
    
    [clientPost postPath:@"customers/5" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *arr = responseObject;
    NSLog(@"POST Registration Response is = %@",arr);
        
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Working" message:[NSString stringWithFormat:@"%@",responseObject] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//    [alert show];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Response is = %@",error);
    }];
    
}

- (IBAction)orderApi:(id)sender {
    
    
    // Old
//    ck_ab8ad5a2c6ab56f06d0de7f13b2ff409e022206a
//    cs_d24bf58e922ba9588c8d686857f3f438916930d0
    
    // New
//    ck_3bbea6218fe63020630ae80ffbb15054701fa1ea
//    cs_8ae0f83da9a247606da03d634867ccdce8c03dd3
    
    // Most Latest
//    ck_3bc54adffbcf532d061a4ce8a1d0bbdf51c766ac
//    cs_7e8946908ccfc5fd3b45ffba2a2c8d9918d9440b

    
    //line_items
    
//    NSDictionary *dictmeta_data1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Booking Date",@"key",@"July 05, 2017",@"value", nil];
//    NSDictionary *dictmeta_data2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Booking Time",@"key",@"4:30 pm",@"value", nil];
//    NSDictionary *dictmeta_data3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Duration",@"key",@"45 minutes",@"value", nil];
//
//    NSArray *arrayLine_items = [[NSArray alloc] initWithObjects:dictmeta_data1,dictmeta_data2,dictmeta_data3, nil];
//    
//    
//    //{ "name": "Ultra Premium Quality", "type": "simple", "regular_price": "2199"}
//
//    
//    NSDictionary *FinalDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"380",@"product_id",@"1",@"quantity",arrayLine_items,@"meta_data", nil];
//
//    
//    
//    
//    id stri = @[@{@"product_id":@"380",@"product_name":@"Woo Album",@"quantity":@"1",@"total":@"19.99"}];
//    
//    
//    
//    NSDictionary *dictLineitem1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"380",@"product_id",@"1",@"quantity", nil];
// //   NSDictionary *dictLineitem2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"712",@"product_id",@"1",@"quantity", nil];
//    NSArray *lineitemsFinal = [[NSArray alloc] initWithObjects:dictLineitem1, nil];
//
//    NSDictionary *shipping_lines = [[NSDictionary alloc] initWithObjectsAndKeys:@"712",@"method_id",@"1",@"method_title",@"2",@"total", nil];
//    NSArray *shipping_linesArray = [[NSArray alloc] initWithObjects:shipping_lines, nil];
//    
//    
//    NSDictionary *meta_data1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"_billing_lat",@"key",@"36.1415408",@"value", nil];
//    NSDictionary *meta_data2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"_billing_lng",@"key",@"86.80378819999999",@"value", nil];
//    NSArray *meta_datArray = [[NSArray alloc] initWithObjects:meta_data1,meta_data2, nil];
//    
//
//    
//    
//    NSError * err;
//    NSData * jsonData = [NSJSONSerialization  dataWithJSONObject:@[ @{ @"product_id": @380, @"quantity": @1, @"meta_data": @[ @{ @"key": @"Booking Date", @"value": @"July 05, 2017" }, @{ @"key": @"Booking Time", @"value": @"4:30 pm" }, @{ @"key": @"Duration", @"value": @"45 minutes" } ] } ]  options:0 error:&err];
//    id myString = [[NSString alloc] initWithData:jsonData   encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",myString);
//    
//    
////    NSData * jsonData1 = [NSJSONSerialization  dataWithJSONObject:@[ @{ @"product_id": @380, @"quantity": @1} ]  options:0 error:&err];
////    NSString * myString1 = [[NSString alloc] initWithData:jsonData1   encoding:NSUTF8StringEncoding];
////    NSLog(@"%@",myString1);
////    
//    
// 
//    
// //   NSArray* latestLoans = [json objectForKey:@"line_items"];
    
    
    
//    NSDictionary *parameters = @{ @"customer_id": @5,
//                                  @"billing": @{ @"first_name": @"akhzar", @"last_name": @"nazir", @"company": @"", @"address_1": @"Yaqoob Chok", @"address_2": @"", @"city": @"Lahore", @"state": @"PK", @"postcode": @"94103", @"country": @"PK", @"email": @"tahir@gmail.com", @"phone": @"(090) 078-6012" },
//                                  @"payment_method": @"paypal",
//                                  @"payment_method_title": @"PayPal",
//                                  @"transaction_id": @"",
//                                  @"cart_hash": @""
//                                  
//                                  ,@"meta_data": @[ @{ @"key": @"_billing_lat", @"value": @"36.1415408" }, @{ @"key": @"_billing_lng", @"value": @"-86.80378819999999" } ],
//                                  @"line_items": @[ @{ @"product_id": @380, @"quantity": @1, @"meta_data": @[ @{ @"key": @"Booking Date", @"value": @"July 05, 2017" }, @{ @"key": @"Booking Time", @"value": @"4:30 pm" }, @{ @"key": @"Duration", @"value": @"45 minutes" } ] } ]
//                                  
//                                  };
    
    
    
    
    
//    NSDictionary *parameters = @{ @"customer_id": @5,
//                                  @"billing": @{ @"first_name": @"akhzar", @"last_name": @"nazir", @"company": @"", @"address_1": @"Yaqoob Chok", @"address_2": @"", @"city": @"Lahore", @"state": @"PK", @"postcode": @"94103", @"country": @"PK", @"email": @"tahir@gmail.com", @"phone": @"(090) 078-6012" },
//                                  @"payment_method": @"paypal",
//                                  @"payment_method_title": @"PayPal",
//                                  @"transaction_id": @"",
//                                  @"cart_hash": @""
//                                  
//                                  ,@"meta_data": @{ @"key": @"_billing_lat", @"value": @"36.1415408" },
//                                   @"meta_data": @{ @"key": @"_billing_lng", @"value": @"-86.80378819999999" },
//                                  @"line_items": @{ @"product_id": @380, @"quantity": @1,
//                                
//                                @"meta_data": @{ @"key": @"Booking Date", @"value": @"July 05, 2017" },
//                                @"meta_data": @{ @"key": @"Booking Time", @"value": @"4:30 pm" },
//                                @"meta_data":@{ @"key": @"Duration", @"value": @"45 minutes" } }
//                                  
//                                  };

    
    
    
//    AFOAuth1OneLeggedClient *clientPost = [[AFOAuth1OneLeggedClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.rahatayaz.me/spotless/wp-json/wc/v2/"] key:@"ck_ab8ad5a2c6ab56f06d0de7f13b2ff409e022206a" secret:@"cs_d24bf58e922ba9588c8d686857f3f438916930d0"];
//    
//    NSDictionary *parameters = @{ @"customer_id": @5,
//                                  @"billing": @{ @"first_name": @"John", @"last_name": @"Doe", @"company": @"", @"address_1": @"969 Market", @"address_2": @"", @"city": @"San Francisco", @"state": @"PK", @"postcode": @"94103", @"country": @"US", @"email": @"john.doe@example.com", @"phone": @"(090) 078-6012" },
//                                  @"payment_method": @"paypal",
//                                  @"payment_method_title": @"PayPal"
//                                  ,
//                                  @"meta_data": @[ @{ @"key": @"_billing_lat", @"value": @"36.1415408" }, @{ @"key": @"_billing_lng", @"value": @"-86.80378819999999" } ],
//                                  @"line_items": @[ @{ @"product_id": @380, @"quantity": @1, @"meta_data": @[ @{ @"key": @"Booking Date", @"value": @"July 05, 2017" }, @{ @"key": @"Booking Time", @"value": @"4:30 pm" }, @{ @"key": @"Duration", @"value": @"45 minutes" } ] } ]
//                                  
//                                  };
//    
//    [clientPost postPath:@"orders" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"POST Registration Response is = %@",responseObject);
//        self.txt.text = [NSString stringWithFormat:@"%@",responseObject];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Response is = %@",error);
//        self.txt.text = [NSString stringWithFormat:@"%@",error];
//    }];
    
    
    
    
//    http://www.rahatayaz.me/spotless/wp-json/wc/v2/
    
    
    
//    AFOAuth1OneLeggedClient *clientPost = [[AFOAuth1OneLeggedClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.rahatayaz.me/spotless/wp-json/wc/v2/"] key:@"ck_ab8ad5a2c6ab56f06d0de7f13b2ff409e022206a" secret:@"cs_d24bf58e922ba9588c8d686857f3f438916930d0"];
//    
//    NSDictionary *parameters = @{ @"username": @"administrator",
//                                  @"email": @"kharbooza@yahoo.com",
//                                  @"password": @"",
//                                  @"first_name": @"Imran Bhai Jaali Darhi",
//                                  @"last_name":@"Bistee Prooof Hai yaar"
//                                  };
//    
//    [clientPost putPath:@"customers/5" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"POST Registration Response is = %@",responseObject);
//        self.txt.text = [NSString stringWithFormat:@"%@",responseObject];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Response is = %@",error);
//        self.txt.text = [NSString stringWithFormat:@"%@",error];
//    }];

    
    
    
    
//    AFOAuth1OneLeggedClient *clientPost = [[AFOAuth1OneLeggedClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.rahatayaz.me/spotless/wp-json/wc/v2/"] key:@"ck_ab8ad5a2c6ab56f06d0de7f13b2ff409e022206a" secret:@"cs_d24bf58e922ba9588c8d686857f3f438916930d0"];
//    
//    [clientPost getPath:@"customers/5" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//    NSLog(@"POST Registration Response is = %@",responseObject);
//    self.txt.text = [NSString stringWithFormat:@"%@",responseObject];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//    NSLog(@"Response is = %@",error);
//    self.txt.text = [NSString stringWithFormat:@"%@",error];
//    }];
    
    
    
    AFOAuth1OneLeggedClient *clientPost = [[AFOAuth1OneLeggedClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.rahatayaz.me/spotless/wp-json/wc/v2/"] key:@"ck_ab8ad5a2c6ab56f06d0de7f13b2ff409e022206a" secret:@"cs_d24bf58e922ba9588c8d686857f3f438916930d0"];
    
    NSDictionary *parameters = @{ @"customer_id": @"5"};

    [clientPost getPath:@"orders" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"POST Registration Response is = %@",responseObject);
        self.txt.text = [NSString stringWithFormat:@"%@",responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Response is = %@",error);
        self.txt.text = [NSString stringWithFormat:@"%@",error];
    }];

    
    
    
}

//[{"key":"Tahir","value":"1"},{"key":"hameed","value":"2"}]

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
