//
//  ViewController.m
//  WindowTest
//
//  Created by 彭玉龙(外包) on 16/5/12.
//  Copyright © 2016年 彭玉龙(外包). All rights reserved.
//
#import "ViewController.h"
#import "YLAlertViewController.h"
#import "YLAlertView.h"
static UIWindow *_sheetWindow = nil;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor yellowColor];
   
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden{
    return NO;
}
- (IBAction)pageWindow:(id)sender {
    UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSCREENWIDTH, kSCREENHEIGHT)];
    coverView.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:0.5];
    coverView.tag = 10000 + 1;
    [[UIApplication sharedApplication].keyWindow addSubview:coverView];
    UIWindow *pageWindow = [[UIWindow alloc] initWithFrame:CGRectMake(50, (kSCREENHEIGHT - 200)/2.0, kSCREENWIDTH - 100, 110)];
    pageWindow.layer.cornerRadius = 5;
    pageWindow.windowLevel =UIWindowLevelNormal;
    pageWindow.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.95];
    pageWindow.hidden = NO;
    YLAlertViewController *alertVC = [[YLAlertViewController alloc] init];
    YLAlertView *alertView = [[YLAlertView alloc] initWithType:AlertView withCancelBlock:^{
        [coverView removeFromSuperview];
        _sheetWindow.hidden = YES;
        _sheetWindow = nil;

    } withCertainBlock:^{
        [coverView removeFromSuperview];
        _sheetWindow.hidden = YES;
        _sheetWindow = nil;

    }];
    [alertVC.view addSubview:alertView];
    [alertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(alertVC.view);
        make.height.equalTo(alertVC.view);
        make.left.equalTo(alertVC.view);
        make.top.equalTo(alertVC.view);
    }];
//    alertVC.view.backgroundColor = [UIColor yellowColor];
    pageWindow.rootViewController = alertVC;
    _sheetWindow = pageWindow;
}
- (IBAction)hideView:(id)sender {
    UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSCREENWIDTH, kSCREENHEIGHT)];
    coverView.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:0.5];
    coverView.tag = 10000 + 1;
    [[UIApplication sharedApplication].keyWindow addSubview:coverView];
    UIWindow *pageWindow = [[UIWindow alloc] initWithFrame:CGRectMake(50, (kSCREENHEIGHT - 200)/2.0, kSCREENWIDTH - 100, 200)];
    pageWindow.layer.cornerRadius = 5;
    pageWindow.windowLevel =UIWindowLevelNormal;
    pageWindow.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.95];
    pageWindow.hidden = NO;
    YLAlertViewController *alertVC = [[YLAlertViewController alloc] init];
    YLAlertView *alertView = [[YLAlertView alloc] initWithType:CustomAlertView withCancelBlock:^{
        [coverView removeFromSuperview];
        _sheetWindow.hidden = YES;
        _sheetWindow = nil;
        
    } withCertainBlock:^{
        [coverView removeFromSuperview];
        _sheetWindow.hidden = YES;
        _sheetWindow = nil;        
    }];
    [alertVC.view addSubview:alertView];
    [alertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(alertVC.view);
        make.height.equalTo(alertVC.view);
        make.left.equalTo(alertVC.view);
        make.top.equalTo(alertVC.view);
    }];
    //    alertVC.view.backgroundColor = [UIColor yellowColor];
    pageWindow.rootViewController = alertVC;
    _sheetWindow = pageWindow;

}
@end
