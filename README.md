[![CocoaPods](https://img.shields.io/cocoapods/v/TopmostView.svg)]() [![CocoaPods](https://img.shields.io/cocoapods/p/TopmostView.svg)]() [![CocoaPods](https://img.shields.io/cocoapods/l/TopmostView.svg)]()

# TopmostView

Get topmost view for UIWindow. The topmost view can rotate correctly with devices. The test project contains a simple toast implemention. Supports iOS 7-11.

Get topmost view for the application window:

    // The application window is [UIApplicationDelegate window].
    [TopmostView viewForApplicationWindow]

Get topmost view for the keyboard window:

    [TopmostView viewForKeyboardWindow]

Get topmost view for a new window over status bar:

    [TopmostView viewForStatusBarWindow]

Get topmost view for a new window over alert view:

    // It is for iOS 7/8, UIAlertView cteate a new window which level = UIWindowLevelAlert.
    // For iOS >= 9, UIAlertController does not create a new window.
    [TopmostView viewForAlertWindow]

Get topmost view for specified window:

    [TopmostView viewForWindow:window]

# 中文介绍

获得 UIWindow 里最顶层的 view。这个最顶层的 view 可以随着设备正常的旋转。另外测试工程里包含一个简单的 toast 实现。支持 iOS 7-11。

获得应用程序 window 里最顶层的 view：

    // 应用程序 window 的值是 [UIApplicationDelegate window]。
    [TopmostView viewForApplicationWindow]

获得键盘 window 里最顶层的 view：

    [TopmostView viewForKeyboardWindow]

获得一个覆盖在状态条之上的新 window 里最顶层的 view：

    [TopmostView viewForStatusBarWindow]

获得一个覆盖在 Alert 弹窗之上的新 window 里最顶层的 view：

    // 这是用在 iOS 7/8 上的，UIAlertView 会创建一个 level 为 UIWindowLevelAlert 的 window。
    // 在 iOS >= 9 的设备上，UIAlertController 是不会创建新 window 的。
    [TopmostView viewForAlertWindow]

获得指定 window 里最顶层的 view：

    [TopmostView viewForWindow:window]

实现细节逻辑相关blog：[iOS系统的键盘window](http://blog.harrisonxi.com/2017/02/iOS%E7%B3%BB%E7%BB%9F%E7%9A%84%E9%94%AE%E7%9B%98window.html)，[iOS系统window的旋转及自定义window的问题](http://blog.harrisonxi.com/2017/02/iOS%E7%B3%BB%E7%BB%9Fwindow%E7%9A%84%E6%97%8B%E8%BD%AC%E5%8F%8A%E8%87%AA%E5%AE%9A%E4%B9%89window%E7%9A%84%E9%97%AE%E9%A2%98.html)
