//
//  AlertWindow.m
//  WindowTest
//
//  Created by 彭玉龙(外包) on 16/6/3.
//  Copyright © 2016年 彭玉龙(外包). All rights reserved.
//

#import "AlertWindow.h"

@implementation AlertWindow

+ (instancetype)shareWindow{
    static AlertWindow *alertWindow;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alertWindow = [[self alloc] init];
    });
    return alertWindow;
}

@end
