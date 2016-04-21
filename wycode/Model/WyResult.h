//
// Created by wangyu on 16/2/22.
// Copyright (c) 2016 wangyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol Movie;
@protocol Music;
@protocol BoardMessage;


@interface WyResult : JSONModel
@property(nonatomic, assign) int code; //(integer, optional): code: 返回代码，1表示OK，其它的都有对应问题,
@property(nonatomic, strong) NSString <Optional> *message; // (string, optional): message : code!=1时的错误信息,
@property(nonatomic) id <Optional> data; // (Page«AppTestEntity», optional): data : code为1时返回结果集
@end

@interface MoviePage : JSONModel

@property(nonatomic, assign) int totalPages; //(integer, optional),
@property(nonatomic, assign) int totalElements; //(integer, optional),
//sort (Sort, optional),
@property(nonatomic, assign) BOOL last; //(boolean, optional),
@property(nonatomic, assign) BOOL first; //(boolean, optional),
@property(nonatomic, assign) int numberOfElements; //(integer, optional),
@property(nonatomic, assign) int size; //(integer, optional),
@property(nonatomic, strong) NSArray <Movie, ConvertOnDemand> *content; //(array[AppTestEntity], optional),
@property(nonatomic, assign) int number; //(integer, optional)

@end


@protocol Movie <NSObject>

@end

@interface Movie : JSONModel
@property(nonatomic, assign) long id; //(integer, optional): 电影id,
@property(nonatomic, strong) NSString <Optional> *name; //(string, optional): 电影名,
@property(nonatomic, strong) NSString <Optional> *desc; //(string, optional): 电影简介,
@property(nonatomic, assign) float rating; //(number, optional): 电影评分,
@property(nonatomic, strong) NSString <Optional> *image; // (string, optional): 电影主图,
@property(nonatomic, assign) int year; // (integer, optional): 电影年代
@property(nonatomic, strong) NSString <Optional> *actors; //(string, optional): 主演
@end



@interface MusicPage : JSONModel

@property(nonatomic, assign) int totalPages; //(integer, optional),
@property(nonatomic, assign) int totalElements; //(integer, optional),
//sort (Sort, optional),
@property(nonatomic, assign) BOOL last; //(boolean, optional),
@property(nonatomic, assign) BOOL first; //(boolean, optional),
@property(nonatomic, assign) int numberOfElements; //(integer, optional),
@property(nonatomic, assign) int size; //(integer, optional),
@property(nonatomic, strong) NSArray <Music, ConvertOnDemand> *content; //(array[AppTestEntity], optional),
@property(nonatomic, assign) int number; //(integer, optional)

@end


@protocol Music <NSObject>

@end

@interface Music : JSONModel
@property(nonatomic, assign) long id; // (integer, optional): 音乐id,
@property(nonatomic, strong) NSString <Optional> *name; // (string, optional): 歌曲名,
@property(nonatomic, strong) NSString <Optional> *artist; // (string, optional): 艺术家,
@property(nonatomic, strong) NSString <Optional> *album; // (string, optional): 专辑,
@property(nonatomic, strong) NSString <Optional> *image; // (string, optional): 专辑封面，相对地址,
@property(nonatomic, assign) int year; // (integer, optional): 年代，2007,
@property(nonatomic, strong) NSString <Optional> *url; // (string, optional): 播放链接
@end



@interface MessagePage : JSONModel

@property(nonatomic, assign) int totalPages; //(integer, optional),
@property(nonatomic, assign) int totalElements; //(integer, optional),
//sort (Sort, optional),
@property(nonatomic, assign) BOOL last; //(boolean, optional),
@property(nonatomic, assign) BOOL first; //(boolean, optional),
@property(nonatomic, assign) int numberOfElements; //(integer, optional),
@property(nonatomic, assign) int size; //(integer, optional),
@property(nonatomic, strong) NSArray <BoardMessage, ConvertOnDemand> *content; //(array[AppTestEntity], optional),
@property(nonatomic, assign) int number; //(integer, optional)

@end


@protocol BoardMessage <NSObject>

@end

@interface BoardMessage : JSONModel
@property(nonatomic, strong) NSString <Optional> *content; // (string, optional): 内容 ,
@property(nonatomic, assign) long id;// (integer, optional): id ,
@property(nonatomic, strong) NSString <Optional> *mobile; // (string, optional): 手机号 ,
@property(nonatomic, strong) NSString <Optional> *name; // (string, optional): 发表人 ,
@property(nonatomic, strong) NSString <Optional> *time; // (string, optional): 发表时间，yyyy-MM-dd HH:mm:ss
@end