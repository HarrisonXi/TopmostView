//
//  UIView+Toast.m
//  TopmostView
//
//  Created by HarrisonXi on 16/2/19.
//  Copyright (c) 2016-2017 http://harrisonxi.com/. All rights reserved.
//

#import "UIView+Toast.h"
#import "TopmostView.h"

@implementation UIView (Toast)

- (void)showToast:(NSString *)messageStr
{
    [self showToast:messageStr withYLocation:2 / 3.0];
}

- (void)showToast:(NSString *)messageStr withYLocation:(CGFloat)yLocation
{
    UIFont *messageFont = [UIFont systemFontOfSize:16];
    CGSize messageSize = [messageStr sizeWithAttributes:@{NSFontAttributeName : messageFont}];
    __block UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, messageSize.width + 32, messageSize.height + 32)];
    messageLabel.numberOfLines = 0;
    messageLabel.layer.cornerRadius = 8;
    messageLabel.layer.masksToBounds = YES;
    messageLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    messageLabel.font = messageFont;
    messageLabel.text = messageStr;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.center = CGPointMake(CGRectGetWidth(self.bounds) / 2, CGRectGetHeight(self.bounds) * yLocation);
    messageLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    messageLabel.alpha = 0;
    [self addSubview:messageLabel];
    
    if ([self respondsToSelector:@selector(recursiveEnableUserInteraction)]) {
        // Block user interaction.
        [self performSelector:@selector(recursiveEnableUserInteraction)];
    }
    [UIView animateWithDuration:0.25 animations:^{
        messageLabel.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 delay:2.5 options:0 animations:^{
            messageLabel.alpha = 0;
        } completion:^(BOOL finished) {
            [messageLabel removeFromSuperview];
            if ([self respondsToSelector:@selector(recursiveDisableUserInteraction)]) {
                // Unblock user interaction.
                [self performSelector:@selector(recursiveDisableUserInteraction)];
            }
        }];
    }];
}

@end
