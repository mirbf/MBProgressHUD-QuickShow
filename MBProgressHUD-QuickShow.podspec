Pod::Spec.new do |s|
  s.name             = 'MBProgressHUD-QuickShow'
  s.version          = '1.0.0'
  s.summary          = 'A convenient category extension for MBProgressHUD with quick show methods.'

  s.description      = <<-DESC
  MBProgressHUD-QuickShow provides convenient methods to quickly show toast messages
  and loading HUDs with a consistent style. It includes methods for showing text toasts,
  loading indicators, and hiding them with simple one-line calls.

  Features:
  - Quick toast messages with customizable duration
  - Loading HUD with spinner
  - Consistent black background style
  - Thread-safe operations
  - Easy to use class methods
                       DESC

  s.homepage         = 'https://github.com/mirbf/MBProgressHUD-QuickShow'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Bfchen' => '2946779829@qq.com' }
  s.source           = { :git => 'https://github.com/mirbf/MBProgressHUD-QuickShow.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.requires_arc = true

  s.source_files = 'MBProgressHUD-QuickShow/Classes/**/*'
  s.public_header_files = 'MBProgressHUD-QuickShow/Classes/**/*.h'

  # Dependency on MBProgressHUD
  s.dependency 'MBProgressHUD', '~> 1.2'

  s.frameworks = 'UIKit', 'Foundation'

  # Fix for Xcode 14-15 compatibility with MBProgressHUD's iOS 8.0 deployment target
  s.pod_target_xcconfig = {
    'IPHONEOS_DEPLOYMENT_TARGET' => '12.0'
  }
end
