import 'package:bloc/bloc.dart';
import 'package:codex_flutter_g1/core/app_dio/app_dio.dart';
import 'package:codex_flutter_g1/core/app_dio/end_points.dart';
import 'package:codex_flutter_g1/features/search/model/search_response_model.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  late SearchResponseModel searchResponseModel;


  searchForProducts({String searchText = ""}) async {
    emit(SearchLoading());
    final response = await AppDio.postData(endPoint: EndPoints.searchProducts,
      data: {
        "text":searchText
      }
    );
    print("search response = $response");
    searchResponseModel = SearchResponseModel.fromJson(json: response.data);
    print(searchResponseModel.status);
    if(searchResponseModel.status == true){
      emit(SearchSuccess());
    }else{
      emit(SearchFailure(searchResponseModel.message));
    }
  }

}
