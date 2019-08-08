//
//  NSString+CateGory.m
//  SNMODPCommonComponent
//
//  Created by 丁旭朋 on 2019/7/29.
//  Copyright © 2019 SNMODP. All rights reserved.
//

#import "NSString+CateGory.h"

@implementation NSString (CateGory)
//加
- (NSString *)snCalculateByAdding:(NSString *)stringNumer
{
    if ([stringNumer length] == 0||stringNumer == nil) {
        stringNumer = @"0";
    }
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:stringNumer];
    NSDecimalNumber *addingNum = [num1 decimalNumberByAdding:num2];
    return [addingNum stringValue];
}

//减
- (NSString *)snCalculateBySubtracting:(NSString *)stringNumer
{
    if ([stringNumer length] == 0||stringNumer == nil) {
        stringNumer = @"0";
    }
    
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:stringNumer];
    NSDecimalNumber *subtractingNum = [num1 decimalNumberBySubtracting:num2];
    return [subtractingNum stringValue];
}

//乘
- (NSString *)snCalculateByMultiplying:(NSString *)stringNumer
{
    if ([stringNumer length] == 0||stringNumer == nil) {
        stringNumer = @"0";
    }
    
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:stringNumer];
    NSDecimalNumber *multiplyingNum = [num1 decimalNumberByMultiplyingBy:num2];
    return [multiplyingNum stringValue];
}

//除
- (NSString *)snCalculateByDividing:(NSString *)stringNumer
{
    if ([stringNumer length] == 0||stringNumer == nil) {
        stringNumer = @"0";
    }
    
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:stringNumer];
    NSDecimalNumber *dividingNum = [num1 decimalNumberByDividingBy:num2];
    return [dividingNum stringValue];
    
}

//幂运算
- (NSString *)snCalculateByRaising:(NSUInteger)power
{
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *raisingNum = [num1 decimalNumberByRaisingToPower:power];
    return [raisingNum stringValue];
    
}

//四舍五入
- (NSString *)snCalculateByRounding:(NSUInteger)scale
{
    NSDecimalNumberHandler * handler = [[NSDecimalNumberHandler alloc] initWithRoundingMode:NSRoundPlain scale:scale raiseOnExactness:NO raiseOnOverflow:YES raiseOnUnderflow:YES raiseOnDivideByZero:YES];
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *roundingNum = [num1 decimalNumberByRoundingAccordingToBehavior:handler];
    return [roundingNum stringValue];
}

//是否相等
- (BOOL)snCalculateIsEqual:(NSString *)stringNumer
{
    if ([stringNumer length] == 0||stringNumer == nil) {
        stringNumer = @"0";
    }
    
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:stringNumer];
    NSComparisonResult result = [num1 compare:num2];
    if (result == NSOrderedSame) {
        return YES;
    }
    return NO;
}

//是否大于
- (BOOL)snCalculateIsGreaterThan:(NSString *)stringNumer
{
    if ([stringNumer length] == 0||stringNumer == nil) {
        stringNumer = @"0";
    }
    
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:stringNumer];
    NSComparisonResult result = [num1 compare:num2];
    if (result == NSOrderedDescending) {
        return YES;
    }
    return NO;
    
}

//是否小于
- (BOOL)snCalculateIsLessThan:(NSString *)stringNumer
{
    if ([stringNumer length] == 0||stringNumer == nil) {
        stringNumer = @"0";
    }
    
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:stringNumer];
    NSComparisonResult result = [num1 compare:num2];
    if (result == NSOrderedAscending) {
        return YES;
    }
    return NO;
}

- (double)snCalculateDoubleValue
{
    NSDecimalNumber *num = [NSDecimalNumber decimalNumberWithString:self];
    return [num doubleValue];
}

@end
