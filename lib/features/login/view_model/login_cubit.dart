import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

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
        await saveUserDataToFireStore(username: email);
        emit(LoginSuccess());
      }
    } on FirebaseAuthException catch(e){
      emit(LoginFailure(e.code.toString()));
    }
  }

 Future saveUserDataToFireStore({required String username})async{
    print("saveUserDataToFireStore => ${auth.currentUser!.uid}");
    try {
      await  firebaseFirestore.collection("users").doc(auth.currentUser!.uid).set({
        "userid":auth.currentUser!.uid,
        "email":auth.currentUser!.email,
        "username":username,
      });
    } on FirebaseException catch(e){
      await auth.currentUser!.delete();
      print("error from firestore => ${e.message}");
      emit(LoginFailure(e.toString()));
    }
  }

}
