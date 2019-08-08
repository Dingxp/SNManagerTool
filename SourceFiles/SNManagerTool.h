//
//  SNManagerTool.h
//  SNMODPCommonComponent
//
//  Created by 丁旭朋 on 2019/7/24.
//  Copyright © 2019 SNMODP. All rights reserved.
//

#import <Foundation/Foundation.h>

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
+ (BOOL) IsEmailAdress:(NSString *)Email;

/**
 身份证验证
 
 */
+ (BOOL)IsIdentityCard:(NSString *)IDCardNumber;

/**
 纯数字验证

 */
- (BOOL)isNum:(NSString *)checkedNumString;




@end

NS_ASSUME_NONNULL_END
