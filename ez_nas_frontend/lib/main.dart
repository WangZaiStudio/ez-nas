import 'dart:io';
import 'package:ez_nas_frontend/pages/home/home.dart';
import 'package:ez_nas_frontend/pages/home/tablet_home.dart';
import 'package:ez_nas_frontend/pages/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ez_nas_frontend/l10n/gen/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 返回一个平台适配的 App
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final isWideScreen = constraints.maxWidth > 600; // 判断是否为宽屏（如平板或网页）
        if (Platform.isIOS) {
          // iOS 平台使用 CupertinoApp
          return CupertinoApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('zh'),
            ],
            locale: const Locale('zh'),
            home: isWideScreen ? const TabletHomeScreen() : const HomeScreen(),
          );
        } else {
          // 其他平台使用 MaterialApp
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('zh'),
            ],
            locale: const Locale('zh'),
            home: isWideScreen ? const TabletHomeScreen() : const HomeScreen(),
          );
        }
      },
    );
  }
}