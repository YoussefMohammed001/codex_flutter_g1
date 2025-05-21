import 'package:codex_flutter_g1/features/home/domain/entities/top_movies_entitiy.dart';
import 'package:codex_flutter_g1/features/home/domain/repository/top_movies_repository.dart';
import 'package:either_dart/either.dart';

class TopMoviesUsecase{
  final TopMoviesRepository topMoviesRepository;
  TopMoviesUsecase({required this.topMoviesRepository});

  Future<Either<String,TopMoviesResultEntity>> call({required int page }){
    return topMoviesRepository.getTopMovies(page: page);
  }

}