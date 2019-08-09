//
//  NSString+CateGory.h
//  SNMODPCommonComponent
//
//  Created by 丁旭朋 on 2019/7/29.
//  Copyright © 2019 SNMODP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (CateGory)
//加
- (NSString *)snCalculateByAdding:(NSString *)stringNumer;
//减
- (NSString *)snCalculateBySubtracting:(NSString *)stringNumer;
//乘
- (NSString *)snCalculateByMultiplying:(NSString *)stringNumer;
//除
- (NSString *)snCalculateByDividing:(NSString *)stringNumer;
//幂运算
- (NSString *)snCalculateByRaising:(NSUInteger)power;
//四舍五入
- (NSString *)snCalculateByRounding:(NSUInteger)scale;
//是否相等
- (BOOL)snCalculateIsEqual:(NSString *)stringNumer;
//是否大于
- (BOOL)snCalculateIsGreaterThan:(NSString *)stringNumer;
//是否小于
- (BOOL)snCalculateIsLessThan:(NSString *)stringNumer;
//转成小数
- (double)snCalculateDoubleValue;

/**
 *  在文本中间添加横划线
 
 */
- (NSMutableAttributedString *)addTextCenterLine;

@end

NS_ASSUME_NONNULL_END
