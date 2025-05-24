import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver{

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print("on create ${bloc.runtimeType}");
  }


  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print("on change ${bloc.runtimeType}\n${bloc.state}\n${change.currentState}\n${change.nextState}");
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print("on close ${bloc.runtimeType}");
  }



  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print("on error ${bloc.runtimeType}");
    // TODO: implement onError
  }



}