//
//  UIColor+Extension.m
//  ZiChanBao
//
//  Created by liujinliang on 15/6/11.
//  Copyright (c) 2015年 WorldUnion. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

#pragma mark - 计算色值
/**
 *  传入十六进制值，以0x开头
 */
+ (instancetype)hexValue:(NSInteger)hexValue
{
    return [UIColor hexValue:hexValue alpha:1.0];
}

+ (instancetype)hexValue:(NSInteger)hexValue alpha:(CGFloat)alpha {
    return  [UIColor colorWithRed:(((hexValue) & 0xFF0000) >> 16) / 255.0 green:(((hexValue) & 0xFF00) >> 8) / 255.0 blue:(((hexValue) & 0xFF)) / 255.0 alpha:alpha];;
}

/**
 *  传入十进制的红绿蓝三色值
 */
+ (instancetype)red:(int)red green:(int)green blue:(int)blue
{
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}


@end
