//
//  AOPBottomViewController.m
//  AOPTransactionIntactDemo
//
//  Created by wuyike on 16/5/19.
//  Copyright © 2016年 bongmi. All rights reserved.
//

#import "AOPBottomViewController.h"

#import "Masonry.h"

@interface AOPBottomViewController ()

@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UIButton *detailBtn;

@end

@implementation AOPBottomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.detailBtn];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
    }];
    
    [self.detailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(44.0f + 20.0f + 30.0f);
        make.centerX.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - event

- (void)detailBottomBtnEvent:(id)sender {
////if we not use AOP, we must write this code in project
//#ifdef LITE_VERSION
//    //do nothing
//#else
//    //do everything
//#endif
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Waring"
                                                    message:@"Bottom:This is Intact Version"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark - getter

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setText:@"This is Bottom Page"];
        [_titleLabel setTextColor:[UIColor blackColor]];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:15.0f]];
    }
    return _titleLabel;
}

- (UIButton *)detailBtn {
    if (_detailBtn == nil) {
        _detailBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_detailBtn setTitle:@"Detail" forState:UIControlStateNormal];
        [_detailBtn.titleLabel setFont:[UIFont systemFontOfSize:25]];
        [_detailBtn addTarget:self action:@selector(detailBottomBtnEvent:) forControlEvents:UIControlEventTouchDown];
    }
    return _detailBtn;
}


@end
