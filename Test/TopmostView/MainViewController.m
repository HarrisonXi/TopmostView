//
//  MainViewController.m
//  TopmostView
//
//  Created by HarrisonXi on 16/2/19.
//  Copyright © 2016-2017年 http://harrisonxi.com/. All rights reserved.
//

#import "MainViewController.h"
#import "PushedViewController.h"
#import "PresentedViewController.h"
#import "KeyboardController.h"
#import "TopmostView.h"
#import "UIView+Toast.h"

@interface MainViewController ()

@property (nonatomic, strong) UIButton *pushButton;
@property (nonatomic, strong) UIButton *presentButton;
@property (nonatomic, strong) UIButton *keyboardButton;
@property (nonatomic, strong) UIButton *statusBarButton;
@property (nonatomic, strong) UIButton *alertButton;

@property (nonatomic, strong) UIView *statusBarColorView;
@property (nonatomic, strong) NSArray *colorArray;
@property (nonatomic, assign) NSInteger colorIndex;

@end

@implementation MainViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.title = @"TopmostViewDemo";
        self.colorArray = @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.pushButton];
    [self.view addSubview:self.presentButton];
    [self.view addSubview:self.keyboardButton];
    [self.view addSubview:self.statusBarButton];
    [self.view addSubview:self.alertButton];
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

- (UIButton *)keyboardButton
{
    if (!_keyboardButton) {
        _keyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_keyboardButton setTitle:@"Keyboard" forState:UIControlStateNormal];
        _keyboardButton.frame = CGRectMake(10, 130, 100, 50);
        [_keyboardButton addTarget:self action:@selector(keyboardAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _keyboardButton;
}

- (UIButton *)statusBarButton
{
    if (!_statusBarButton) {
        _statusBarButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_statusBarButton setTitle:@"Status Bar" forState:UIControlStateNormal];
        _statusBarButton.frame = CGRectMake(10, 190, 100, 50);
        [_statusBarButton addTarget:self action:@selector(changeColorAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _statusBarButton;
}

- (UIView *)statusBarColorView
{
    if (!_statusBarColorView) {
        TopmostView *topmostView = [TopmostView viewForStatusBarWindow];
        _statusBarColorView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(topmostView.bounds) - 64, 0, 64, 64)];
        _statusBarColorView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        [topmostView addSubview:_statusBarColorView];
    }
    return _statusBarColorView;
}

- (UIButton *)alertButton
{
    if (!_alertButton) {
        _alertButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_alertButton setTitle:@"Alert" forState:UIControlStateNormal];
        _alertButton.frame = CGRectMake(10, 250, 100, 50);
        [_alertButton addTarget:self action:@selector(alertAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _alertButton;
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

- (void)keyboardAction
{
    [self.navigationController pushViewController:[KeyboardController new] animated:YES];
}

- (void)changeColorAction
{
    self.statusBarColorView.backgroundColor = self.colorArray[self.colorIndex];
    self.colorIndex = (self.colorIndex + 1) % [self.colorArray count];
}

- (void)alertAction
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Alert" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
    [[TopmostView viewForStatusBarWindow] showToast:@"~\n status bar \n~" withYLocation:0.6];
    [[TopmostView viewForAlertWindow] showToast:@"~\n alert \n~" withYLocation:0.4];
}

@end
