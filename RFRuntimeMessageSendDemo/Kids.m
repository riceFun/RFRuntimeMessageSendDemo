//
//  Kids.m
//  RFRuntimeMessageSendDemo
//
//  Created by riceFun on 2018/5/16.
//  Copyright © 2018年 riceFun. All rights reserved.
//

#import "Kids.h"
#import "Teacher.h"

@implementation Kids

//方法签名  methodSignatureForSelector用来生成方法签名，这个签名就是给forwardInvocation中的参数NSInvocation调用的。
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    if ([@"playGame" isEqualToString:NSStringFromSelector(aSelector)]) {
        NSMethodSignature *signa = [Kids instanceMethodSignatureForSelector:@selector(watchCartoon)];
        return signa;
    }
    
    if ([@"buyWater" isEqualToString:NSStringFromSelector(aSelector)]) {
        NSMethodSignature *signa = [Teacher instanceMethodSignatureForSelector:@selector(teacherBuyWater:)];
        return signa;
    }
    return [super methodSignatureForSelector:aSelector];//如果这里返回nil 将直接报错 不再进入下一步
}

//当存在NSMethodSignature 才会进入这一步
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    //本类
    if ([@"playGame" isEqualToString:NSStringFromSelector(anInvocation.selector)]) {
        anInvocation.selector = @selector(watchCartoon);//@selector的名字 要和要和方法签名保持一致
        [anInvocation setTarget:self];//target 要和方法签名保持一致 可以是自身self  也可以是其他类
        [anInvocation invoke];
    }
    //其他对象 且有返回值
    if ([@"buyWater" isEqualToString:NSStringFromSelector(anInvocation.selector)]) {
        anInvocation.selector = @selector(teacherBuyWater:);//@selector的名字 要和要和方法签名保持一致
        int price = 5;//参数
        [anInvocation setArgument:&price atIndex:2];// self 0, _cmd 1, Arg1 2
        [anInvocation invokeWithTarget:[Teacher new]];
    }
   
}

-(void)watchCartoon{
    NSLog(@"children like wachting cartoon");
}
@end
