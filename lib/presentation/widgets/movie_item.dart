import 'package:filmfan/domain/entities/movie.dart';
import 'package:filmfan/presentation/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;
  const MovieItem({Key? key, required this.onTap, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 160,
                  height: 214,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        Constants.BASE_IMAGE_URL + movie.posterPath,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMMd('en_US').format(
                          DateTime.parse(movie.releaseDate),
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 43,
              left: 16,
              child: Rating(
                value: movie.voteAverage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
