import 'package:flutter/material.dart';
import 'button.dart'; // 确保导入了 ButtonWidget

class CategoryBlock extends StatelessWidget {
  const CategoryBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ButtonWidget(
              imagePath: 'assets/images/Images.png',
              text: '图片',
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ButtonWidget(
              imagePath: 'assets/images/Videos.png',
              text: '视频',
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ButtonWidget(
              imagePath: 'assets/images/Documents.png',
              text: '文档',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
