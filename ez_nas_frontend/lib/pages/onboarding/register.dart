
import 'package:ez_nas_frontend/l10n/gen/app_localizations.dart';
import 'package:ez_nas_frontend/pages/onboarding/login.dart';
import 'package:flutter/material.dart';

import '../../components/header.dart';
import '../../components/labeled_text_field.dart';
import '../../preset/colors.dart';

class RegisterScreen extends StatelessWidget{
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return PopScope(
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        // 在返回前执行逻辑
        FocusScope.of(context).unfocus(); // 隐藏键盘
        // 返回结果后，执行默认的返回操作
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true, // 启用键盘适配
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              FocusScope.of(context).unfocus(); // 隐藏键盘
              Navigator.of(context).pop(); // 返回上一页
            },
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50), // 调整顶部间距
                      HeaderWidget(
                        title: localizations.registerHeaderTitle,
                        description: localizations.registerHeaderDesc,
                      ),
                      const SizedBox(height: 40), // 调整Header和内容的间距

                      // 服务器地址部分
                      LabeledTextField(
                        title: localizations.registerServerAddrTitle,
                        hintText: localizations.registerServerAddrDesc,
                      ),
                      const SizedBox(height: 24),

                      // 邮箱部分
                      LabeledTextField(
                        title: localizations.registerUserNameTitle,
                        hintText: localizations.registerUserNameDesc,
                      ),
                      const SizedBox(height: 24),

                      // 密码部分
                      LabeledTextField(
                        title: localizations.registerPasswordTitle,
                        hintText: localizations.registerPasswordDesc,
                        isPassword: true,
                      ),
                      const SizedBox(height: 24),

                      // 跳转到登录界面的
                      const AccountExistWidget(),
                      const SizedBox(height: 24,),

                      // 注册按钮
                      const RegisterButton()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

// 忘记密码链接组件
class AccountExistWidget extends StatelessWidget {
  const AccountExistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(localizations.registerAccountExistDesc),
        TextButton(
          onPressed: () {
            // 跳转到登录界面
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => route.isFirst);
          },
          child: Text(
            localizations.registerAccountExistButton,
            style: const TextStyle(color: AppColor.primaryBlueberry),
          ),
        ),
      ],
    );
  }
}

// 注册按钮组件
class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // TODO: 注册操作
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryBlueberry,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          localizations.registerButton,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}