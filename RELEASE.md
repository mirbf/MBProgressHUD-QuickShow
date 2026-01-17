# MBProgressHUD_QuickShow 发布流程

## 📦 Pod 信息

- **名称**: MBProgressHUD_QuickShow
- **当前版本**: 1.0.1
- **CocoaPods 页面**: https://cocoapods.org/pods/MBProgressHUD_QuickShow
- **GitHub 仓库**: https://github.com/mirbf/MBProgressHUD-QuickShow
- **作者**: Bfchen (2946779829@qq.com)

## 🚀 首次发布流程（已完成）

### 1. 创建项目结构
```bash
mkdir -p MBProgressHUD-QuickShow/MBProgressHUD-QuickShow/Classes
```

### 2. 添加源代码文件
- `MBProgressHUD-QuickShow/Classes/MBProgressHUD+QuickShow.h`
- `MBProgressHUD-QuickShow/Classes/MBProgressHUD+QuickShow.m`

### 3. 创建必要文件
- `MBProgressHUD-QuickShow.podspec` - Pod 配置文件
- `README.md` - 项目说明文档
- `LICENSE` - MIT 许可证
- `.gitignore` - Git 忽略文件

### 4. 初始化 Git 仓库
```bash
git init
git add .
git commit -m "Initial commit: Add MBProgressHUD QuickShow extension"
```

### 5. 推送到 GitHub
```bash
git remote add origin git@github.com:mirbf/MBProgressHUD-QuickShow.git
git push -u origin main
```

### 6. 创建版本标签
```bash
git tag 1.0.0
git push origin 1.0.0
```

### 7. 注册 CocoaPods Trunk（首次）
```bash
pod trunk register 2946779829@qq.com 'Bfchen' --description='MacBook Pro'
# 点击邮件中的验证链接
```

### 8. 发布到 CocoaPods
```bash
pod trunk push MBProgressHUD-QuickShow.podspec --use-libraries --allow-warnings
```

## 🔄 后续版本更新流程

### 步骤 1: 修改代码
修改源代码文件，添加新功能或修复 bug。

### 步骤 2: 更新版本号
编辑 `MBProgressHUD_QuickShow.podspec` 文件，修改版本号：
```ruby
s.version = '1.0.2'  # 从 1.0.1 改为 1.0.2
```

### 步骤 3: 更新 README（如需要）
如果有新功能或 API 变更，更新 `README.md` 文档。

### 步骤 4: 提交代码
```bash
cd /Users/bigger/Desktop/Pod/MBProgressHUD-QuickShow

git add .
git commit -m "Update: 描述本次更新的内容"
git push origin main
```

### 步骤 5: 创建新版本标签
```bash
# 删除本地旧标签（如果需要重新打标签）
git tag -d 1.0.1

# 删除远程旧标签（如果需要重新打标签）
git push origin :refs/tags/1.0.1

# 创建新标签
git tag 1.0.1

# 推送标签到远程
git push origin 1.0.1
```

### 步骤 6: 验证 podspec（可选）
```bash
# 本地验证
pod lib lint MBProgressHUD-QuickShow.podspec --use-libraries --allow-warnings

# 远程验证
pod spec lint MBProgressHUD-QuickShow.podspec --use-libraries --allow-warnings
```

### 步骤 7: 发布到 CocoaPods
```bash
pod trunk push MBProgressHUD_QuickShow.podspec --use-libraries --allow-warnings
```

### 步骤 8: 验证发布结果
```bash
# 搜索 pod
pod search MBProgressHUD_QuickShow

# 查看 pod 信息
pod trunk info MBProgressHUD_QuickShow
```

## 📋 版本号规范

遵循语义化版本（Semantic Versioning）：

- **主版本号（Major）**: 不兼容的 API 修改
  - 例如：1.0.0 → 2.0.0

- **次版本号（Minor）**: 向下兼容的功能性新增
  - 例如：1.0.0 → 1.1.0

- **修订号（Patch）**: 向下兼容的问题修正
  - 例如：1.0.0 → 1.0.1

## ⚠️ 注意事项

### 1. 使用 --use-libraries 参数
由于 MBProgressHUD 1.2.0 的 deployment target 是 iOS 8.0，与 Xcode 14-15 不兼容，必须使用 `--use-libraries` 参数来发布。

### 2. 允许警告
使用 `--allow-warnings` 参数来忽略依赖库的警告。

### 3. 版本标签必须匹配
podspec 中的版本号必须与 Git 标签完全一致。

### 4. 不要修改已发布的版本
一旦版本发布到 CocoaPods，不要修改该版本的代码。如需修改，请发布新版本。

### 5. 测试后再发布
在发布前，建议在实际项目中测试新版本是否正常工作。

## 🛠️ 常用命令

### 查看 CocoaPods 账户信息
```bash
pod trunk me
```

### 查看 pod 信息
```bash
pod trunk info MBProgressHUD_QuickShow
```

### 删除已发布的版本（慎用）
```bash
pod trunk delete MBProgressHUD_QuickShow 1.0.1
```

### 添加其他维护者
```bash
pod trunk add-owner MBProgressHUD_QuickShow email@example.com
```

### 移除维护者
```bash
pod trunk remove-owner MBProgressHUD_QuickShow email@example.com
```

## 👤 CocoaPods 账号管理

### 账号信息
- **邮箱**: 2946779829@qq.com
- **名称**: Bfchen
- **注册时间**: 2026-01-17

### 在新电脑上使用账号

CocoaPods Trunk 通过**会话（Session）**来识别你的身份。换电脑后需要重新注册会话。

#### 步骤 1: 重新注册会话
```bash
pod trunk register 2946779829@qq.com 'Bfchen' --description='新电脑名称'
```

#### 步骤 2: 验证邮箱
你会收到一封验证邮件，点击邮件中的链接完成验证。

**注意**：
- 这不会创建新账号，而是为同一个账号添加新的会话
- 一个账号可以有多个会话（不同的电脑）
- 每个会话有效期是 1 年

### 查看所有会话
```bash
pod trunk me
```

会显示：
```
- Name:     Bfchen
- Email:    2946779829@qq.com
- Since:    January 17th, 01:39
- Pods:     MBProgressHUD_QuickShow
- Sessions:
  - January 17th, 01:39 - May 25th, 01:39. IP: 14.212.9.102 Description: MacBook Pro
  - January 18th, 10:00 - May 26th, 10:00. IP: xxx.xxx.xxx.xxx Description: 新电脑名称
```

### 清理过期会话
```bash
pod trunk me clean-sessions
```

这会删除所有过期的会话。

### 工作原理

CocoaPods Trunk 通过以下方式识别你：
1. **邮箱地址**：你的唯一标识
2. **会话 Token**：存储在本地 `~/.netrc` 文件中
3. **验证邮件**：每次新会话都需要邮件验证

### 安全建议
- 定期清理不用的会话
- 不要分享你的 `~/.netrc` 文件
- 如果担心安全，可以删除所有会话后重新注册

### 相关网站
- **你的 pod 页面**: https://cocoapods.org/pods/MBProgressHUD_QuickShow
- **CocoaPods 搜索**: https://cocoapods.org/
- **GitHub 仓库**: https://github.com/mirbf/MBProgressHUD-QuickShow

**注意**：CocoaPods 没有网页登录功能，所有管理操作都通过命令行完成。

## 📞 问题排查

### 问题 1: 验证失败 - libarclite 错误
**错误信息**: `SDK does not contain 'libarclite'`

**解决方案**: 使用 `--use-libraries` 参数

### 问题 2: 网络超时
**错误信息**: `Net::OpenTimeout`

**解决方案**: 重试命令，或检查网络连接

### 问题 3: 版本已存在
**错误信息**: `Unable to accept duplicate entry for: MBProgressHUD_QuickShow (1.0.1)`

**解决方案**: 更新版本号后重新发布

### 问题 4: 标签不存在
**错误信息**: `Unable to find the git tag`

**解决方案**: 确保已创建并推送对应的 Git 标签

## 📚 相关链接

- [CocoaPods 官方文档](https://guides.cocoapods.org/)
- [CocoaPods Trunk 指南](https://guides.cocoapods.org/making/getting-setup-with-trunk.html)
- [语义化版本规范](https://semver.org/lang/zh-CN/)
- [MBProgressHUD 官方仓库](https://github.com/jdg/MBProgressHUD)

## 📝 更新历史

### v1.0.1 (2026-01-17)
- 重命名 pod 为 MBProgressHUD_QuickShow（使用下划线）
- 修复 framework 名称和 pod 名称不一致的问题
- 更新文档和示例代码

### v1.0.0 (2026-01-17)
- 首次发布
- 添加 QuickShow 扩展方法
- 支持 toast 消息和 loading HUD
- 线程安全操作
- 支持 Objective-C 和 Swift
- iOS 12.0+ 支持
- Xcode 14-15 兼容性
