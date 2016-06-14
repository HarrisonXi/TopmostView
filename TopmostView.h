//
//  TopmostView.h
//  TopmostView
//
//  Created by HarrisonXi on 16/2/19.
//  Copyright © 2016年 Pixel Knight Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopmostView : UIView

// Reset the application window to current key window.
+ (void)resetApplicationWindow;

// Set the application window to a window.
+ (void)setApplicationWindow:(UIWindow *)aWindow;

// Get topmost view for the application window.
// If the application window is not set, it will get the application key window.
+ (instancetype)viewForApplicationWindow;

// Get topmost view for the keyboard window.
+ (instancetype)viewForKeyboardWindow;

// Get topmost view for a new window over status bar.
+ (instancetype)viewForTopmostWindow;

// Get topmost view for specified window.
+ (instancetype)viewForWindow:(UIWindow *)window;

@end
