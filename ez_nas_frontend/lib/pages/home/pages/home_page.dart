
import 'dart:convert';

import 'package:ez_nas_frontend/pages/home/components/category.dart';
import 'package:ez_nas_frontend/pages/home/components/header.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(preferredSize: const Size.fromHeight(20.0), child: AppBar(backgroundColor: Colors.white,)),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            SizedBox(height: 20,),
            // TODO: 四种文件分类栏：图片、视频、文档、音频
            CategoryBlock(),
            SizedBox(height: 20,),
            // TODO：最近保存
            SizedBox(height: 20,),
            // TODO：标签文件
          ],
        ),
      ),
    );
  }

}