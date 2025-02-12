import 'package:codex_flutter_g1/user_info.dart';

void main() {

  // final, const, static, private


 // final dynamic courseName;
 // courseName = "Flutter";
 // // courseName = "UI/UX" ; => Error ==> The final variable 'courseName' can only be set once
 //
 // const double pi = 3.14;
 // pi = 10.10;  => Constant variables can't be assigned a value
 // language = "python";  .



  //
  // String  welcomeText = "Welcome to Flutter";
  // print(welcomeText);
  // print(welcomeText.isNotEmpty);
  // print(welcomeText.isEmpty);
  // print(welcomeText.length);
  // print(welcomeText.trim());
  // print(welcomeText.startsWith(" "));
  // print(welcomeText.endsWith("r"));
  // print(welcomeText.toUpperCase());
  // print(welcomeText.toLowerCase());
  // print(welcomeText.replaceAll("Welcome to", "Hello in"));
  // print(welcomeText.substring(3,5));
  // print(welcomeText.split(" "));
  // print(welcomeText.split("Flutter"));
  //
  // String firstName = "mohamed";
  // String lastName = "mohamed";
  // print(firstName.compareTo(lastName));
  // print(firstName == lastName);


  // int age = 25;
  // double price = 50.5;
  // String userName = "ahmed";
  // bool isStudent = true;
  // bool hasCar = false;
  //
  // List<dynamic> randomList = [
  //   "ahmed", true, 20, 50.50
  // ];
  //
  // Map<String, dynamic> userInfo = {
  //   "name": "Ahmed",
  //   "age": 23,
  //   "phoneNumber": "0100845",
  //   "hasCar": false,
  //   "charge": 500.50,
  // };
  //
  // dynamic unKnownVariable;
  // unKnownVariable = 10;
  // unKnownVariable = false;
  // unKnownVariable = 202.20;
  // unKnownVariable = "Ahmed";
  //
  // // DataType variableName = value;
  // var balance = 300;
  //  print("Balance is $balance");
  //  balance = 400;
  //  print("New Balance is $balance");

UserInfo userInfo1  = UserInfo();
UserInfo userInfo2  = UserInfo();
userInfo1.name = "mohamed";
  // userInfo1.courseName = "Dart";  ERROR ===> 'courseName' can't be used as a setter because it's final.
  print(UserInfo.companyName);
print(userInfo1.name);
print(userInfo2.name);






}


