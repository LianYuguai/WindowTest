//
//  YLAlertView.m
//  WindowTest
//
//  Created by 彭玉龙(外包) on 16/6/3.
//  Copyright © 2016年 彭玉龙(外包). All rights reserved.
//

#import "YLAlertView.h"


@interface YLAlertView (){
    UIButton *_cancelBtn;
    UIButton *_certainBtn;
    UILabel *_titleLabel;
    UILabel *_textLabel;
    CancelBlock _cancelBlock;
    CertainBlock _certainBlock;
}

@end
@implementation YLAlertView

- (instancetype)initWithType:(AlertType)alertType withCancelBlock:(CancelBlock)cancelBlock withCertainBlock:(CertainBlock)certainBlock{
    self = [super init];
    self.clipsToBounds = YES;
    if (self) {
        _certainBlock = certainBlock;
        _cancelBlock = cancelBlock;
        switch (alertType) {
            case AlertView:{
                _titleLabel = [[UILabel alloc] init];
                _titleLabel.text = @"提示";
                _titleLabel.font = [UIFont systemFontOfSize:24];
                [self addSubview:_titleLabel];
                [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.width.equalTo(self.mas_width);
                    make.height.mas_equalTo(20);
                    make.left.mas_equalTo(10);
                    make.top.mas_equalTo(10);
                }];
                
                _textLabel = [[UILabel alloc] init];
                _textLabel.text = @"提示内容";
                _textLabel.font = [UIFont systemFontOfSize:20];
                _textLabel.textColor = [UIColor grayColor];
                [self addSubview:_textLabel];
                [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.width.equalTo(self.mas_width);
                    make.height.mas_equalTo(20);
                    make.left.mas_equalTo(10);
                    make.top.mas_equalTo(40);
                }];
                
                _cancelBtn = [[UIButton alloc] init];
                [self addSubview:_cancelBtn];
                [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
                [_cancelBtn setTitleColor:[UIColor colorWithRed:0 green:122/255.0 blue:1 alpha:1] forState:UIControlStateNormal];
                _cancelBtn.layer.borderWidth = 1;
                _cancelBtn.layer.borderColor = [[UIColor grayColor] CGColor];
                [_cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
//                _cancelBtn.clipsToBounds = YES;
                [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.width.equalTo(self.mas_width).with.dividedBy(2).with.offset(1.5);
                    make.height.mas_equalTo(41);
                    make.left.mas_equalTo(-1);
                    make.top.equalTo(self.mas_bottom).with.offset(-40);
                }];
                
                
                _certainBtn = [[UIButton alloc] init];
                [self addSubview:_certainBtn];
                _certainBtn.layer.borderWidth = 1;
                _certainBtn.layer.borderColor = [[UIColor grayColor] CGColor];
//                _certainBtn.clipsToBounds = YES;
                [_certainBtn setTitle:@"确定" forState:UIControlStateNormal];
                [_certainBtn setTitleColor:[UIColor colorWithRed:0 green:122/255.0 blue:1 alpha:1] forState:UIControlStateNormal];
                [_certainBtn addTarget:self action:@selector(certainBtnClick) forControlEvents:UIControlEventTouchUpInside];
                [_certainBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.width.equalTo(self.mas_width).with.dividedBy(2).with.offset(1.5);
                    make.height.mas_equalTo(41);
                    make.right.equalTo(self.mas_right).with.offset(1);
                    make.top.equalTo(self.mas_bottom).with.offset(-40);
                }];
                
            }
                break;
            case CustomAlertView:{
                
            }
                break;
                
            default:
                break;
        }

    }
    return self;
}
- (void)cancelBtnClick{
    _cancelBlock();
}
- (void)certainBtnClick{
    _certainBlock();
}
@end
