// {
// "status": true,
// "message": "Login done successfully",
// "data": {
// "id": 70838,
// "name": "Youssef Mohammed",
// "email": "Youssef@codex.com",
// "phone": "01111119202",
// "image": "https://student.valuxapps.com/storage/assets/defaults/user.jpg",
// "points": 0,
// "credit": 0,
// "token": "4qkbxm0kXm4Libwu4dAAexMmtdxrVIkfg7aA1tpSHuXchhHoz1QvpGRDxn7a86FshHUhVp"
// }
// }

class LoginResponseModel {
  final bool status;
  final String message;
  final LoginResponseData? data;

  LoginResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });
  factory LoginResponseModel.fromJson(Map<String,dynamic> json){
    return LoginResponseModel(
        status: json['status'],
        message: json['message'],
        data:json['data'] != null ? LoginResponseData.fromJson(json['data']) : null
    );
  }




}
class LoginResponseData{
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final int points;
  final int credit;
  final String token;

  LoginResponseData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  factory LoginResponseData.fromJson(Map<String,dynamic> json){
    return LoginResponseData(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        image: json['image'],
        points: json['points'],
        credit: json['credit'],
        token: json['token']
    );
  }

}