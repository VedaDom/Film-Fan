import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/movie_details.controller.dart';

class MovieDetailsScreen extends GetView<MovieDetailsController> {
  const MovieDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MovieDetailsScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MovieDetailsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
