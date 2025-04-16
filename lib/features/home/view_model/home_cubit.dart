import 'package:bloc/bloc.dart';
import 'package:codex_flutter_g1/features/home/model/home_response_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  late HomeResponseModel homeResponseModel;
  final dio = Dio(
      BaseOptions(
        baseUrl:"https://student.valuxapps.com/api/",
        receiveTimeout:Duration(seconds: 60),
        connectTimeout:Duration(seconds: 60),
      )
  );


  getHomeData() async {
    emit(HomeLoading());
 final response = await dio.get("home");
 print(response);
    homeResponseModel = HomeResponseModel.fromJson(json: response.data);
  print("home response ====> $homeResponseModel");
  print("home response ====> ${homeResponseModel.homeData.homeBanners.length}");
  emit(HomeSuccess());
  }
}

