import 'package:get/get.dart';

import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'bindings/controllers/favorites.controller.binding.dart';
import 'routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.FAVORITES,
      page: () => const FavoritesScreen(),
      binding: FavoritesControllerBinding(),
    ),
    GetPage(
      name: Routes.MOVIES,
      page: () => const MoviesScreen(),
      binding: MoviesControllerBinding(),
    ),
    GetPage(
      name: Routes.MOVIE_DETAILS,
      page: () => const MovieDetailsScreen(),
      binding: MovieDetailsControllerBinding(),
    ),
  ];
}
