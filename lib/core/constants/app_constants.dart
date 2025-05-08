/// 应用程序全局常量类
/// 
/// 包含应用程序中使用的所有静态常量，如：
/// - 应用名称
/// - 分类列表
/// - 导航标签
/// 
/// 这些常量用于保持应用程序中的文本和配置的一致性
class AppConstants {
  // 应用名称
  static const String appName = '涂色星球';

  // 导航项
  static const List<String> categories = [
    'For you',
    'Oil Painting',
    'Mandala',
    'Fashion',
    'Vehicles',
    'Interiors',
    'Simple',
    'Buildings',
    'Scenery',
    'Flowers',
    'Animals',
    'People',
    'Food',
    'Holidays'
  ];

  // 底部导航项
  static const List<String> navLabels = [
    'Library',
    'Selection',
    'My Art',
    'Profile'
  ];
}
