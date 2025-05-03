import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codex_flutter_g1/core/cash/app_preferences.dart';
import 'package:codex_flutter_g1/core/cash/preference_keys.dart';
import 'package:codex_flutter_g1/features/add_blog/model/blog_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
 late List<BlogModel> blogModel = [];
  getHomeData() async {
    emit(HomeLoading());
    try {
      final result = await firestore.collection("blogs").where("uid",isEqualTo: AppPreferences.getString(key: PreferenceKeys.userId)).get();
      print("result => ${result.docs}");
      for(var element in result.docs){
        blogModel.add(BlogModel.fromJson(element.data()));
      }
      emit(HomeSuccess());

    } on FirebaseException catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }


}
