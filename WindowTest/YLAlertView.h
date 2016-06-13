//
//  YLAlertView.h
//  WindowTest
//
//  Created by 彭玉龙(外包) on 16/6/3.
//  Copyright © 2016年 彭玉龙(外包). All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    AlertView,
    CustomAlertView
}AlertType;
typedef void(^CancelBlock)(void);
typedef void(^CertainBlock)(void);
@interface YLAlertView : UIView
- (instancetype)initWithType:(AlertType)alertType withCancelBlock:(CancelBlock)cancelBlock withCertainBlock:(CertainBlock)certainBlock;
@end
