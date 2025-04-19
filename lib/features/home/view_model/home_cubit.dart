import 'package:bloc/bloc.dart';
import 'package:codex_flutter_g1/core/app_dio/end_points.dart';
import 'package:codex_flutter_g1/features/home/model/home_response_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../core/app_dio/app_dio.dart' show AppDio;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  late HomeResponseModel homeResponseModel;

  getHomeData() async {
    emit(HomeLoading());
 final response = await  AppDio.getData(endPoint: EndPoints.home);
 print(response);
    homeResponseModel = HomeResponseModel.fromJson(json: response.data);
  print("home response ====> $homeResponseModel");
  print("home response ====> ${homeResponseModel.homeData.homeBanners.length}");
  emit(HomeSuccess());
  }
}

