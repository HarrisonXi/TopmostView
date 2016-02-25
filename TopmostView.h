//
//  TopmostView.h
//  TopmostView
//
//  Created by HarrisonXi on 16/2/19.
//  Copyright © 2016年 Pixel Knight Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopmostView : UIView

// get topmost view for the application key window
+ (instancetype)viewForApplicationWindow;

// get topmost view for the keyboard window
+ (instancetype)viewForKeyboardWindow;

// get topmost view for a new window over status bar
+ (instancetype)viewForTopmostWindow;

// get topmost view for specified window
+ (instancetype)viewForWindow:(UIWindow *)window;

@end
