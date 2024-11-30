import 'package:ez_nas_frontend/pages/home/home.dart';
import 'package:ez_nas_frontend/pages/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:ez_nas_frontend/l10n/gen/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate, // 使用自动生成的委托
        GlobalMaterialLocalizations.delegate, // 提供 Material 组件的本地化支持
        GlobalWidgetsLocalizations.delegate,  // 提供 Widgets 的本地化支持
        GlobalCupertinoLocalizations.delegate, // 提供 Cupertino 风格的本地化支持
      ],
      supportedLocales: [
        Locale('zh'), // 中文
      ],
      locale: Locale('zh'), // 设置默认语言，可根据需求动态调整
      // home: OnboardingScreen(),
      home: HomeScreen(),
    );
  }
}