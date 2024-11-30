import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<StatefulWidget> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(preferredSize: const Size.fromHeight(20.0),
            child: AppBar(backgroundColor: Colors.white,)),
        body: const Center(child: Text("Favorite"),),
    );
  }

}

