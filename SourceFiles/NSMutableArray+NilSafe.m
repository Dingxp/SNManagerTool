//
//  NSMutableArray+NilSafe.m
//  SNMODPCommonComponent
//
//  Created by 丁旭朋 on 2019/7/30.
//  Copyright © 2019 SNMODP. All rights reserved.
//

#import "NSMutableArray+NilSafe.h"
#import <objc/runtime.h>
#import "NSObject+Swizzling.h"
@implementation NSMutableArray (NilSafe)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //1、提示移除的数据不能为空
        [self swizzleSelector:@selector(removeObject:)
         withSwizzledSelector:@selector(hdf_safeRemoveObject:)];
        
        //2、提示数组不能添加为nil的数据
        [objc_getClass("__NSArrayM") swizzleSelector:@selector(addObject:)
                                withSwizzledSelector:@selector(hdf_safeAddObject:)];
        //3、移除数据越界
        [objc_getClass("__NSArrayM") swizzleSelector:@selector(removeObjectAtIndex:)
                                withSwizzledSelector:@selector(hdf_safeRemoveObjectAtIndex:)];
        //4、插入数据越界
        [objc_getClass("__NSArrayM") swizzleSelector:@selector(insertObject:atIndex:)
                                withSwizzledSelector:@selector(hdf_insertObject:atIndex:)];
        
        //5、处理[arr objectAtIndex:1000]这样的越界
        [objc_getClass("__NSArrayM") swizzleSelector:@selector(objectAtIndex:) withSwizzledSelector:@selector(hdf_objectAtIndex:)];
        
        //6、处理arr[1000]这样的越界
        [objc_getClass("__NSArrayM") swizzleSelector:@selector(objectAtIndexedSubscript:) withSwizzledSelector:@selector(safeobjectAtIndexedSubscript:)];
        
        //7、替换某个数据越界
        [objc_getClass("__NSArrayM") swizzleSelector:@selector(replaceObjectAtIndex:withObject:) withSwizzledSelector:@selector(safereplaceObjectAtIndex:withObject:)];
        
    });
}

- (instancetype)hdf_initWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt {
    BOOL hasNilObject = NO;
    for (NSUInteger i = 0; i < cnt; i++) {
        if ([objects[i] isKindOfClass:[NSArray class]]) {
        }
        if (objects[i] == nil) {
            hasNilObject = YES;
        }
    }
    
    // 因为有值为nil的元素，那么我们可以过滤掉值为nil的元素
    if (hasNilObject) {
        id __unsafe_unretained newObjects[cnt];
        
        NSUInteger index = 0;
        for (NSUInteger i = 0; i < cnt; ++i) {
            if (objects[i] != nil) {
                newObjects[index++] = objects[i];
            }
        }
        
        return [self hdf_initWithObjects:newObjects count:index];
    }
    
    return [self hdf_initWithObjects:objects count:cnt];
}


- (void)hdf_safeAddObject:(id)obj {
    if (obj == nil) {
    } else {
        [self hdf_safeAddObject:obj];
    }
}

- (void)hdf_safeRemoveObject:(id)obj {
    if (obj == nil) {
        return;
    }
    
    [self hdf_safeRemoveObject:obj];
}

- (void)hdf_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject == nil) {
    } else if (index > self.count) {
    } else {
        [self hdf_insertObject:anObject atIndex:index];
    }
}

- (id)hdf_objectAtIndex:(NSUInteger)index {
    if (self.count == 0) {
        return nil;
    }
    
    if (index > self.count) {
        return nil;
    }
    
    return [self hdf_objectAtIndex:index];
}

- (void)hdf_safeRemoveObjectAtIndex:(NSUInteger)index {
    if (self.count <= 0) {
        return;
    }
    
    if (index >= self.count) {
        return;
    }
    
    [self hdf_safeRemoveObjectAtIndex:index];
}

// 1、索引越界 2、移除索引越界 3、替换索引越界
- (instancetype)safeobjectAtIndexedSubscript:(NSUInteger)index{
    
    if (index > (self.count - 1)) { // 数组越界
        return nil;
    }else { // 没有越界
        return [self safeobjectAtIndexedSubscript:index];
    }
    
}

- (instancetype)safereplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
    if (index > (self.count - 1)) { // 数组越界
        return nil;
    }else { // 没有越界
        return [self safeobjectAtIndexedSubscript:index];
    }
    
}


@end
