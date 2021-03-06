//
//  PushedViewController.m
//  TopmostView
//
//  Created by HarrisonXi on 16/2/19.
//  Copyright (c) 2016-2017 http://harrisonxi.com/. All rights reserved.
//

#import "PushedViewController.h"
#import "TopmostView.h"
#import "UIView+Toast.h"

@interface PushedViewController ()

@property (nonatomic, strong) UIButton *popButton;

@end

@implementation PushedViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.title = @"Pushed";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0.9 alpha:1];
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
    [[TopmostView viewForApplicationWindow] showToast:@"pop"];
}

@end
