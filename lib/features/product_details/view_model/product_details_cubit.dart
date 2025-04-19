import 'package:bloc/bloc.dart';
import 'package:codex_flutter_g1/core/app_dio/app_dio.dart';
import 'package:codex_flutter_g1/core/app_dio/end_points.dart';
import 'package:codex_flutter_g1/features/product_details/model/product_details_model_response.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
  late ProductDetailsModelResponse productDetailsModelResponse;


  getProductDetails({required int productId}) async {
    emit(ProductDetailsLoading());

      final response = await AppDio.getData(endPoint: EndPoints.productDetails+productId.toString(),);
      print("response from cubit  ===> $response");

        productDetailsModelResponse = ProductDetailsModelResponse.fromJson(response.data);
        if(productDetailsModelResponse.status == true){
          emit(ProductDetailsSuccess());
          print(productDetailsModelResponse.data!.name);
        }else{
          print(productDetailsModelResponse.message);
          emit(ProductDetailsError(message: productDetailsModelResponse.message));
        }


  }
}
