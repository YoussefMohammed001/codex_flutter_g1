import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codex_flutter_g1/core/cash/app_preferences.dart';
import 'package:codex_flutter_g1/core/cash/preference_keys.dart';
import 'package:codex_flutter_g1/features/home/model/get_blog_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late List<GetBlogModel> blogsList = [];

  getBlogs() async {
    emit(GetBlogsLoading());
    try {
      //       firestore
      //     .collection("blogs")
      //     .where("uid",isEqualTo: AppPreferences.getString(key: PreferenceKeys.userId))
      //     .snapshots().listen((onData){
      //       print("onData => ${onData.docs}");
      //       blogsList.clear();
      //       for(var document in onData.docs){
      //         print(" document => ${document.data()}");
      //           blogsList.add(GetBlogModel.fromJson(document.data()));
      //       }
      //       emit(GetBlogsSuccess());
      //
      //         // for (var doc in result.docs) {
      //   //   print("doc ====> ${doc.data()}");
      //   //   blogsList.add(GetBlogModel.fromJson(doc.data()));
      //   // }
      // });
      final result = await firestore.collection("blogs").get();
      print("result => ${result.docs}");
      blogsList.clear();
      for (var doc in result.docs) {
        print("doc ====> ${doc.data()}");
        blogsList.add(GetBlogModel.fromJson(doc.data()));
      }
      emit(GetBlogsSuccess());
    } on FirebaseException catch (e) {
      print("error from firestore => ${e.message}");
      emit(GetBlogsFailure(e.toString()));
    }
  }

  deleteBlog({required String id, }) async {
   emit(DeleteBlogLoading());
    try {
      await firestore.collection("blogs").doc(id).delete();
      emit(DeleteBlogSuccess());
    } on FirebaseException catch (e) {
      emit(DeleteBlogFailure(e.toString()));
    }
  }
}
