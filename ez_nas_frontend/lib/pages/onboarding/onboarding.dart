import 'package:flutter/material.dart';
import 'package:ez_nas_frontend/preset/colors.dart';
import 'package:ez_nas_frontend/pages/onboarding/login.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 57, 168, 224),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonSection(), // 将 ButtonSection 放在底部
          ),
        ],
      ),
    );
  }
}

// 按钮部分组件
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0, bottom: 80.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 自适应内容高度
        children: [
          ElevatedButton(
            onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen())); },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              backgroundColor: Colors.white,
              side: const BorderSide(color: AppColor.primaryBlueberry),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              '登录',
              style: TextStyle(
                color: AppColor.primaryBlueberry,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              backgroundColor: AppColor.primaryBlueberry,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              '注册',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}