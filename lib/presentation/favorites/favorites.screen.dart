import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/favorites.controller.dart';

class FavoritesScreen extends GetView<FavoritesController> {
  const FavoritesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavoritesScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FavoritesScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
