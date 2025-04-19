import 'package:bloc/bloc.dart';
import 'package:codex_flutter_g1/features/categories/model/categories_model_response.dart';
import 'package:dio/dio.dart' show BaseOptions, Dio;
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
late CategoriesResponse categoriesResponse;

  final dio = Dio(
      BaseOptions(
        baseUrl:"https://student.valuxapps.com/api/",
        receiveTimeout:Duration(seconds: 60),
        connectTimeout:Duration(seconds: 60),
      )
  );



  getCategories() async {
    emit(CategoriesLoading());
    final response = await dio.get("categories");
    print(response);
    categoriesResponse = CategoriesResponse.fromJson(response.data);
    if(categoriesResponse.status == true){
      print("categories response ====> $categoriesResponse");
      emit(CategoriesSuccess());
    }else{
      emit(CategoriesFailure());
    }

  }

}
