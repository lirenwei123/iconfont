//
//  NSMutableArray+ErrorHandel.m
//  outOfBounds
//
//  Created by apple   on 2018/9/20.
//  Copyright © 2018年 钱龙. All rights reserved.
//

#import "NSMutableArray+ErrorHandel.h"
#import "NSObject+SwizzleMethod.h"

@implementation NSMutableArray (ErrorHandel)
+ (void)load{
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [NSMutableArray systemSelector:@selector(insertObject:atIndex:) swizzledSelector:@selector(P_insertObject:atIndex:) error:nil];
        [NSMutableArray systemSelector:@selector(addObject:) swizzledSelector:@selector(P_addObject:) error:nil];
    });
}
-(void)P_insertObject:(id)anObject atIndex:(NSUInteger)index{
    if (anObject && index < self.count) {
        [self P_insertObject:anObject atIndex:index];
    }else{
        NSLog(@"添加对象为nil");
    }
}

-(void)P_addObject:(id)anObject{
    if (anObject) {
        [self P_addObject:anObject];
    }else{
         NSLog(@"添加对象为nil");
    }
}
@end
