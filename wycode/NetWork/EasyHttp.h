//
// Created by wangyu on 16/2/22.
// Copyright (c) 2016 wangyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WyResult;


#define SERVER_URL   @"http://wycode.cn"
#define SERVER_SECRET   @"wycode.cn"


@interface EasyHttp : NSObject

#if NS_BLOCKS_AVAILABLE
typedef void(^RequestCompletedBlock)(NSURLResponse *response, id responseObject, NSError *error);
#endif

#if NS_BLOCKS_AVAILABLE
typedef void(^SuccessBlock)(WyResult *result);
#endif

#if NS_BLOCKS_AVAILABLE
typedef void(^FailureBlock)(NSString *message,int code);
#endif

+(void)doGet:(NSString *) url params:(NSMutableDictionary *) params successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

+(void)doPost:(NSString *) url params:(NSMutableDictionary *) params successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;
@end