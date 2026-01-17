# MBProgressHUD_QuickShow

A convenient category extension for MBProgressHUD with quick show methods.

## Features

- 🎯 Quick toast messages with customizable duration
- ⏳ Loading HUD with spinner
- 🎨 Consistent black background style
- 🔒 Thread-safe operations
- 📱 Easy to use class methods

## Requirements

- iOS 12.0+
- Xcode 14-15
- MBProgressHUD ~> 1.2

## Installation

### CocoaPods

Add this to your Podfile:

```ruby
pod 'MBProgressHUD_QuickShow'
```

Then run:

```bash
pod install
```

## Usage

### Objective-C

#### Import

```objective-c
#import <MBProgressHUD_QuickShow/MBProgressHUD+QuickShow.h>
```

#### Show Toast Message

```objective-c
// Show toast in key window
[MBProgressHUD zyc_showToastInKeyWindowWithMessage:@"Hello World"];

// Show toast in specific view
[MBProgressHUD zyc_showToastInView:self.view message:@"Success"];

// Show toast with custom duration
[MBProgressHUD zyc_showToastInView:self.view message:@"Custom" duration:3.0];

// Show toast with custom duration and offset
[MBProgressHUD zyc_showToastInView:self.view message:@"Custom" duration:3.0 offset:CGPointMake(0, 100)];
```

#### Show Loading HUD

```objective-c
// Show loading
MBProgressHUD *hud = [MBProgressHUD zyc_showLoadingInView:self.view message:@"Loading..."];

// Hide loading when done
[MBProgressHUD zyc_hideHUD:hud];
```

#### Hide Toasts

```objective-c
// Hide all toasts in all windows
[MBProgressHUD zyc_hideToasts];

// Hide toasts in specific view
[MBProgressHUD zyc_hideToastsInView:self.view];

// Hide toasts in key window
[MBProgressHUD zyc_hideToastsInKeyWindow];
```

### Swift

#### Import

```swift
import MBProgressHUD_QuickShow
```

#### Show Toast Message

```swift
// Show toast in key window
MBProgressHUD.zyc_showToastInKeyWindow(withMessage: "Hello World")

// Show toast in specific view
MBProgressHUD.zyc_showToast(in: self.view, message: "Success")

// Show toast with custom duration
MBProgressHUD.zyc_showToast(in: self.view, message: "Custom", duration: 3.0)

// Show toast with custom duration and offset
MBProgressHUD.zyc_showToast(in: self.view, message: "Custom", duration: 3.0, offset: CGPoint(x: 0, y: 100))
```

#### Show Loading HUD

```swift
// Show loading
let hud = MBProgressHUD.zyc_showLoading(in: self.view, message: "Loading...")

// Hide loading when done
MBProgressHUD.zyc_hide(hud)
```

#### Hide Toasts

```swift
// Hide all toasts in all windows
MBProgressHUD.zyc_hideToasts()

// Hide toasts in specific view
MBProgressHUD.zyc_hideToasts(in: self.view)

// Hide toasts in key window
MBProgressHUD.zyc_hideToastsInKeyWindow()
```

## API Reference

### Toast Methods

- `+ (void)zyc_showToastInView:(UIView *)view message:(NSString *)message`
- `+ (void)zyc_showToastInView:(UIView *)view message:(NSString *)message duration:(NSTimeInterval)duration`
- `+ (void)zyc_showToastInView:(UIView *)view message:(NSString *)message duration:(NSTimeInterval)duration offset:(CGPoint)offset`
- `+ (void)zyc_showToastInKeyWindowWithMessage:(NSString *)message`

### Loading HUD Methods

- `+ (nullable MBProgressHUD *)zyc_showLoadingInView:(UIView *)view message:(NSString *)message`
- `+ (void)zyc_hideHUD:(nullable MBProgressHUD *)hud`

### Hide Methods

- `+ (void)zyc_hideToasts`
- `+ (void)zyc_hideToastsInView:(UIView *)view`
- `+ (void)zyc_hideToastsInKeyWindow`

## License

MBProgressHUD_QuickShow is available under the MIT license. See the LICENSE file for more info.

## Author

Bfchen - 2946779829@qq.com
