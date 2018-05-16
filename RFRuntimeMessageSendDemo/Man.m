//
//  Man.m
//  RFRuntimeMessageSendDemo
//
//  Created by riceFun on 2018/5/16.
//  Copyright © 2018年 riceFun. All rights reserved.
//

#import "Man.h"
#import "Woman.h"

@implementation Man

//将消息转给其他target 对象处理
-(id)forwardingTargetForSelector:(SEL)aSelector{
    if ([@"washClothes" isEqualToString:NSStringFromSelector(aSelector)]) {
        NSLog(@"Wash clothes? never!");
        return [[Woman alloc]init]; //返回处理该选择子的实例
    }
    return nil;//如果返回nil  将会进入消息转发步骤
}

@end
