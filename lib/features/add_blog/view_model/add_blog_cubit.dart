import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codex_flutter_g1/core/cash/app_preferences.dart';
import 'package:codex_flutter_g1/core/cash/preference_keys.dart';
import 'package:codex_flutter_g1/features/add_blog/model/blog_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';

part 'add_blog_state.dart';

class AddBlogCubit extends Cubit<AddBlogState> {
  AddBlogCubit() : super(AddBlogInitial());
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  addBlog({required BlogModel blogModel, required File image}) async {
    emit(AddBlogLoading());
    try{
      if(image.path.isNotEmpty){
        final imageUrl = await uploadImageToFireStorage(image: image);
        blogModel.image = imageUrl;
      }

      await firebaseFirestore.collection("blogs").doc(blogModel.id).set(blogModel.toJson());

 print("blog added");
emit(AddBlogSuccess());
    } on FirebaseException catch (e){
      print(e);
      emit(AddBlogError(e.message.toString()));

    }
  }


 uploadImageToFireStorage({required File image}) async {
    try{
      final reference =firebaseStorage.ref("uploads/${AppPreferences.getString(key: PreferenceKeys.userId)}/${DateTime.now().millisecondsSinceEpoch}.png");
      final uploadImage = await reference.putFile(image);
      print("uploadImage ===> $uploadImage");
      final imageUrl = await reference.getDownloadURL();
      print("imageUrl ===> $imageUrl");
      return imageUrl;
    } on FirebaseException catch (e){
      print("firebaseException ===> $e");
      emit(AddBlogError(e.message.toString()));
    }

  }
}
