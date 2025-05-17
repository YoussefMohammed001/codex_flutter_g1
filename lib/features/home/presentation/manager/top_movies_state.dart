part of 'top_movies_cubit.dart';

@immutable
sealed class TopMoviesState {}

final class TopMoviesInitial extends TopMoviesState {}

final class TopMoviesLoading extends TopMoviesState {}
final class TopMoviesSuccess extends TopMoviesState {
  final List<TopMoviesEntity> topMovies;
  TopMoviesSuccess({required this.topMovies});
}
final class TopMoviesFailure extends TopMoviesState {
  final String errorMessage;
  TopMoviesFailure({required this.errorMessage});
}
