//
//  NSObject+Swizzling.h
//  SNMODPCommonComponent
//
//  Created by 丁旭朋 on 2019/7/30.
//  Copyright © 2019 SNMODP. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Swizzling)

+ (void)swizzleSelector:(SEL)originalSelector withSwizzledSelector:(SEL)swizzledSelector;

@end

NS_ASSUME_NONNULL_END
