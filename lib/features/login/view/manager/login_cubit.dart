import 'package:bloc/bloc.dart';
import 'package:codex_flutter_g1/features/login/model/login_request_model.dart';
import 'package:codex_flutter_g1/features/login/model/login_response_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

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
      emit(LoginSuccess(message:loginResponseModel!.message));
    } else{
      print("login failed");
      print(loginResponseModel!.message);
      print(loginResponseModel!.status);
      emit(LoginError(message:loginResponseModel!.message));

    }
  }
}
