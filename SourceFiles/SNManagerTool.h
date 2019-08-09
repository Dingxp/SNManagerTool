//
//  SNManagerTool.h
//  SNMODPCommonComponent
//
//  Created by 丁旭朋 on 2019/7/24.
//  Copyright © 2019 SNMODP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface SNManagerTool : NSObject

/**
 手机号验证

 */
+(BOOL)isMobileNumber:(NSString *)mobileNum;

/**
 银行卡号验证

 */
+ (BOOL)IsBankCard:(NSString *)cardNumber;

/**
 邮箱验证

 */
+ (BOOL)IsEmailAdress:(NSString *)Email;

/**
 身份证验证
 
 */
+ (BOOL)IsIdentityCard:(NSString *)IDCardNumber;

/**
 纯数字验证

 */
+ (BOOL)isNum:(NSString *)checkedNumString;


/**
 将日期时间转化为字符串

 */
+ (NSString *)dateTimeForDateFormatter:(NSString *)dateFormatter;

/**
 将时间字符串转换为日期
 
 */
+ (NSString *)dateFormatterForDateTime:(NSString *)dateTime andFormatter:(NSString *)format;

/**
 计算字符串的宽度
 
 */
+ (float) widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height;

/**
 计算字符串的高度
 
 */
+ (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize string:(NSString *)string;

/**
 保存文件

 @param cacheData 二进制文件
 @param fileName 文件名字
 @param fileFormat 文件格式
 */
+ (BOOL)writeToCachePath:(id)cacheData fileName:(NSString*)fileName fileFormat:(NSString *)fileFormat;

@end

NS_ASSUME_NONNULL_END
