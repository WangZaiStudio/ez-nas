import 'package:ez_nas_frontend/preset/colors.dart';
import 'package:flutter/material.dart';
import '../../../l10n/gen/app_localizations.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.searchTitle,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 30),
            _SearchInput(localizations: localizations), // 自定义搜索输入框组件
          ],
        ),
      ),
    );
  }
}

class _SearchInput extends StatefulWidget {
  final AppLocalizations localizations;

  const _SearchInput({required this.localizations, super.key});

  @override
  State<_SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<_SearchInput> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // 页面加载时自动聚焦到 TextField
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus(); // 请求聚焦
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            focusNode: _focusNode, // 绑定 FocusNode
            decoration: InputDecoration(
              hintText: widget.localizations.homeSearchHint,
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: const Color(0xFFF5F8FD),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFFF5F8FD), // 默认边框颜色
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColor.primaryBlueberry, // 聚焦时边框颜色
                  width: 1.0,
                ),
              ),
            ),
            textInputAction: TextInputAction.search,
            onSubmitted: (query) {
              print('Search query: $query');
            },
          ),
        ),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(widget.localizations.searchBackButton, style: const TextStyle(color: AppColor.primaryBlueberry, fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }
}
