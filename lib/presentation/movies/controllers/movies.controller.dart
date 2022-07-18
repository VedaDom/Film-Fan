import 'package:filmfan/domain/entities/movie.dart';
import 'package:get/get.dart';

import '../../movies.service.dart';

class MoviesController extends GetxController with StateMixin<List<Movie>> {
  var isLoading = false.obs;

  @override
  void onInit() {
    getNowPlayingMovies();
    super.onInit();
  }

  Future<void> getNowPlayingMovies() async {
    change([], status: RxStatus.loading());
    final response = await Get.find<MoviesService>().getNowPlayingMovies();
    if (response.isRight) {
      if (response.right.isNotEmpty) {
        change(response.right, status: RxStatus.success());
      } else {
        change(response.right, status: RxStatus.empty());
      }
    } else {
      change([], status: RxStatus.error("Error occured, try again later."));
    }
  }
}
