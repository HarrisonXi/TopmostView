//
//  PresentedViewController.m
//  TopmostView
//
//  Created by HarrisonXi on 16/2/19.
//  Copyright © 2016年 Pixel Knight Studio. All rights reserved.
//

#import "PresentedViewController.h"
#import "TopmostView.h"
#import "UIView+Toast.h"

@interface PresentedViewController ()

@property (nonatomic, strong) UIButton *dismissButton;

@end

@implementation PresentedViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Presented";
    self.view.backgroundColor = [UIColor colorWithRed:0.9 green:1 blue:0.9 alpha:1];
    [self.view addSubview:self.dismissButton];
}

- (UIButton *)dismissButton
{
    if (!_dismissButton) {
        _dismissButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_dismissButton setTitle:@"Pop" forState:UIControlStateNormal];
        _dismissButton.frame = CGRectMake(10, 10, 100, 50);
        [_dismissButton addTarget:self action:@selector(dismissAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dismissButton;
}

- (void)dismissAction
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    [[TopmostView viewForApplicationWindow] showToast:@"dismiss"];
}

@end