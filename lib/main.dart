import 'package:codex_flutter_g1/encapsulation/person.dart';
void main() {
  //UserInfo();
  //print("----------<>----------");
  //UserInfo(email: "ahmed@email.com", username: "ahmed", phone: "01201201201");
  //UserInfo user = UserInfo();
  //UserInfo admin =  UserInfo.admin(username: "", phone: "");

//Dog dog = Dog(10);
//dog.makeSound();
Person person = Person();

person.name = "ahmed";
person.name = "mohamed";
/// person.userId = 123; // Error ==> There isn't a setter named 'userId' in class 'Person
print(person.userId );

}






