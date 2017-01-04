//
//  KeyboardController.m
//  TopmostView
//
//  Created by HarrisonXi on 16/2/19.
//  Copyright © 2016-2017年 http://harrisonxi.com/. All rights reserved.
//

#import "KeyboardController.h"
#import "TopmostView.h"
#import "UIView+Toast.h"

@interface KeyboardController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *toast1Button;
@property (nonatomic, strong) UIButton *toast2Button;

@end

@implementation KeyboardController

- (instancetype)init
{
    if (self = [super init]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.title = @"Keyboard";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:1 green:0.9 blue:0.9 alpha:1];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.toast1Button];
    [self.view addSubview:self.toast2Button];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [UITextField new];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.frame = CGRectMake(10, 10, 200, 50);
        _textField.delegate = self;
    }
    return _textField;
}

- (UIButton *)toast1Button
{
    if (!_toast1Button) {
        _toast1Button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_toast1Button setTitle:@"Applicatoin Toast" forState:UIControlStateNormal];
        _toast1Button.frame = CGRectMake(10, 70, 200, 50);
        [_toast1Button addTarget:self action:@selector(toastAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _toast1Button;
}

- (UIButton *)toast2Button
{
    if (!_toast2Button) {
        _toast2Button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_toast2Button setTitle:@"Topmost Toast" forState:UIControlStateNormal];
        _toast2Button.frame = CGRectMake(10, 130, 200, 50);
        [_toast2Button addTarget:self action:@selector(toastAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _toast2Button;
}

- (void)toastAction:(id)sender
{
    if (sender == self.toast1Button) {
        [[TopmostView viewForApplicationWindow] showToast:@"~\n application \n~"];
    } else if (sender == self.toast2Button) {
        [[TopmostView viewForTopmostWindow] showToast:@"~\n topmost \n~"];
    }
}

@end
