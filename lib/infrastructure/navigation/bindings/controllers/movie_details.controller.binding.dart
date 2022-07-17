import 'package:get/get.dart';

import '../../../../presentation/movie_details/controllers/movie_details.controller.dart';

class MovieDetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailsController>(
      () => MovieDetailsController(),
    );
  }
}
