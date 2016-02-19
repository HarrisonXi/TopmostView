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

- (void)updateOrientationForIos7:(UIInterfaceOrientation)orientation
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

- (void)changeOrientationHandler:(NSNotification *)notification
{
    [UIView animateWithDuration:0.25 animations:^{
        if ([[UIDevice currentDevice].systemVersion floatValue] < 8.0) {
            UIInterfaceOrientation orientation = (UIInterfaceOrientation)[notification.userInfo[UIApplicationStatusBarOrientationUserInfoKey] integerValue];
            [self updateOrientationForIos7:orientation];
        } else {
            self.frame = self.window.bounds;
        }
    }];
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
            [topmostView updateOrientationForIos7:[UIApplication sharedApplication].statusBarOrientation];
        }
        [window addSubview:topmostView];
    }
    [topmostView.window bringSubviewToFront:topmostView];
    return topmostView;
}

@end
