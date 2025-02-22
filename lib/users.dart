class UserInfo {
  String username;
 late String email;
  String phone;

  // Default required parameters
  //UserInfo(this.email,this.username,this.phone);

  // Default optional parameters
  //UserInfo([this.email = "email.com" ,this.username = "ahmed",this.phone = "01000010"]);

  // Named Required parameters
 //UserInfo({required this.email,required this.username,required this.phone});

  // Named optional parameters
 UserInfo({ required this.email, this.username = "ahmed", this.phone = "0123456789"}){
   print("$email\n$username\n$phone");
 }


// Named Constructor
 UserInfo.admin({this.username = "Ahmed", this.phone = "0122222222"}){
 email = "admin@system.com";
 print("$email\n$username\n$phone");
 }



}