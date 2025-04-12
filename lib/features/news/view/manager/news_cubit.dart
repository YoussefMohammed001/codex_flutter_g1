import 'package:codex_flutter_g1/features/news/news_api_constants.dart';
import 'package:codex_flutter_g1/features/news/model/news_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  final dio = Dio(
    BaseOptions(
      baseUrl:NewsAPIConstants.baseUrl,
      receiveTimeout:Duration(seconds: 60),
      connectTimeout:Duration(seconds: 60),

    )
  );
  NewsResponseModel?  newsResponseModel;

  // https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=909b3d38497c4cf281f6d015637a501e'
  // base url => https://newsapi.org/v2/
  // endpoint => top-headlines
  // query parameter => country=us, apiKey=909b3d38497c4cf281f6d015637a501e, category=general


  getTopHeadlines({required String category}) async{
    emit(NewsLoadingState());
    try{
      final response = await dio.get(
          NewsAPIConstants.toHeadLines,
          queryParameters: {
            "country":"us",
            "category":category,
            "apiKey":"909b3d38497c4cf281f6d015637a501e"
          },

      );
      newsResponseModel = NewsResponseModel.fromJson(response.data);
      emit(NewsSuccessState());
      print("news response ===>>> $newsResponseModel");

    } on DioException catch(dioError){
      print(dioError.response!.data['message']);
      emit(NewsErrorState(dioError.response!.data['message']));
    }
  }


  getToHeadLinesByTabBar({required int index}){
    switch(index){
      case 0:
        getTopHeadlines(category: 'general');
        break;
      case 1:
    getTopHeadlines(category: 'business');
        break;
      case 2:
     getTopHeadlines(category: 'entertainment');
        break;
      case 3:
     getTopHeadlines(category: 'health');
        break;
      case 4:
getTopHeadlines(category: 'science');
        break;
    }

  }

}
