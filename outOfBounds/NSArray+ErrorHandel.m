//
//  NSArray+ErrorHandel.m
//  outOfBounds
//
//  Created by apple   on 2018/9/20.
//  Copyright © 2018年 钱龙. All rights reserved.
//

#import "NSArray+ErrorHandel.h"
#import "NSObject+SwizzleMethod.h"

@implementation NSArray (ErrorHandel)

+ (void)load{
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [NSClassFromString(@"__NSSingleObjectArrayI") systemSelector:@selector(objectAtIndex:) swizzledSelector:@selector(swizzleObjectAtIndex:) error:nil];
        [NSClassFromString(@"__NSSingleObjectArrayI") systemSelector:@selector(objectForKeyedSubscript:) swizzledSelector:@selector(swizzleObjectAtIndexedSubscript:) error:nil];
    });
}


-(id)swizzleObjectAtIndex:(NSUInteger)index{
    if (index <self.count) {
       return  [self swizzleObjectAtIndex:index];
    }else{
        NSLog(@"数组越界");
        return nil;
    }
}

-(id)swizzleObjectAtIndexedSubscript:(NSUInteger)idx{
    if (idx <self.count) {
        return [self swizzleObjectAtIndexedSubscript:idx];
    }else{
        NSLog(@"数组越界");
        return nil;
    }
}

@end
