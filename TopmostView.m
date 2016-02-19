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
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeOrientationAction:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
}

- (void)changeOrientationAction:(NSNotification *)notification
{
    [UIView animateWithDuration:UINavigationControllerHideShowBarDuration animations:^{
        self.frame = self.window.bounds;
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
        [window addSubview:topmostView];
    }
    [topmostView.window bringSubviewToFront:topmostView];
    return topmostView;
}

@end
