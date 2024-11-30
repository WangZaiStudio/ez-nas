import 'package:ez_nas_frontend/preset/colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory, // 去除水波纹效果
          highlightColor: Colors.transparent,   // 去除高亮效果
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          selectedItemColor: AppColor.primaryBlueberry,
          unselectedItemColor: AppColor.unselectedGray,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12.0, // 选中时的字体大小
          unselectedFontSize: 12.0, // 未选中时的字体大小
          backgroundColor: const Color(0xFFF5F8FD),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.file_copy),
              label: '文件',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              label: '收藏',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '设置',
            ),
          ],
        ));
  }
}
