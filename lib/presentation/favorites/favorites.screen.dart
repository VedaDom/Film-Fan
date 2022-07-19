import 'package:filmfan/presentation/movies.service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../infrastructure/navigation/routes.dart';
import '../widgets/movie_item.dart';
import 'controllers/favorites.controller.dart';

class FavoritesScreen extends GetView<FavoritesController> {
  const FavoritesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF032541),
        title: const Text(
          "Favorites",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: GridView.builder(
        itemCount: Get.find<MoviesService>().favoriteMovies.length,
        controller: ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (180 / 279),
        ),
        itemBuilder: (context, index) {
          return MovieItem(
            movie: Get.find<MoviesService>().favoriteMovies[index],
            onTap: () {
              Get.toNamed(
                Routes.MOVIE_DETAILS,
                arguments: Get.find<MoviesService>().favoriteMovies[index].id,
              );
            },
          );
        },
      ),
    );
  }
}
