import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codex_flutter_g1/core/cash/app_preferences.dart';
import 'package:codex_flutter_g1/core/cash/preference_keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  void login(String email, String password) async {
    emit(LoginLoading());
    try{
      final user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if(user != null){
        await saveUserDataToLocal(email: email, userId: user.user!.uid);
        emit(LoginSuccess());
      }
    } on FirebaseAuthException catch(e){
      emit(LoginFailure(e.code.toString()));
    }
  }

 Future getUserDataFromFireStore({required String username})async{
    print("saveUserDataToFireStore => ${auth.currentUser!.uid}");
    try {
      await  firebaseFirestore.collection("users").doc(auth.currentUser!.uid).get();
    } on FirebaseException catch(e){
      print("error from firestore => ${e.message}");
      emit(LoginFailure(e.toString()));
    }
  }


  saveUserDataToLocal({required String email, required String userId}) async {
    AppPreferences.setString(key: PreferenceKeys.email, value: email);
    AppPreferences.setString(key: PreferenceKeys.userId, value: userId);

  }

}
