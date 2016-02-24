//
//  TopmostView.h
//  TopmostView
//
//  Created by HarrisonXi on 16/2/19.
//  Copyright © 2016年 Pixel Knight Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopmostView : UIView

// get or create a new topmost view for the application window
+ (instancetype)viewForApplicationWindow;

// get or create a new topmost view for the keyboard window
+ (instancetype)viewForKeyboardWindow;

// get or create a new topmost view for a new window over status bar
+ (instancetype)viewForTopmostWindow;

// get or create a new topmost view for the specified window
+ (instancetype)viewForWindow:(UIWindow *)window;

@end
