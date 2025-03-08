
import 'package:codex_flutter_g1/days.dart';

void main() {
  // Naming
  // files:  home_screen => snake_case
  // classes: HomeScreen=> UpperCase (PascalCase)
  // variables: firstName => camelCase, bool variable => isMale
  // functions: getUsers => camelCase
  // constants: BASE_URL  => const String BASE_URL = "https://myapi.com" => UPPERCASE_WITH_UNDERSCORES
  // private(variables, functions) => _firstName, _getUsers

  // Data types
  // Numbers => int, double, num(double or int)
  // String
  // bool
  // lists
  //maps

  // Strings

  String userName = "Ahmed Mohamed";
  print(userName);
  print(userName.length);
  print(userName.isEmpty);
  print(userName.isNotEmpty);

  print(userName.toLowerCase());
  print(userName.toUpperCase());
  String email = "  email@gmail.com";
  print(email);
  print(email.trimLeft());
  print(email.trimRight());
  print(email.trim());
  String welcomeText =  "Hello Dart,Dart is good";
  print(welcomeText);
  print(welcomeText.replaceAll("Dart", "Flutter"));

  print(email.contains("@"));
  print(email.startsWith("e"));
  print(email.startsWith(" "));
  print(email.trim().startsWith("e"));

  print(welcomeText[5]);
  print(welcomeText.indexOf("Hello"));
  print(welcomeText.indexOf("Dart"));
  print(welcomeText.lastIndexOf("Dart"));

  print(welcomeText.substring(0,2));
  print(welcomeText.split(",")); // ===> split returns list

  String password = "1234567";
  String confirmPassword = "123456";
  print(password.compareTo(confirmPassword));
  print(password == confirmPassword);

  double balance = 200.20;
  bool isMale = true;

  String  age = "20 age";

  //int integerAge = int.parse(age);
  int? integerAge = int.tryParse(age);
  int integerAgeAvoidNull = int.tryParse(age) ?? 0;
  print(integerAge);

  String balanceStr = "200.20 balance";
  //double doubleBalance = double.parse(balanceStr);
  double doubleBalance = double.tryParse(balanceStr) ?? 0;
  print(doubleBalance);

  int firstNumber = 20;
  int secondNumber = 30;
  print(firstNumber + secondNumber);
  print(firstNumber.toString() + secondNumber.toString());

  String firstName = "Ahmed";
  String lastName = "Mohamed";
  //String fullName = firstName + " " + lastName;
  String fullName = "$firstName $lastName";
  print(fullName);

  double price  = 99.99;
  print(price.toInt());

  // int mark = 100;
  // print(mark.toDouble());

  final String userId = "32323232";

  const String API_KEY = "123456789";

  dynamic  isAdmin = "true";
  isAdmin = true;
  isAdmin = 1;
  isAdmin = 1.0;

  String _token = "123456789";

  var name = "Ahmed";
  // name = 1; ==> A value of type 'int' can't be assigned to a variable of type 'String'.

UserInfo userInfo = UserInfo();
print(userInfo.userName);
//print(userInfo.userId); => The static getter 'userId' can't be accessed through an instance
print(UserInfo.userId);

// List<dataType>  variableName = [];
List<int> numbers = [1,2,3,4,5,6,7,8];
  print(numbers);
numbers.add(9);

print(numbers);
numbers.addAll([10,11,12,13,14,15]);
  print(numbers);
  numbers.insert(0, 1);
  print("insert in numbers $numbers");
  numbers.insertAll(0, [16,17,18,19]);
  print("insert all in numbers $numbers");
  numbers.remove(15);
  print(numbers);
  numbers.removeAt(0);
  print(numbers);
  numbers.removeLast();
  print(numbers);
  print(numbers.length);
print(numbers[0]);
print(numbers.contains(1));
print(numbers.indexOf(1));
print(numbers.first);
print(numbers.last);
print(numbers.isNotEmpty);
print(numbers.isEmpty);
print(numbers.reversed);
print(numbers.reversed.toList());
numbers.clear();
print(numbers);

int num1 = 20;
int num2 = 5;
// Arithmetic Operators
print(num1 + num2);
print(num1 - num2);
print(num1 * num2);
print(num1 / num2); /// ==> returns double
print(num1 % num2);

// Relational Operators
print(num1 == num2);
print( num1 != num2);
print(num1 > num2);
print(num1 < num2);
print(num1 >=num2);
print(num1<=num2);

// Logical Operators
bool isFemale = true;
bool isMarried = false;

print(isFemale && isMarried);
print(isFemale || isMarried);
print(!isMarried);
print( isFemale && !isMarried);


// Assignment Operators
double num = 10;
num = 15;
num +=5;
print(num);
  num -=5;
  print(num);
  num *=5;
  print(num);
  num /=5;
  print(num);


  int userAge = 20;
if(userAge >=18){
  print("you are adult");
}else{
  print("you are not adult");
}

int mark = 6;
if(mark >= 85){
  print("A");
} else if(mark >= 75){
  print("B");
} else if(mark >= 65){
  print("c");
}else if(mark >=50){
  print("D");
}else{
  print("F");
}


// ternary operator
String result = userAge >= 18 ? "Adult" : "Not Adult";
print(result);


Days day = Days.sunday;
switch(day){
  case Days.sunday:
    print("Today is Sunday");
    case Days.monday:
      print("Today is Monday");
      case Days.tuesday:
        print("Today is Tuesday");
  case Days.wednesday:
    print("Today is Wednesday");
  case Days.thursday:
    print("Today is Thursday");
  case Days.friday:
    print("Today is Friday");
  case Days.saturday:
    print("Today is Saturday");
}


print("------------------Loops------------------");
for(int count = 10;count >= 0; count--){
  print(count);
}
  print("------------------For In Loops------------------");

List<String> users = ["Ahmed","Mohamed","Ali","Omar","Khaled"];
for(String user in users){
  print(user);
}


List<UserInfo> usersInfo = [
  UserInfo(userName: "Ahmed", email: "Ahmed@example.com"),
  UserInfo(userName: "Mohamed", email: "Mohamed@example.com"),
  UserInfo(userName: "Ali", email: "Mohamed@example.com"),
];
for(UserInfo user in usersInfo){
  print("${user.userName} - ${user.email}");
}


print("------------------For Each Loops------------------");
users.forEach((user){
  print(user);
});


print("------------------While Loops------------------");

int count = 0;
while(count  < 10){
  count++;
  print(count);
}
print("------------------Break------------------");
while(count  < 10){
  count++;
  if(count == 5){
    break;
  }
  print(count);
}
  print("------------------Continue------------------");
  while(count  < 10){
    count++;
    if(count == 5){
      continue;
    }
    print(count);
  }

// while(true){
//   print("Hello");    ==> infinite loop
// }

print("------------------Do While Loops------------------");

int count2 = 0;
do{
  count2++;
print(count2);
} while(count2 <=15);

print("------------------Maps------------------");
Map<String,int> scores = {
  "ahmed":50,
  "mohamed":60,
  "ali":70,
  "omar":80
};
print(scores['ahmed']);


Map<String,dynamic> userInformation = {
  "users" : [
    {
      "userId": "M19_213123213",
      "userName":"Ahmed",
      "age":20,
      "email":"ahmed@example.com",
      "phone":0123456789
    },
    {
      "userId": "M20_213123213",
      "userName":"Mohamed",
      "age":23,
      "email":"Mohamed@example.com",
      "phone":0123443789
    },
  ],
};

print(userInformation['users']);
print(userInformation['users'][0]);
print(userInformation['users'][0]['userId']);



}
class UserInfo{
static  String userId = "M19_213123213";
String userName = "Mohamed";
String email = "email@example.com";

UserInfo({ this.userName = "Mohamed",  this.email = "email@example.com"});


}



