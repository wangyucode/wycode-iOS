//
// Created by wangyu on 16/2/22.
// Copyright (c) 2016 wangyu. All rights reserved.
//

#import "EasyHttp.h"
#import "AFNetworking.h"
#import "JSONModel.h"
#import "WyResult.h"


@implementation EasyHttp {


}

+ (void)doGet:(NSString *)url params:(NSMutableDictionary *)params successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSMutableURLRequest *urlRequest = [[AFHTTPRequestSerializer serializer]
            requestWithMethod:@"GET"
                    URLString:[SERVER_URL stringByAppendingString:url]
                   parameters:params
                        error:nil
    ];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:urlRequest
                                                completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"Error: %@", error);
                                                    } else {
                                                        NSLog(@"%@ %@", response, responseObject);
                                                        WyResult *result = [[WyResult alloc] initWithDictionary:responseObject error:nil];
                                                        if (result && result.code) {
                                                            successBlock(result);
                                                        } else if (result) {
                                                            failureBlock(result.message, result.code);
                                                        } else {
                                                            failureBlock(error.description, (int)error.code);
                                                        }
                                                    }
                                                }];
    [dataTask resume];
}

+ (void)doPost:(NSString *)url params:(NSMutableDictionary *)params successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSMutableURLRequest *urlRequest = [[AFHTTPRequestSerializer serializer]
            requestWithMethod:@"POST"
                    URLString:[SERVER_URL stringByAppendingString:url]
                   parameters:params
                        error:nil
    ];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:urlRequest
                                                completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"Error: %@", error);
                                                    } else {
                                                        NSLog(@"%@ %@", response, responseObject);
                                                        WyResult *result = [[WyResult alloc] initWithDictionary:responseObject error:nil];
                                                        if (result && result.code) {
                                                            successBlock(result);
                                                        } else if (result) {
                                                            failureBlock(result.message, result.code);
                                                        } else {
                                                            failureBlock(error.description, (int)error.code);
                                                        }
                                                    }
                                                }];
    [dataTask resume];

}

@end