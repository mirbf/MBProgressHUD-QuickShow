//
//  MBProgressHUD+QuickShow.m
//  ZhouyiCompass
//
//  Created by 华可容 on 2024/9/11.
//

#import "MBProgressHUD+QuickShow.h"

static const NSInteger kZYCTostHUDTag = 0x5A594354; // "ZYCT"

static UIWindow *ZYCKeyWindowIfPossible(void) {
    UIWindow *window = nil;
    if (@available(iOS 13.0, *)) {
        for (UIWindow *w in [UIApplication sharedApplication].windows) {
            if (w.isKeyWindow) {
                window = w;
                break;
            }
        }
    } else {
        window = [UIApplication sharedApplication].keyWindow;
    }

    if (!window) {
        window = [[[UIApplication sharedApplication] windows] firstObject];
    }
    return window;
}

static void ZYCHideToastsInViewHierarchy(UIView *view) {
    if (!view) {
        return;
    }

    if ([view isKindOfClass:[MBProgressHUD class]]) {
        MBProgressHUD *hud = (MBProgressHUD *)view;
        // Only hide text toasts; do not disturb loading/progress HUDs.
        // Prefer hiding our tagged toasts, but still hide any text HUDs to match "remove current toast" expectation.
        if (hud.mode == MBProgressHUDModeText || hud.tag == kZYCTostHUDTag) {
            [hud hideAnimated:NO];
        }
        return;
    }

    NSArray<UIView *> *subviews = [view.subviews copy];
    for (UIView *subview in subviews) {
        ZYCHideToastsInViewHierarchy(subview);
    }
}

@implementation MBProgressHUD (QuickShow)

//MARK: 提示
+ (void) showProgresssInfo:(NSString *)info {
    [self zyc_showToastInKeyWindowWithMessage:info];
}

+ (void)zyc_showToastInView:(UIView *)view message:(NSString *)message {
    [self zyc_showToastInView:view message:message duration:1.5];
}

+ (void)zyc_showToastInView:(UIView *)view message:(NSString *)message duration:(NSTimeInterval)duration {
    [self zyc_showToastInView:view message:message duration:duration offset:CGPointZero];
}

+ (void)zyc_showToastInView:(UIView *)view message:(NSString *)message duration:(NSTimeInterval)duration offset:(CGPoint)offset {
    if (!view || message.length == 0) {
        return;
    }

    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = message;
        hud.label.font = [UIFont systemFontOfSize:14];
        hud.label.numberOfLines = 0;
        // Toast should not block underlying interactions (e.g. pinch/drag/scroll).
        hud.userInteractionEnabled = NO;
        hud.tag = kZYCTostHUDTag;

        // Toast style: black background (80% opacity) + white text.
        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        hud.bezelView.layer.cornerRadius = 8.0;
        hud.contentColor = [UIColor whiteColor];

        // No full-screen dimming behind the toast.
        hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.backgroundView.backgroundColor = [UIColor clearColor];

        hud.offset = offset;
        hud.removeFromSuperViewOnHide = YES;
        [hud hideAnimated:YES afterDelay:duration];
    });
}

+ (void)zyc_showToastInKeyWindowWithMessage:(NSString *)message {
    if (message.length == 0) {
        return;
    }

    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = ZYCKeyWindowIfPossible();
        if (!window) return;
        [self zyc_showToastInView:window message:message duration:2.0];
    });
}

+ (void)zyc_hideToasts {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSArray<UIWindow *> *windows = [[UIApplication sharedApplication].windows copy];
        for (UIWindow *window in windows) {
            ZYCHideToastsInViewHierarchy(window);
        }
    });
}

+ (void)zyc_hideToastsInView:(UIView *)view {
    if (!view) {
        return;
    }

    dispatch_async(dispatch_get_main_queue(), ^{
        ZYCHideToastsInViewHierarchy(view);
    });
}

+ (void)zyc_hideToastsInKeyWindow {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = ZYCKeyWindowIfPossible();
        if (!window) return;
        [self zyc_hideToastsInView:window];
    });
}

+ (MBProgressHUD *)zyc_showLoadingInView:(UIView *)view message:(NSString *)message {
    if (!view) {
        return nil;
    }

    __block MBProgressHUD *hud = nil;
    void (^work)(void) = ^{
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.label.text = message ?: @"";
        hud.label.font = [UIFont systemFontOfSize:14];
        hud.removeFromSuperViewOnHide = YES;

        // Style: black translucent bezel + white text/spinner.
        hud.contentColor = [UIColor whiteColor];
        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.75];
        hud.bezelView.layer.cornerRadius = 8.0;

        // No full-screen dimming behind the HUD (bezel only).
        hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.backgroundView.backgroundColor = [UIColor clearColor];
    };

    if ([NSThread isMainThread]) {
        work();
    } else {
        dispatch_sync(dispatch_get_main_queue(), work);
    }
    return hud;
}

+ (void)zyc_hideHUD:(MBProgressHUD *)hud {
    if (!hud) return;
    if ([NSThread isMainThread]) {
        [hud hideAnimated:YES];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    }
}

@end
