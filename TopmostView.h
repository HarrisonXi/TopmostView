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
+ (TopmostView *)viewForApplicationWindow;

// get or create a new topmost view for the specified window
+ (TopmostView *)viewForWindow:(UIWindow *)window;

@end
