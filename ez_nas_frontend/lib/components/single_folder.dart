import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../l10n/gen/app_localizations.dart';
import '../preset/colors.dart';

class SingleFolderWidget extends StatelessWidget {
  final String title;
  final String source;
  final String additionalInfo;
  final String fileId;

  const SingleFolderWidget({
    super.key,
    required this.title,
    required this.source,
    required this.additionalInfo,
    required this.fileId,
  });

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform; // 检测当前平台
    final localizations = AppLocalizations.of(context)!;

    return Material(
      color: Colors.transparent, // 保证背景透明
      child: InkWell(
        onTap: () {
          // TODO: 打开文件夹

        },
        splashColor: Colors.grey.withOpacity(0.1), // 设置水波纹颜色
        highlightColor: Colors.grey.withOpacity(0.05), // 设置点击后的背景高亮颜色
        borderRadius: BorderRadius.circular(8), // 点击时的圆角边框
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 图片部分
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Folder.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              // 文件内容部分
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: AppColor.textColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      source,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColor.subTextColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      additionalInfo,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColor.subTextColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // 平台特定的更多选项按钮
              platform == TargetPlatform.iOS
                  ? CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(
                  Icons.more_horiz,
                  color: Color(0xFF526286),
                ),
                onPressed: () {
                  _showCupertinoMenu(context);
                },
              )
                  : PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'Delete') {
                    _deleteFolder(fileId: fileId);
                  } else if (value == 'Download') {
                    _downloadFolder(fileId: fileId);
                  } else if (value == 'Bookmark') {
                    _bookmarkFolder(fileId: fileId);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'Delete',
                    child: Text(localizations.singleFileDelete),
                  ),
                  PopupMenuItem(
                    value: 'Download',
                    child: Text(localizations.singleFileDownload),
                  ),
                  PopupMenuItem(
                    value: 'Bookmark',
                    child: Text(localizations.singleFileBookmark),
                  ),
                ],
                icon: const Icon(
                  Icons.more_horiz,
                  color: Color(0xFF526286),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCupertinoMenu(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                _deleteFolder(fileId: fileId);
              },
              child: Text(
                localizations.singleFileDelete,
                style: const TextStyle(color: Colors.red),
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                _downloadFolder(fileId: fileId);
              },
              child: Text(localizations.singleFileDownload),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                _bookmarkFolder(fileId: fileId);
              },
              child: Text(localizations.singleFileBookmark),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(localizations.singleFileCancel),
          ),
        );
      },
    );
  }

  static void _downloadFolder({required String fileId}) async {
    // TODO: 下载文件夹中的所有文件
  }

  static void _deleteFolder({required String fileId}) async {
    // TODO: 删除文件夹
  }

  static void _bookmarkFolder({required String fileId}) async {
    // TODO: 收藏文件夹
  }
}
