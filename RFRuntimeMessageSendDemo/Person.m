//
//  Person.m
//  RFRuntimeMessageSendDemo
//
//  Created by riceFun on 2018/5/16.
//  Copyright © 2018年 riceFun. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person
/*动态添加方法*/
void dynamicMethodIMP(id self, SEL _cmd) {
    NSLog(@"动态添加该方法");
}
//处理实例方法
+ (BOOL)resolveInstanceMethod:(SEL)aSEL{
    if (aSEL == @selector(eatFood)) {
        //动态添加方法
        class_addMethod([self class], aSEL, (IMP) dynamicMethodIMP, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:aSEL];//返回NO  就会进入消息转发阶段
}

/*
 v@:表示每一个方法会默认隐藏两个参数，self、_cmd，self代表方法调用者(index:0)，_cmd代表这个方法的SEL(index:1)，签名类型就是用来描述这个方法的返回值、参数的，v代表返回值为void，@表示self，:表示_cmd。
 */
//处理类方法
+(BOOL)resolveClassMethod:(SEL)sel{
    NSLog(@"类方法，这里就不写， 和实例方法相似");
    return NO;
}



@end
