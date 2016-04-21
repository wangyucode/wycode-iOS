//
// Created by wangyu on 16/2/22.
// Copyright (c) 2016 wangyu. All rights reserved.
//

#import "WyResult.h"


@implementation WyResult {

}
@end

@implementation MoviePage {

}
@end

@implementation Movie {


}

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
            @"description" : @"desc"
    }];
}

@end

@implementation MusicPage {

}
@end

@implementation Music {

}
@end

@implementation MessagePage {

}
@end

@implementation BoardMessage {

}
@end