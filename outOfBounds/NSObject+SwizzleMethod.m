//
//  NSObject+SwizzleMethod.m
//  outOfBounds
//
//  Created by apple   on 2018/9/20.
//  Copyright © 2018年 钱龙. All rights reserved.
//

#import "NSObject+SwizzleMethod.h"
#import <objc/runtime.h>

@implementation NSObject (SwizzleMethod)
+(BOOL)systemSelector:(SEL)systemSelector swizzledSelector:(SEL)swizzledSelector error:(NSError *)error{
    Method systemMethod = class_getInstanceMethod(self, systemSelector);
    if (!systemMethod) {
        return NO;
    }
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
    if (!swizzledMethod) {
        return NO;
    }

    method_exchangeImplementations(systemMethod, swizzledMethod);
    
    return YES;
}
@end
