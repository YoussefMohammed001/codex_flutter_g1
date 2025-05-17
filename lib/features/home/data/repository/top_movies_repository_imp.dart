import 'package:codex_flutter_g1/features/home/data/data_source/get_movies_api.dart';
import 'package:codex_flutter_g1/features/home/domain/entities/top_movies_entitiy.dart';
import 'package:codex_flutter_g1/features/home/domain/repository/top_movies_repository.dart';
import 'package:either_dart/src/either.dart';

class TopMoviesRepositoryImp implements TopMoviesRepository{
  final TopMoviesApi topMoviesApi;
  TopMoviesRepositoryImp({required this.topMoviesApi});

  @override
  Future<Either<String, List<TopMoviesEntity>>> getTopMovies() async {
    final result = await topMoviesApi.getTopMovies();
    return result.fold((l){
      return Left(l);
    }, (r){
      return Right(
        r.toEntity()
      );
    });

  }



}