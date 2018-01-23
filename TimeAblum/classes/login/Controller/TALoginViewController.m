//
//  TALoginViewController.m
//  TimeAblum
//
//  Created by 王旭 on 2018/1/23.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TALoginViewController.h"
#import "TALoginView.h"

@interface TALoginViewController ()<TALoginViewDelegate>

@end

@implementation TALoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    TALoginView *loginView = [TALoginView new];
    loginView.delegate = self;
    [self.view addSubview:loginView];
    loginView.backgroundColor = [UIColor clearColor];
    [loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(SCALE_DISTANCE(-150));
        make.width.equalTo(self.view);
        make.height.equalTo(@(SCALE_DISTANCE(400)));
    }];
    // Do any additional setup after loading the view.
}

- (void)loginCallBack:(id)obj {
    _loginCallBack(obj);
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
