//
//  NSObject+SwizzleMethod.h
//  outOfBounds
//
//  Created by apple   on 2018/9/20.
//  Copyright © 2018年 钱龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SwizzleMethod)
+(BOOL)systemSelector:(SEL)systemSelector swizzledSelector:(SEL)swizzledSelector error:(NSError *)error;
@end
