import 'package:codex_flutter_g1/core/network/app_end_points.dart';
import 'package:codex_flutter_g1/core/network/network_services.dart';
import 'package:codex_flutter_g1/features/home/data/models/top_movies_response.dart';
import 'package:either_dart/either.dart';
abstract class TopMoviesApi{
  Future<Either<String, MoviesResponse>> getTopMovies();

}

class TopMoviesApiImp implements TopMoviesApi{

  @override
  Future<Either<String, MoviesResponse>> getTopMovies() async {
    final response  = await NetworkServices.getData(endPoint: AppEndPoints.topMovies,
    queryParameters: {
      "api_key":"98062d6f3f88f30792938fbc06a23e9e"
    }
    );
 return response.fold((left){
    return Left(left);
  }, (right){
    return Right(MoviesResponse.fromJson(right));
  });
  }
}