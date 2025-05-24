import 'package:bloc/bloc.dart';
import 'package:codex_flutter_g1/features/home/domain/entities/top_movies_entitiy.dart';
import 'package:codex_flutter_g1/features/home/domain/usecase/top_movies_use_case.dart';
import 'package:meta/meta.dart';

part 'top_movies_state.dart';


class TopMoviesCubit extends Cubit<TopMoviesState> {
  TopMoviesCubit(this.topMoviesUsecase) : super(TopMoviesInitial());
  final TopMoviesUsecase topMoviesUsecase;


  int _currentPage = 1;
  bool _isLoadMoreData = false;
  List<TopMoviesEntity> moviesList = [];

  bool isMorePages = true;
  getTopMovies({bool isInitial = false}) async {

    if(_isLoadMoreData || !isMorePages) return;
    if(isInitial){
      emit(TopMoviesLoading());
      _currentPage =1;
      moviesList.clear();
    } else{
      _isLoadMoreData = true;
    }

    final result = await topMoviesUsecase.call(page: _currentPage);
    result.fold((l) {
      emit(TopMoviesFailure(errorMessage: l));
    }, (r) {
      moviesList.addAll(r.topMoviesEntity);
      emit(TopMoviesSuccess(topMovies: List.from(moviesList)));
      _currentPage++;
      _isLoadMoreData = false;
      if(_currentPage >500){
        isMorePages = false;
      }
    });
  }
}
