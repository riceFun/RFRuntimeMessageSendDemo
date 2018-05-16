//
//  Teacher.m
//  RFRuntimeMessageSendDemo
//
//  Created by riceFun on 2018/5/16.
//  Copyright © 2018年 riceFun. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher
-(NSString *)teacherBuyWater:(int)price{
    return [NSString stringWithFormat:@"Teacher use %d ¥, buy a bottle of wahaha",price];
}
@end
