import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;
  final double borderRadius; // 新增的可选参数，设置圆角半径

  const ButtonWidget({
    super.key,
    required this.imagePath,
    required this.text,
    required this.onPressed,
    this.borderRadius = 18.0, // 默认圆角半径为 8.0
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        splashColor: Colors.grey.withOpacity(0.1),
        // 设置水波纹颜色
        highlightColor: Colors.grey.withOpacity(0.05),
        // 设置点击后的背景高亮颜色
        borderRadius: BorderRadius.circular(18),
        // 点击时的圆角边框
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start, // 子组件左对齐
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius), // 使用传入的圆角半径
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8), // 图片与文本之间的间距
              Text(
                text,
                textAlign: TextAlign.left, // 文本左对齐
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF051E56),
                ),
              ),
            ],
          ),
        ));
  }
}
