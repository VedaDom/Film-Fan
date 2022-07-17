import 'package:get/get.dart';

import '../../../../presentation/movies/controllers/movies.controller.dart';

class MoviesControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviesController>(
      () => MoviesController(),
    );
  }
}
