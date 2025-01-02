
import 'dart:convert';

import 'package:ez_nas_frontend/pages/home/components/category.dart';
import 'package:ez_nas_frontend/pages/home/components/header.dart';
import 'package:ez_nas_frontend/pages/home/components/recent_file.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  // TODO: 从服务器上获取数据
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(80.0), child: SizedBox(width: double.infinity, height: 80.0,)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            SizedBox(height: 20,),
            // 三种文件分类栏：图片、视频、文档
            CategoryBlock(),
            SizedBox(height: 20,),
            // 最近保存
            RecentFile(),
          ],
        ),
      ),
    );
  }

}