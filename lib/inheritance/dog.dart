import 'animal.dart';
class Dog extends Animal {
  Dog(super.age);


  @override
  makeSound() {
    super.name = "dog";
     super.makeSound();
  }

}

