# TopmostView
Get topmost view for UIWindow. The topmost view can rotate correctly with devices. The test project contains a simple toast implemention. Supports iOS 7-10.

Get topmost view for the application window:

    // The application window is [UIApplicationDelegate window].
    [TopmostView viewForApplicationWindow]

Get topmost view for the keyboard window:

    [TopmostView viewForKeyboardWindow]

Get topmost view for a new window over status bar:

    [TopmostView viewForStatusBarWindow]

Get topmost view for a new window over alert view:

    [TopmostView viewForAlertWindow]

Get topmost view for specified window:

    [TopmostView viewForWindow:window]

# 中文介绍
获得 UIWindow 里最顶层的 view。这个最顶层的 view 可以随着设备正常的旋转。另外测试工程里包含一个简单的 toast 实现。支持 iOS 7-10。

获得应用程序 window 里最顶层的 view：

    // 应用程序 window 的值是 [UIApplicationDelegate window]。
    [TopmostView viewForApplicationWindow]

获得键盘 window 里最顶层的 view：

    [TopmostView viewForKeyboardWindow]

获得一个覆盖在状态条之上的新 window 里最顶层的 view：

    [TopmostView viewForStatusBarWindow]

获得一个覆盖在 Alert 弹窗之上的新 window 里最顶层的 view：

    [TopmostView viewForAlertWindow]

获得指定 window 里最顶层的 view：

    [TopmostView viewForWindow:window]
