import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(20);

  void incrementCounter() {
 emit(state+1);
 print("state ==> $state");
  }


  void decrementCounter() {
      if(state > 0){
        emit(state-1);
      }
  }


}
