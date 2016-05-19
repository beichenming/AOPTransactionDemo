//
//  AOPFirstViewController.m
//  AOPTransactionIntactDemo
//
//  Created by wuyike on 16/5/19.
//  Copyright © 2016年 bongmi. All rights reserved.
//

#import "AOPRootViewController.h"

#import "AOPLeftViewController.h"
#import "AOPRightViewController.h"
#import "AOPBottomViewController.h"
#import "AOPTopViewController.h"
#import "Masonry.h"

@interface AOPRootViewController ()

@property (nonatomic) UIButton *topBtn;
@property (nonatomic) UIButton *bottomBtn;
@property (nonatomic) UIButton *leftBtn;
@property (nonatomic) UIButton *rightBtn;

@end

@implementation AOPRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.topBtn];
    [self.view addSubview:self.bottomBtn];
    [self.view addSubview:self.leftBtn];
    [self.view addSubview:self.rightBtn];
    
    [self.topBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(44.0f + 20.0f + 30.0f);
    }];
    
    [self.bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-30.0f);
    }];
    
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(30.0f);
    }];
    
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.right.equalTo(self.view.mas_right).offset(-30.0f);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - event

- (void)topBtnEvent:(id)senders {
    UIViewController *vc = [[AOPTopViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)bottomBtnEvent:(id)senders {
    UIViewController *vc = [[AOPBottomViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)leftBtnEvent:(id)senders {
    UIViewController *vc = [[AOPLeftViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)rightBtnEvent:(id)senders {
     UIViewController *vc = [[AOPRightViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - getter

- (UIButton *)topBtn {
    if (_topBtn == nil) {
        _topBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_topBtn setTitle:@"Top" forState:UIControlStateNormal];
        [_topBtn.titleLabel setFont:[UIFont systemFontOfSize:25]];
        [_topBtn addTarget:self action:@selector(topBtnEvent:) forControlEvents:UIControlEventTouchDown];
    }
    return _topBtn;
}

- (UIButton *)bottomBtn {
    if (_bottomBtn == nil) {
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_bottomBtn setTitle:@"Bottom" forState:UIControlStateNormal];
        [_bottomBtn.titleLabel setFont:[UIFont systemFontOfSize:25]];
        [_bottomBtn addTarget:self action:@selector(bottomBtnEvent:) forControlEvents:UIControlEventTouchDown];
    }
    return _bottomBtn;
}

- (UIButton *)leftBtn {
    if (_leftBtn == nil) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_leftBtn setTitle:@"Left" forState:UIControlStateNormal];
        [_leftBtn.titleLabel setFont:[UIFont systemFontOfSize:25]];
        [_leftBtn addTarget:self action:@selector(leftBtnEvent:) forControlEvents:UIControlEventTouchDown];
    }
    return _leftBtn;
}

- (UIButton *)rightBtn {
    if (_rightBtn == nil) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_rightBtn setTitle:@"Right" forState:UIControlStateNormal];
        [_rightBtn.titleLabel setFont:[UIFont systemFontOfSize:25]];
        [_rightBtn addTarget:self action:@selector(rightBtnEvent:) forControlEvents:UIControlEventTouchDown];
    }
    return _rightBtn;
}


@end
