import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  register({required String email,required String password,required String username})async{
    emit(RegisterLoading());
    // auth.createUserWithEmailAndPassword(email: email, password: password).then((onValue){
    //   print("====>${onValue.user}");
    //   emit(RegisterSuccess());
    // }).catchError((onError){
    //   print(onError);
    //   emit(RegisterFailure(onError.toString()));
    // });
    try {
      final user = await auth.createUserWithEmailAndPassword(email: email, password: password);

      print("user ====> {${user.user!.delete()}}");
     final result =  await saveUserDataToFireStore(username: username);
     if(result == true){
       emit(RegisterSuccess());
     }
    } on FirebaseAuthException catch(e){
      print("====> ${e.message}");
      print("====> ${e.code}");
      print("====> ${e.credential}");
      emit(RegisterFailure(e.message.toString()));
    }

  }

 Future<bool> saveUserDataToFireStore({required String username})async{
    print("saveUserDataToFireStore => ${auth.currentUser!.uid}");
try {
  await  firebaseFirestore.collection("users").doc(auth.currentUser!.uid).set({
    "userid":auth.currentUser!.uid,
    "email":auth.currentUser!.email,
    "username":username,
  });
  return true;
} on FirebaseException catch(e){
  await auth.currentUser!.delete();
  print("error from firestore => ${e.message}");
  emit(RegisterFailure(e.toString()));
  return false;
}
  }

}
