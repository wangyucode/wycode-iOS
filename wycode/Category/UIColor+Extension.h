//
//  UIColor+Extension.h
//  ZiChanBao
//
//  Created by liujinliang on 15/6/11.
//  Copyright (c) 2015年 WorldUnion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

#pragma mark - 计算色值
/**
 *  传入十六进制值，以0x开头
 */
+ (instancetype)hexValue:(NSInteger)hexValue;

/**
*  传入十六进制值，以0x开头
*  alpha 0-1
*/
+ (instancetype)hexValue:(NSInteger)hexValue alpha:(CGFloat)alpha;

/**
 *  传入十进制的红绿蓝三色值
 */
+ (instancetype)red:(int)red green:(int)green blue:(int)blue;


@end
