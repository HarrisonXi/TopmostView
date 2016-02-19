//
//  MainViewController.m
//  TopmostView
//
//  Created by HarrisonXi on 16/2/19.
//  Copyright © 2016年 Pixel Knight Studio. All rights reserved.
//

#import "MainViewController.h"
#import "PushedViewController.h"
#import "PresentedViewController.h"
#import "TextViewController.h"
#import "TopmostView.h"
#import "UIView+Toast.h"

@interface MainViewController ()

@property (nonatomic, strong) UIButton *pushButton;
@property (nonatomic, strong) UIButton *presentButton;
@property (nonatomic, strong) UIButton *gotoTextButton;

@end

@implementation MainViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Main";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.pushButton];
    [self.view addSubview:self.presentButton];
    [self.view addSubview:self.gotoTextButton];
}

- (UIButton *)pushButton
{
    if (!_pushButton) {
        _pushButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_pushButton setTitle:@"Push" forState:UIControlStateNormal];
        _pushButton.frame = CGRectMake(10, 10, 100, 50);
        [_pushButton addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushButton;
}

- (UIButton *)presentButton
{
    if (!_presentButton) {
        _presentButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_presentButton setTitle:@"Present" forState:UIControlStateNormal];
        _presentButton.frame = CGRectMake(10, 70, 100, 50);
        [_presentButton addTarget:self action:@selector(presentAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _presentButton;
}

- (UIButton *)gotoTextButton
{
    if (!_gotoTextButton) {
        _gotoTextButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_gotoTextButton setTitle:@"Text" forState:UIControlStateNormal];
        _gotoTextButton.frame = CGRectMake(10, 130, 100, 50);
        [_gotoTextButton addTarget:self action:@selector(gotoTextAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _gotoTextButton;
}

- (void)pushAction
{
    [self.navigationController pushViewController:[PushedViewController new] animated:YES];
    [[TopmostView viewForApplicationWindow] showToast:@"push"];
}

- (void)presentAction
{
    [self.navigationController presentViewController:[[UINavigationController alloc] initWithRootViewController:[PresentedViewController new]] animated:YES completion:nil];
    [[TopmostView viewForApplicationWindow] showToast:@"present"];
}

- (void)gotoTextAction
{
    [self.navigationController pushViewController:[TextViewController new] animated:YES];
}

@end
