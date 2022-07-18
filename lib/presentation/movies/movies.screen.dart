import 'package:filmfan/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../widgets/movie_item.dart';
import 'controllers/movies.controller.dart';

class MoviesScreen extends GetView<MoviesController> {
  const MoviesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Film Fan - Now playing movies",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (_) {
              return [
                const PopupMenuItem(
                  value: "My favorites",
                  child: Text(
                    "My favorites",
                  ),
                ),
              ];
            },
            onSelected: (String value) {
              switch (value) {
                case "My favorites":
                  {
                    Get.toNamed(Routes.FAVORITES);
                  }
              }
            },
          ),
        ],
      ),
      body: controller.obx(
        (movies) => GridView.builder(
          controller: ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (180 / 279),
          ),
          itemBuilder: (context, index) {
            return MovieItem(
              movie: movies![index],
              onTap: () {
                Get.toNamed(
                  Routes.MOVIE_DETAILS,
                  arguments: movies[index].id,
                );
              },
            );
          },
        ),
        onLoading: const Center(child: CircularProgressIndicator()),
        onEmpty: const Text('No data found'),
        onError: (error) => Text(error ?? "Error occured!"),
      ),
    );
  }
}
