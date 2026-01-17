//
//  MBProgressHUD+QuickShow.h
//  ZhouyiCompass
//
//  Created by 华可容 on 2024/9/11.
//

#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (QuickShow)

+ (void) showProgresssInfo:(NSString *)info;

/// Text toast with app default style: black background (0.8) + white text.
+ (void)zyc_showToastInView:(UIView *)view message:(NSString *)message;
+ (void)zyc_showToastInView:(UIView *)view message:(NSString *)message duration:(NSTimeInterval)duration;
+ (void)zyc_showToastInView:(UIView *)view message:(NSString *)message duration:(NSTimeInterval)duration offset:(CGPoint)offset;
+ (void)zyc_showToastInKeyWindowWithMessage:(NSString *)message;

/// Remove currently displayed toast(s) from the given view / key window.
+ (void)zyc_hideToasts;
+ (void)zyc_hideToastsInView:(UIView *)view;
+ (void)zyc_hideToastsInKeyWindow;

/// Loading HUD with app default style: black translucent bezel + white text/spinner.
/// Returned HUD should be hidden via `zyc_hideHUD:` (or `-[MBProgressHUD hideAnimated:]` on main thread).
+ (nullable MBProgressHUD *)zyc_showLoadingInView:(UIView *)view message:(NSString *)message;
+ (void)zyc_hideHUD:(nullable MBProgressHUD *)hud;

@end

NS_ASSUME_NONNULL_END
