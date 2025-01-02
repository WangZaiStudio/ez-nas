
import 'package:ez_nas_frontend/pages/home/pages/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../l10n/gen/app_localizations.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String? username = "null";

  @override
  void initState() {
    super.initState();
    fetchUsername();
  }

  Future<void> fetchUsername() async {
    final prefs = await SharedPreferences.getInstance();
    // 检查是否已存储用户名
    final storedUsername = prefs.getString('username');
    if (storedUsername != null) {
      // 如果用户名已存在，直接加载
      setState(() {
        username = storedUsername;
      });
    } else {
      // TODO: 需要从服务器中获取
      // 模拟异步获取用户名
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        setState(() {
          username = 'TedGillXD'; // 假设从服务器获取的用户名
        });
        // 保存到 SharedPreferences
        prefs.setString('username', username!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final platform = Theme.of(context).platform; // 检测当前平台

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.homeTitle + username!,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: localizations.homeSearchHint,
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: const Color(0xFFF5F8FD),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFFF5F8FD), // 默认边框颜色
                  width: 1.0,
                ),
              ),
            ),
            enabled: true,
            showCursor: false,
            readOnly: true,
            onTap: () {
              // 跳转到一个搜索界面而不是就在这里输入
              if(platform == TargetPlatform.iOS) {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => const SearchPage()));
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
              }
            },
          ),
        ],
      ),
    );
  }
}
