import 'package:filmfan/infrastructure/navigation/routes.dart';
import 'package:filmfan/presentation/widgets/movie_item.dart';
import 'package:filmfan/presentation/widgets/rating.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'controllers/movie_details.controller.dart';

class MovieDetailsScreen extends GetView<MovieDetailsController> {
  const MovieDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF032541),
        title: const Text(
          "Movie details",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: controller.obx(
        (movie) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 282,
                child: Stack(
                  children: [
                    Image.network(
                      "https://image.tmdb.org/t/p/w500/${movie!.backdropPath}",
                      height: 270,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 16,
                      child: Rating(
                        value: movie.voteAverage,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  right: 16,
                  left: 16,
                  bottom: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          movie.title,
                          maxLines: 1,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                        Obx(
                          () => IconButton(
                            onPressed: () {
                              controller.addToFavorite(movie);
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: controller.isFavorite.value
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                    Obx(
                      () => RatingBar.builder(
                        initialRating: controller.ratings.value,
                        minRating: 1,
                        itemSize: 32,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Theme.of(context).primaryColor,
                        ),
                        onRatingUpdate: (rating) {
                          controller.rateMovie(movie, rating);
                        },
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      movie.releaseDate,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      movie.genres!.map((item) => item.name).join(", "),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movie.overview,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Actors",
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  itemCount: controller.actors.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 16);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://image.tmdb.org/t/p/w200/${controller.actors[index].profilePath}",
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: 80,
                          child: Text(
                            controller.actors[index].name,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          child: Text(
                            controller.actors[index].character,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 32,
                  right: 16,
                  left: 16,
                ),
                child: Text(
                  "Similar movies",
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.similarMovies.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (180 / 279),
                ),
                itemBuilder: (context, index) {
                  return MovieItem(
                    movie: controller.similarMovies[index],
                    onTap: () {
                      Get.offAndToNamed(
                        Routes.MOVIE_DETAILS,
                        arguments: controller.similarMovies[index].id,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        onLoading: const Center(
          child: CircularProgressIndicator(
            color: Color(0xFF032541),
          ),
        ),
        onEmpty: const Text('No data found'),
        onError: (error) => Text(error ?? "Error occured!"),
      ),
    );
  }
}
