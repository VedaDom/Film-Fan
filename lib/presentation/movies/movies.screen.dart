import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/movies.controller.dart';

class MoviesScreen extends GetView<MoviesController> {
  const MoviesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoviesScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MoviesScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
