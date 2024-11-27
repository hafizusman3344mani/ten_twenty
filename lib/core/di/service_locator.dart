import 'package:get_it/get_it.dart';
import 'package:ten_twenty/modules/home/respository/home_repository.dart';

import '../../modules/movieDetail/repository/movie_detail_repository.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;

void setupLocator() async {
  /// ==================== Networking ===========================
  sl.registerLazySingleton<DioClient>(
      () => DioClient(baseUrl: 'https://api.themoviedb.org/3/movie/'));

  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepository(dioClient: sl()));
  sl.registerLazySingleton<MovieDetailRepository>(
      () => MovieDetailRepository(dioClient: sl()));
}
