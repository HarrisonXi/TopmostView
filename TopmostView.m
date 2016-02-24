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
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeOrientationHandler:) name:UIApplicationWillChangeStatusBarOrientationNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillChangeStatusBarOrientationNotification object:nil];
}

- (void)updateTransformWithOrientation:(UIInterfaceOrientation)orientation
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
            self.transform = CGAffineTransformIdentity;
            break;
    }
}

- (void)updateFrameWithOrientation:(UIInterfaceOrientation)orientation
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

- (void)updateWithOrientation:(UIInterfaceOrientation)orientation
{
    BOOL isIos7 = [[UIDevice currentDevice].systemVersion floatValue] < 8.0;
    BOOL isKeyboardWindow = [self.window isKindOfClass:NSClassFromString(@"UITextEffectsWindow")];
    if (isIos7 == YES && isKeyboardWindow == NO) {
        [self updateTransformWithOrientation:orientation];
    } else {
        [self updateFrameWithOrientation:orientation];
    }
}

- (void)changeOrientationHandler:(NSNotification *)notification
{
    [UIView animateWithDuration:0.25 animations:^{
        UIInterfaceOrientation orientation = (UIInterfaceOrientation)[notification.userInfo[UIApplicationStatusBarOrientationUserInfoKey] integerValue];
        [self updateWithOrientation:orientation];
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

static UIWindow *topmostWindow_;
+ (instancetype)viewForTopmostWindow
{
    if (!topmostWindow_) {
        topmostWindow_ = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        topmostWindow_.backgroundColor = [UIColor clearColor];
        topmostWindow_.windowLevel = UIWindowLevelStatusBar + 1;
        topmostWindow_.userInteractionEnabled = NO;
        topmostWindow_.rootViewController = [UIViewController new];
        topmostWindow_.hidden = NO;
    }
    return [self viewForWindow:topmostWindow_];
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
        UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
        [topmostView updateWithOrientation:orientation];
        [window addSubview:topmostView];
    }
    [topmostView.window bringSubviewToFront:topmostView];
    return topmostView;
}

@end
