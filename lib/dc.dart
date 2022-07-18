import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';
import 'data/datasources/movies_remote_data_source.dart';
import 'data/repositories/movies_repository_impl.dart';
import 'domain/repositories/movies_repository.dart';
import 'domain/usecases/add_movie_to_favorite_usecase.dart';
import 'domain/usecases/get_favorite_movies_usecase.dart';
import 'domain/usecases/get_movie_actors_usecase.dart';
import 'domain/usecases/get_movie_details_usecase.dart';
import 'domain/usecases/get_now_playing_movies_usecase.dart';
import 'domain/usecases/get_rated_movies_usecase.dart';
import 'domain/usecases/get_similar_movies_usecase.dart';
import 'domain/usecases/rate_movie_usecase.dart';
import 'presentation/movies.service.dart';

Future<void> init() async {
  await GetStorage.init();
  Get.lazyPut(() => GetStorage());
  Get.lazyPut(() => InternetConnectionChecker());
  Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl(Get.find()));

  Get.lazyPut<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSourceImpl(),
  );

  Get.lazyPut<MoviesRepository>(
    () => MoviesRepositoryImpl(
      networkInfo: Get.find(),
      remoteDataSource: Get.find(),
    ),
  );

  Get.lazyPut(() => GetNowPlayingMoviesUseCase(Get.find()));
  Get.lazyPut(() => GetRatedMoviesUseCase(Get.find()));
  Get.lazyPut(() => GetSimilarMoviesUseCase(Get.find()));
  Get.lazyPut(() => GetMovieDetailsUseCase(Get.find()));
  Get.lazyPut(() => RateMovieUseCase(Get.find()));
  Get.lazyPut(() => AddMovieToFavoriteUseCase(Get.find()));
  Get.lazyPut(() => GetMovieActorsUseCase(Get.find()));
  Get.lazyPut(() => GetFavoriteMoviesUseCase(Get.find()));

  Get.lazyPut(
    () => MoviesService(
      addMovieToFavoritesUseCase: Get.find(),
      getFavoriteMoviesUseCase: Get.find(),
      getMovieActorsUseCase: Get.find(),
      getMovieDetailsUseCase: Get.find(),
      getNowPlayingMoviesUseCase: Get.find(),
      getRatedMoviesUseCase: Get.find(),
      getSimilarMoviesUseCase: Get.find(),
      rateMovieUseCase: Get.find(),
    ),
  );
}
