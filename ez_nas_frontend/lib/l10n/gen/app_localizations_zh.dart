import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String appVersion(String version) {
    return '版本号: $version';
  }

  @override
  String get loginHeaderTitle => '欢迎回来';

  @override
  String get loginHeaderDesc => '登录以访问您的云端文件';

  @override
  String get loginServerAddrTitle => '服务器地址';

  @override
  String get loginServerAddrDesc => '输入你的服务器地址';

  @override
  String get loginUserNameTitle => '用户名';

  @override
  String get loginUserNameDesc => '请输入你注册时所用的用户名';

  @override
  String get loginPasswordTitle => '密码';

  @override
  String get loginPasswordDesc => '请输入密码';

  @override
  String get loginForgetDesc => '忘记密码了？';

  @override
  String get loginForgetButton => '重置密码';

  @override
  String get loginRegDesc => '没有账号？';

  @override
  String get loginRegButton => '注册新账号';

  @override
  String get loginButton => '登录';
}
