# ColorPlanet

一个基于Flutter的绘画应用程序，提供丰富的绘画工具和颜色管理功能。

## 项目结构

### Core 目录

核心功能组件、工具类和常量定义。

- `constants/`: 存放全局常量
  - `app_constants.dart`: 应用程序常量
  - `color_constants.dart`: 颜色常量
  - `text_constants.dart`: 文本常量
  
- `utils/`: 工具类
  - `color_utils.dart`: 颜色处理工具
  - `file_utils.dart`: 文件操作工具
  - `canvas_utils.dart`: 画布操作工具
  
- `config/`: 配置文件
  - `app_config.dart`: 应用程序配置
  - `theme_config.dart`: 主题配置

- `extensions/`: 扩展方法
  - `color_extensions.dart`: 颜色相关扩展
  - `string_extensions.dart`: 字符串扩展

### Features 目录

主要功能模块，采用特性驱动开发（Feature-Driven Development）的方式组织代码。

- `canvas/`: 画布功能模块
  - `screens/`: 画布相关页面
  - `widgets/`: 画布专用组件
  - `models/`: 画布数据模型
  - `controllers/`: 画布控制器
  
- `color_picker/`: 颜色选择器模块
  - `screens/`: 颜色选择相关页面
  - `widgets/`: 颜色选择器组件
  - `models/`: 颜色数据模型
  - `controllers/`: 颜色选择控制器

- `tools/`: 绘画工具模块
  - `screens/`: 工具选择页面
  - `widgets/`: 工具相关组件
  - `models/`: 工具数据模型
  - `controllers/`: 工具控制器

- `gallery/`: 作品画廊模块
  - `screens/`: 画廊展示页面
  - `widgets/`: 画廊相关组件
  - `models/`: 画廊数据模型
  - `controllers/`: 画廊控制器

### Models 目录

数据模型定义，用于表示和管理应用程序中的各种数据结构。

- `canvas/`: 画布相关模型
  - `canvas_model.dart`: 画布数据模型
  - `stroke_model.dart`: 笔画数据模型
  - `layer_model.dart`: 图层数据模型

- `color/`: 颜色相关模型
  - `color_model.dart`: 颜色数据模型
  - `palette_model.dart`: 调色板数据模型
  - `color_history_model.dart`: 颜色历史记录模型

- `tool/`: 工具相关模型
  - `tool_model.dart`: 工具数据模型
  - `brush_model.dart`: 画笔数据模型
  - `eraser_model.dart`: 橡皮擦数据模型

- `user/`: 用户相关模型
  - `settings_model.dart`: 用户设置模型
  - `preferences_model.dart`: 用户偏好模型

### Services 目录

各种服务实现，负责处理数据持久化、网络请求、文件操作等功能。

- `storage/`: 存储服务
  - `local_storage_service.dart`: 本地存储服务
  - `file_storage_service.dart`: 文件存储服务
  
- `canvas/`: 画布服务
  - `canvas_service.dart`: 画布操作服务
  - `drawing_service.dart`: 绘画功能服务
  
- `export/`: 导出服务
  - `image_export_service.dart`: 图片导出服务
  - `share_service.dart`: 分享服务

- `settings/`: 设置服务
  - `app_settings_service.dart`: 应用设置服务
  - `theme_service.dart`: 主题设置服务

### Widgets 目录

可在整个应用程序中复用的UI组件。

- `buttons/`: 按钮组件
  - `color_button.dart`: 颜色选择按钮
  - `tool_button.dart`: 工具选择按钮
  - `action_button.dart`: 操作按钮

- `dialogs/`: 对话框组件
  - `color_picker_dialog.dart`: 颜色选择对话框
  - `save_dialog.dart`: 保存确认对话框
  - `settings_dialog.dart`: 设置对话框

- `cards/`: 卡片组件
  - `color_card.dart`: 颜色展示卡片
  - `tool_card.dart`: 工具展示卡片
  - `gallery_card.dart`: 画廊作品卡片

- `inputs/`: 输入组件
  - `color_input.dart`: 颜色输入框
  - `text_input.dart`: 文本输入框
  - `number_input.dart`: 数字输入框

## 开发规范

1. 命名规范：
   - 文件名使用小写字母，用下划线连接
   - 类名使用大驼峰命名法
   - 方法和变量使用小驼峰命名法

2. 代码规范：
   - 所有工具类方法应该有清晰的文档注释
   - 常量类中的常量应该是final或const
   - 工具类方法尽量保持纯函数特性

3. 开发建议：
   - 遵循SOLID原则
   - 编写单元测试和集成测试
   - 注重代码复用和维护性
   - 保持目录结构的一致性
   - 避免模块间的循环依赖

## 开始使用

1. 确保已安装Flutter开发环境
2. 克隆项目到本地
3. 运行 `flutter pub get` 安装依赖
4. 运行 `flutter run` 启动应用

## 相关资源

- [Flutter官方文档](https://docs.flutter.dev/)
- [Dart官方文档](https://dart.dev/guides)
- [Material Design指南](https://material.io/design)
