//
//  TopmostView.h
//  TopmostView
//
//  Created by HarrisonXi on 16/2/19.
//  Copyright (c) 2016-2017 http://harrisonxi.com/. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TVWindow : UIWindow

@end

@interface TopmostView : UIView

// Get topmost view for the application window.
// The application window is [UIApplicationDelegate window].
+ (instancetype)viewForApplicationWindow;

// Get topmost view for a new window over status bar.
+ (instancetype)viewForStatusBarWindow;

// Get topmost view for a new window over alert window.
// It is for iOS 7/8, UIAlertView cteate a new window which level = UIWindowLevelAlert.
// For iOS >= 9, UIAlertController does not create a new window.
+ (instancetype)viewForAlertWindow;

// Get topmost view for the keyboard window.
+ (instancetype)viewForKeyboardWindow;

// Get topmost view for specified window.
+ (instancetype)viewForWindow:(UIWindow *)window;

// Use these methods to enable or disable user interaction.
// TopmostView will manage the correct state with call count.
// Please make sure the window is enabled.
// If the window is a TVWindow created by TopmostView,
// TopmostView will also manage the correct state for it.
- (void)recursiveEnableUserInteraction;
- (void)recursiveDisableUserInteraction;

@end
