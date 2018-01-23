//
//  TALoginView.m
//  TimeAblum
//
//  Created by 王旭 on 2018/1/23.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TALoginView.h"

@interface TALoginView()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField   *phoneTextField;
@property (nonatomic, strong) UIButton      *getVerifyCodeBtn;
@property (nonatomic, strong) UITextField   *verifyCodeTextField;
@property (nonatomic, strong) UIView        *lineView;
@property (nonatomic, strong) UIButton      *loginBtn;

@end

@implementation TALoginView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self addSubview:self.loginBtn];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.left.equalTo(self).offset(SCALE_DISTANCE(33));
        make.right.equalTo(self).offset(SCALE_DISTANCE(-33));
        make.height.offset(40);
    }];
    
    [self addSubview:self.lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(1);
        make.left.and.right.equalTo(_loginBtn);
        make.bottom.equalTo(_loginBtn.mas_top).offset(-30);
    }];
    
    [self addSubview:self.verifyCodeTextField];
    [_verifyCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_lineView.mas_top).offset(-2);
        make.height.offset(35);
        make.left.and.right.equalTo(_lineView);
    }];
    
    [self addSubview:self.lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(1);
        make.left.and.right.equalTo(_loginBtn);
        make.bottom.equalTo(_verifyCodeTextField.mas_top).offset(-7);
    }];
    
    [self addSubview:self.getVerifyCodeBtn];
    [_getVerifyCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(33);
        make.width.offset(105);
        make.right.equalTo(_lineView.mas_right);
        make.bottom.equalTo(_lineView.mas_top).offset(-3);
    }];
    
    [self addSubview:self.phoneTextField];
    [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_lineView.mas_top).offset(-2);
        make.height.offset(35);
        make.left.equalTo(_lineView);
        make.right.equalTo(_getVerifyCodeBtn.mas_left);
    }];
}

- (void)loginBtnClick:(UIButton *)btn {
    if (_delegate && [_delegate respondsToSelector:@selector(loginCallBack:)]) {
        [_delegate loginCallBack:[NSDictionary dictionaryWithObjectsAndKeys:@"value", @"key", nil]];
    }
}

- (void)getVerifyCodeBtnClick:(UIButton *)btn {
    __block NSInteger time = 59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if (time <= 0) { //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置按钮的样式
                [_getVerifyCodeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                [_getVerifyCodeBtn setTitleColor:[UIColor hhz_colorWithHexString:@"FB8557"] forState:UIControlStateNormal];
                _getVerifyCodeBtn.userInteractionEnabled = YES;
            });
        } else {
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置按钮显示读秒效果
                [_getVerifyCodeBtn setTitle:[NSString stringWithFormat:@"(%.2ds)重新发送", seconds] forState:UIControlStateNormal];
                [_getVerifyCodeBtn setTitleColor:[UIColor hhz_colorWithHexString:@"979797"] forState:UIControlStateNormal];
                _getVerifyCodeBtn.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}

- (UITextField *)phoneTextField {
    if (!_phoneTextField) {
        _phoneTextField = [[UITextField alloc] init];
        _phoneTextField.placeholder = @"手机号";
        _phoneTextField.delegate = self;
    }
    return _phoneTextField;
}

- (UIButton *)getVerifyCodeBtn {
    if (!_getVerifyCodeBtn) {
        _getVerifyCodeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_getVerifyCodeBtn setTitle:@"获取验证码" forState:(UIControlStateNormal)];
        _getVerifyCodeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_getVerifyCodeBtn setBackgroundColor:[UIColor hhz_colorWithHexString:@"EBEBEB"]];
        _getVerifyCodeBtn.layer.cornerRadius = 4.0f;
        _getVerifyCodeBtn.layer.masksToBounds = YES;
        [_getVerifyCodeBtn addTarget:self action:@selector(getVerifyCodeBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _getVerifyCodeBtn;
}

- (UITextField *)verifyCodeTextField {
    if (!_verifyCodeTextField) {
        _verifyCodeTextField = [[UITextField alloc] init];
        _verifyCodeTextField.placeholder = @"短信密码";
        _verifyCodeTextField.delegate = self;
    }
    return _verifyCodeTextField;
}

- (UIView *)lineView {
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = [UIColor hhz_colorWithHexString:@"EBEBEB"];
    return _lineView;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_loginBtn setTitle:@"登录" forState:(UIControlStateNormal)];
        _loginBtn.layer.cornerRadius = 4.0f;
        _loginBtn.layer.masksToBounds = YES;
        [_loginBtn setBackgroundColor:[UIColor hhz_colorWithHexString:@"333333"]];
        [_loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _loginBtn;
}

@end
