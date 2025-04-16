import 'package:codex_flutter_g1/features/login/model/login_request_model.dart';
import 'package:codex_flutter_g1/features/login/model/login_response_model.dart';
import 'package:codex_flutter_g1/features/login/view_model/login_cubt/login_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final dio = Dio(
      BaseOptions(
        baseUrl:"https://student.valuxapps.com/api/",
        receiveTimeout:Duration(seconds: 60),
        connectTimeout:Duration(seconds: 60),
      )
  );

   LoginResponseModel? loginResponseModel;
  login({required LoginRequestModel loginRequestModel}) async {
    emit(LoginLoading());
    final response = await dio.post("login",
    data: loginRequestModel.toJson()
    );
    print(response);
    loginResponseModel = LoginResponseModel.fromJson(response.data);
    if(loginResponseModel!.status == true){
      print("login done");
      print(loginResponseModel!.data!.token);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt("id", loginResponseModel!.data!.id);
      await prefs.setString("token", loginResponseModel!.data!.token);
      await prefs.setString("name", loginResponseModel!.data!.name);
      await prefs.setString("email", loginResponseModel!.data!.email);
      await prefs.setString("phone", loginResponseModel!.data!.phone);
      await prefs.setString("image", loginResponseModel!.data!.image);
      print("id saved: =====> ${prefs.getInt('id')}");
      emit(LoginSuccess(message:loginResponseModel!.message));
    } else{
      print("login failed");
      print(loginResponseModel!.message);
      print(loginResponseModel!.status);
      emit(LoginError(message:loginResponseModel!.message));
    }
  }
}
