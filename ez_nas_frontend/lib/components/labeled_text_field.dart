import 'package:flutter/material.dart';

// 通用的带标题的输入框组件
class LabeledTextField extends StatefulWidget {
  final String title;
  final String hintText;
  final bool isPassword;

  const LabeledTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  LabeledTextFieldState createState() {
    return LabeledTextFieldState();
  }
}

class LabeledTextFieldState extends State<LabeledTextField> {
  bool _obscureText = true; // 用于控制密码的显示和隐藏

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword; // 初始化为密码模式
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: widget.isPassword ? _obscureText : false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText; // 切换密码的显示状态
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}