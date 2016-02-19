//
//  PushedViewController.m
//  TopmostView
//
//  Created by HarrisonXi on 16/2/19.
//  Copyright © 2016年 Pixel Knight Studio. All rights reserved.
//

#import "PushedViewController.h"

@interface PushedViewController ()

@property (nonatomic, strong) UIButton *popButton;

@end

@implementation PushedViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Pushed";
    [self.view addSubview:self.popButton];
}

- (UIButton *)popButton
{
    if (!_popButton) {
        _popButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_popButton setTitle:@"Pop" forState:UIControlStateNormal];
        _popButton.frame = CGRectMake(10, 10, 100, 50);
        [_popButton addTarget:self action:@selector(popAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _popButton;
}

- (void)popAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
