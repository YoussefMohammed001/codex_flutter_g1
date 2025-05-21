import 'package:codex_flutter_g1/features/home/data/data_source/get_movies_api.dart';
import 'package:codex_flutter_g1/features/home/data/repository/top_movies_repository_imp.dart';
import 'package:codex_flutter_g1/features/home/domain/repository/top_movies_repository.dart';
import 'package:codex_flutter_g1/features/home/domain/usecase/top_movies_use_case.dart';
import 'package:get_it/get_it.dart';

final  getIt = GetIt.instance;

Future<void> setupGetIt() async{
  // TOP MOVIES
  getIt.registerLazySingleton<TopMoviesUsecase>(() => TopMoviesUsecase(topMoviesRepository:getIt()));
  getIt.registerLazySingleton<TopMoviesRepository>(() => TopMoviesRepositoryImp(topMoviesApi:getIt()));
  getIt.registerLazySingleton<TopMoviesApi>(() => TopMoviesApiImp());

}


