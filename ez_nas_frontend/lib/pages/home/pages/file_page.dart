import 'package:ez_nas_frontend/l10n/gen/app_localizations.dart';
import 'package:ez_nas_frontend/pages/home/pages/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../preset/colors.dart';

class FilePage extends StatelessWidget {
  const FilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(20.0),
          child: AppBar(
            backgroundColor: Colors.white,
          )),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 头部的title和搜索框
            Text(
              "Files",
              style: const TextStyle(fontSize: 24, color: AppColor.textColor),
            ),
            SizedBox(height: 20),

            // 文件目录
            FileList(),
          ],
        ),
      ),
    );
  }
}

class FileList extends StatefulWidget {
  const FileList({super.key});

  @override
  State<StatefulWidget> createState() => _FileListState();
}

class _FileListState extends State<FileList> {
  // TODO: 从服务器获取到文件树（或者顶层的文件目录）
  @override
  void initState() {
    super.initState();

    // TODO: 获取list
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final platform = Theme.of(context).platform; // 检测当前平台

    return SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: localizations.homeSearchHint,
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: const Color(0xFFF5F8FD),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFFF5F8FD), // 默认边框颜色
                  width: 1.0,
                ),
              ),
            ),
            enabled: true,
            showCursor: false,
            readOnly: true,
            onTap: () {
              // 跳转到一个搜索界面而不是就在这里输入
              if (platform == TargetPlatform.iOS) {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const SearchPage()));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage()));
              }
            },
          ),

          // TODO: 根据获取到的生成文件和文件夹

        ],
      ),
    );
  }
}
