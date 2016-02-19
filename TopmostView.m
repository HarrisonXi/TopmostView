//
//  TopmostView.m
//  TopmostView
//
//  Created by HarrisonXi on 16/2/19.
//  Copyright © 2016年 Pixel Knight Studio. All rights reserved.
//

#import "TopmostView.h"

@interface TopmostView ()

@property (nonatomic, weak) UIWindow *window;

@end

@implementation TopmostView

- (instancetype)initWithWindow:(UIWindow *)window
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = NO;
        self.window = window;
        if ([[UIDevice currentDevice].systemVersion floatValue] < 8.0) {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeOrientationHandler:) name:UIApplicationWillChangeStatusBarOrientationNotification object:nil];
        } else {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeOrientationHandler:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
        }
    }
    return self;
}

- (void)dealloc
{
    if ([[UIDevice currentDevice].systemVersion floatValue] < 8.0) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillChangeStatusBarOrientationNotification object:nil];
    } else {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
    }
}

- (void)updateTransformForIos7:(UIInterfaceOrientation)orientation
{
    switch (orientation) {
        case UIInterfaceOrientationLandscapeLeft:
            self.transform = CGAffineTransformMakeRotation(-M_PI_2);
            break;
        case UIInterfaceOrientationLandscapeRight:
            self.transform = CGAffineTransformMakeRotation(M_PI_2);
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            self.transform = CGAffineTransformMakeRotation(-M_PI);
            break;
        default:
            self.transform = CGAffineTransformMakeRotation(0);
            break;
    }
}

- (void)updateFrameForIos7:(UIInterfaceOrientation)orientation
{
    CGFloat width = CGRectGetWidth(self.window.bounds);
    CGFloat height = CGRectGetHeight(self.window.bounds);
    if (width < height) {
        CGFloat temp = width;
        width = height;
        height = temp;
    }
    switch (orientation) {
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:
            self.frame = CGRectMake(0, 0, width, height);
            break;
        default:
            self.frame = CGRectMake(0, 0, height, width);
            break;
    }
}

- (void)changeOrientationHandler:(NSNotification *)notification
{
    [UIView animateWithDuration:0.25 animations:^{
        if ([[UIDevice currentDevice].systemVersion floatValue] < 8.0) {
            UIInterfaceOrientation orientation = (UIInterfaceOrientation)[notification.userInfo[UIApplicationStatusBarOrientationUserInfoKey] integerValue];
            if ([self.window isKindOfClass:NSClassFromString(@"UITextEffectsWindow")]) {
                [self updateFrameForIos7:orientation];
            } else {
                [self updateTransformForIos7:orientation];
            }
        } else {
            if ([self.window isKindOfClass:NSClassFromString(@"UITextEffectsWindow")]) {
                self.frame = [UIApplication sharedApplication].keyWindow.bounds;
            } else {
                self.frame = self.window.bounds;
            }
        }
    }];
}

+ (instancetype)viewForKeyboardWindow
{
    for (UIWindow *window in [[UIApplication sharedApplication].windows reverseObjectEnumerator]) {
        if ([window isKindOfClass:NSClassFromString(@"UITextEffectsWindow")] && window.hidden == NO && window.alpha > 0) {
            return [TopmostView viewForWindow:window];
        }
    }
    return nil;
}

+ (instancetype)viewForApplicationWindow
{
    return [self viewForWindow:[UIApplication sharedApplication].keyWindow];
}

+ (instancetype)viewForWindow:(UIWindow *)window
{
    TopmostView *topmostView = nil;
    for (UIView *subview in window.subviews) {
        if ([subview isKindOfClass:[TopmostView class]]) {
            topmostView = (TopmostView *)subview;
            break;
        }
    }
    if (!topmostView) {
        topmostView = [[self alloc] initWithWindow:window];
        topmostView.frame = window.bounds;
        if ([[UIDevice currentDevice].systemVersion floatValue] < 8.0) {
            UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
            if ([window isKindOfClass:NSClassFromString(@"UITextEffectsWindow")]) {
                [topmostView updateFrameForIos7:orientation];
            } else {
                [topmostView updateTransformForIos7:orientation];
            }
        }
        [window addSubview:topmostView];
    }
    [topmostView.window bringSubviewToFront:topmostView];
    return topmostView;
}

@end
