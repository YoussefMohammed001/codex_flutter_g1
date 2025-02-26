import 'package:codex_flutter_g1/abstraction/animal.dart';

// extends from abstract classes => must override only all abstract functions
// implements(force implementation) from abstract classes => must override all functions

class Dog implements BaseAnimal{
  @override
  String eat() {
    print("dog is eating");
return "dog is eating";
  }

  @override
  makeSound() {
    print("bark");
  }

  @override
  color() {
    // TODO: implement color
    throw UnimplementedError();
  }



}