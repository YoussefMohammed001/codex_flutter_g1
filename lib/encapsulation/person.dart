class Person{
  String _name  = "Ali";
  String _userId = "123456";
    int _age =  20;
    String _phone = "010210323";
    double _balance = 1000.100;

  String get name => _name;

  String get userId => _userId;

  double get balance => _balance;

  String get phone => _phone;

  int get age => _age;

  set phone(String value) {
    _phone = value;
  }

  set age(int value) {
    _age = value;
  }

  set name(String value) {
    _name = value;
  }

// set name(String value) {
  //   _name = value;
  // }




}

