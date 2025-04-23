import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

import '../model/category_products_model.dart';

part 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit() : super(CategoryProductsInitial());

  late CategoryProductsModel categoryProductsModel;

  final dio = Dio(
    BaseOptions(
      baseUrl: "https://student.valuxapps.com/api/",
      receiveTimeout: Duration(seconds: 60),
      connectTimeout: Duration(seconds: 60),
    ),
  );

  Future<void> getCategoryProducts(int categoryId) async {
    emit(CategoryProductsLoading());
    try {
      final response = await dio.get("products?category_id=$categoryId");
      categoryProductsModel = CategoryProductsModel.fromJson(response.data);

      if (categoryProductsModel.status == true) {
        emit(CategoryProductsSuccess());
      } else {
        emit(CategoryProductsFailure());
      }
    } catch (e) {
      print("Error fetching category products: $e");
      emit(CategoryProductsFailure());
    }
  }
}