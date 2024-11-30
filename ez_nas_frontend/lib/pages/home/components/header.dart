import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String? username;

  @override
  void initState() {
    super.initState();
    fetchUsername();
  }

  Future<void> fetchUsername() async {
    // TODO：异步获取用户名
    // 模拟异步获取用户名，例如从网络请求
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {
        username = 'TedGillXD'; // 假设获取到的用户名
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, ${username ?? 'Guest'}',
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          TextField(
            decoration: InputDecoration(
              hintText: '搜索你的文件',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: const Color(0xFFF5F8FD),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            enabled: false,
            onTap: () {
              // TODO: 跳转到一个搜索界面而不是就在这里输入

            },
          ),
        ],
      ),
    );
  }
}
