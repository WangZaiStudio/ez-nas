import 'package:flutter/material.dart';
import 'package:ez_nas_frontend/components/labeled_text_field.dart';
import 'package:ez_nas_frontend/components/header.dart';
import 'package:ez_nas_frontend/preset/colors.dart';
import 'package:ez_nas_frontend/l10n/gen/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            // 点击空白处隐藏键盘
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
                        title: localizations.loginHeaderTitle,
                        description: localizations.loginHeaderDesc,
                      ),
                      const SizedBox(height: 40), // 调整Header和内容的间距
                      LabeledTextField(
                        title: localizations.loginServerAddrTitle,
                        hintText: localizations.loginServerAddrDesc,
                      ),
                      const SizedBox(height: 24),
                      LabeledTextField(
                        title: localizations.loginUserNameTitle,
                        hintText: localizations.loginUserNameDesc,
                      ),
                      const SizedBox(height: 24),
                      LabeledTextField(
                        title: localizations.loginPasswordTitle,
                        hintText: localizations.loginPasswordDesc,
                        isPassword: true,
                      ),
                      const SizedBox(height: 24),
                      const ForgotPasswordWidget(),
                      const RegisterLinkWidget(),
                      const SizedBox(height: 24),
                      const LoginButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 忘记密码链接组件
class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(localizations.loginForgetDesc),
        TextButton(
          onPressed: () {
            // 忘记密码操作
          },
          child: Text(
            localizations.loginForgetButton,
            style: const TextStyle(color: AppColor.primaryBlueberry),
          ),
        ),
      ],
    );
  }
}

// 注册链接组件
class RegisterLinkWidget extends StatelessWidget {
  const RegisterLinkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(localizations.loginRegDesc),
        TextButton(
          onPressed: () {
            // TODO: 注册操作
          },
          child: Text(
            localizations.loginRegButton,
            style: const TextStyle(color: AppColor.primaryBlueberry),
          ),
        ),
      ],
    );
  }
}

// 登录按钮组件
class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // TODO: 登录操作
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryBlueberry,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          localizations.loginButton,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
