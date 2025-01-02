import 'package:flutter/material.dart';

import '../../../l10n/gen/app_localizations.dart';
import '../../../preset/colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String avatarUrl = "none";

  @override
  void initState() {
    super.initState();
    // TODO: 获取用户信息
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: SizedBox(
            width: double.infinity,
            height: 80.0,
          )),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.settingTitle,
              style: const TextStyle(fontSize: 24, color: AppColor.textColor),
            ),
            const SizedBox(
              height: 30,
            ),
            // 用户卡片
            Row(
              children: [
                ClipOval(
                  child: Image.network(
                    avatarUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        "assets/images/defaultavatar.png",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.textColor,
                        ),
                        maxLines: 1,
                      ),
                      SizedBox(height: 4),
                      Text(
                        "email@domain.com",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: AppColor.subTextColor,
                        ),
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                // EditProfile按钮
                IconButton(
                    onPressed: () => {},
                    icon: const Icon(
                      Icons.edit,
                      color: Color(0xFF526286),
                    ))
              ],
            ),

            // TODO: 设置栏
            const SizedBox(
              height: 40,
            ),
            const DataSettingsWidget(),
            const SizedBox(
              height: 40,
            ),
            const MoreSettingsWidget(),

            // 退出登录按钮
            Align(
              alignment: Alignment.center,
              child: TextButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(
                      const Color(0xFFFE5454).withOpacity(0.1), // 修改水波纹颜色
                    ),
                  ),
                  onPressed: () => {
                    // TODO: 退出登录，退回到onboarding
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                    child: Text(
                      localizations.settingLogout,
                      style: const TextStyle(color: Color(0xFFFE5454), fontSize: 14),
                    )),
                  )
            )
          ],
        ),
      )),
    );
  }
}

class SettingOptionWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final GestureTapCallback onTapFunction;

  const SettingOptionWidget(
      {super.key,
      required this.title,
      required this.iconPath,
      required this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTapFunction,
        splashColor: Colors.grey.withOpacity(0.1),
        // 设置水波纹颜色
        highlightColor: Colors.grey.withOpacity(0.05),
        // 设置点击后的背景高亮颜色
        borderRadius: BorderRadius.circular(8),
        // 点击时的圆角边框
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
              child: Row(
                children: [
                  Image.asset(
                    iconPath,
                    height: 32,
                    width: 32,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Text(
                    title,
                    style: const TextStyle(
                        color: AppColor.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  )),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Image.asset(
                    "assets/images/icons/optionIndicator.png",
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                width: double.infinity,
                height: 1,
                color: const Color(0xFFEEF2F9),
              ),
            )
          ],
        ));
  }
}

class DataSettingsWidget extends StatelessWidget {
  const DataSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SizedBox(
        width: double.infinity,
        child: Expanded(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.settingCategoryDataTitle,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.textColor),
            ),
            const SizedBox(height: 10,),
            SettingOptionWidget(
              title: localizations.settingDownloadedFiles,
              iconPath: "assets/images/icons/downloadedFiles.png",
              onTapFunction: () => {
                // TODO: 打开下载文件界面
              },
            ),
            SettingOptionWidget(
              title: localizations.settingSpaceUsage,
              iconPath: "assets/images/icons/spaceUsage.png",
              onTapFunction: () => {
                // TODO: 打开容量使用界面
              },
            ),
          ],
        )));
  }
}

class MoreSettingsWidget extends StatelessWidget {
  const MoreSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SizedBox(
      width: double.infinity,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.settingCategoryMoreTitle,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.textColor),
            ),
            const SizedBox(height: 10,),
            // 选项
            SettingOptionWidget(title: localizations.settingAboutUs, iconPath: "assets/images/icons/aboutUs.png", onTapFunction: () => {
              // TODO：打开关于我们的界面
            }),

            // 距离下面登出按钮的距离
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
