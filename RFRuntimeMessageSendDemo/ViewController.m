//
//  ViewController.m
//  RFRuntimeMessageSendDemo
//
//  Created by riceFun on 2018/5/16.
//  Copyright © 2018年 riceFun. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Man.h"
#import "Woman.h"
#import "Kids.h"

/* https://www.jianshu.com/p/1bde36ad9938  学习地址 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.动态添加方法
    [self resolveInstanceMethodTest];
    //2.将方法转给其他类处理
    [self forwardingTargetForSelectorTest];
//    //3.消息转发
    [self forwardingMessageTest];
    
    //以上3步全部走完都没有处理某个消息 那么将会抛出异常
}
//1.动态添加方法
-(void)resolveInstanceMethodTest{
    [[[Person alloc]init] performSelector:@selector(eatFood)];
}

//2.将方法转给其他类处理
-(void)forwardingTargetForSelectorTest{
    [[[Man alloc]init] washClothes];
//    [[[Man alloc]init] performSelector:@selector(washClothes)];
}

//3.消息转发
-(void)forwardingMessageTest{
    [[[Kids alloc] init] playGame];

    NSString *message = [[[Kids alloc] init] buyWater];
    NSLog(@"%@",message);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
