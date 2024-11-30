import 'package:flutter/material.dart';

class FilePage extends StatefulWidget {
  const FilePage({super.key});

  @override
  State<StatefulWidget> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(preferredSize: const Size.fromHeight(20.0),
          child: AppBar(backgroundColor: Colors.white,)),
      body: const Center(child: Text("File"),),
    );
  }

}

