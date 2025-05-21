import 'package:bloc/bloc.dart';
import 'package:codex_flutter_g1/features/home/domain/entities/top_movies_entitiy.dart';
import 'package:codex_flutter_g1/features/home/domain/usecase/top_movies_use_case.dart';
import 'package:meta/meta.dart';

part 'top_movies_state.dart';


class TopMoviesCubit extends Cubit<TopMoviesState> {
  TopMoviesCubit(this.topMoviesUsecase) : super(TopMoviesInitial());
  final TopMoviesUsecase topMoviesUsecase;
  getTopMovies() async {
    emit(TopMoviesLoading());
    final result = await topMoviesUsecase.call();
    result.fold((l) {
      emit(TopMoviesFailure(errorMessage: l));
    }, (r) {
      emit(TopMoviesSuccess(topMovies: r));
    });
  }
}
