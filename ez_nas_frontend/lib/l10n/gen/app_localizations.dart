import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('zh')];

  /// No description provided for @appVersion.
  ///
  /// In zh, this message translates to:
  /// **'版本号: {version}'**
  String appVersion(String version);

  /// No description provided for @loginHeaderTitle.
  ///
  /// In zh, this message translates to:
  /// **'欢迎回来'**
  String get loginHeaderTitle;

  /// No description provided for @loginHeaderDesc.
  ///
  /// In zh, this message translates to:
  /// **'登录以访问您的云端文件'**
  String get loginHeaderDesc;

  /// No description provided for @loginServerAddrTitle.
  ///
  /// In zh, this message translates to:
  /// **'服务器地址'**
  String get loginServerAddrTitle;

  /// No description provided for @loginServerAddrDesc.
  ///
  /// In zh, this message translates to:
  /// **'输入你的服务器地址'**
  String get loginServerAddrDesc;

  /// No description provided for @loginUserNameTitle.
  ///
  /// In zh, this message translates to:
  /// **'用户名'**
  String get loginUserNameTitle;

  /// No description provided for @loginUserNameDesc.
  ///
  /// In zh, this message translates to:
  /// **'请输入你注册时所用的用户名'**
  String get loginUserNameDesc;

  /// No description provided for @loginPasswordTitle.
  ///
  /// In zh, this message translates to:
  /// **'密码'**
  String get loginPasswordTitle;

  /// No description provided for @loginPasswordDesc.
  ///
  /// In zh, this message translates to:
  /// **'请输入密码'**
  String get loginPasswordDesc;

  /// No description provided for @loginForgetDesc.
  ///
  /// In zh, this message translates to:
  /// **'忘记密码了？'**
  String get loginForgetDesc;

  /// No description provided for @loginForgetButton.
  ///
  /// In zh, this message translates to:
  /// **'重置密码'**
  String get loginForgetButton;

  /// No description provided for @loginRegDesc.
  ///
  /// In zh, this message translates to:
  /// **'没有账号？'**
  String get loginRegDesc;

  /// No description provided for @loginRegButton.
  ///
  /// In zh, this message translates to:
  /// **'注册新账号'**
  String get loginRegButton;

  /// No description provided for @loginButton.
  ///
  /// In zh, this message translates to:
  /// **'登录'**
  String get loginButton;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
