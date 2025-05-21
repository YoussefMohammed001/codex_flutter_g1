import 'package:codex_flutter_g1/features/home/domain/entities/top_movies_entitiy.dart';
import 'package:either_dart/either.dart';

abstract class TopMoviesRepository {
  Future<Either<String,TopMoviesResultEntity>> getTopMovies({required int page });
}