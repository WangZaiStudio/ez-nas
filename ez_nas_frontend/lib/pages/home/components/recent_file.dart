import 'package:ez_nas_frontend/components/single_folder.dart';
import 'package:flutter/material.dart';

import '../../../l10n/gen/app_localizations.dart';

class RecentFile extends StatefulWidget {
  const RecentFile({super.key});

  @override
  State<RecentFile> createState() => _RecentFileState();
}

class _RecentFileState extends State<RecentFile> {
  List<Map<String, String>> recentFiles = [];

  @override
  void initState() {
    super.initState();
    _fetchRecentFiles();
  }

  void _fetchRecentFiles() async {
    // TODO: 通过http从服务器请求

  }

  @override
  void dispose() {
    // 清理异步操作或监听器
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 子元素左对齐
        children: [
          // 顶部的标题
          Text(
            localizations.homeRecentFileTitle,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            ),
          ),

          // ListView
          const SizedBox(height: 12),
          const Column(
            children: [
              SingleFolderWidget(title: "folder1", source: "source", additionalInfo: "additional info", fileId: "1"),
            ],
          ),
        ],
      ),
    );
  }
}
