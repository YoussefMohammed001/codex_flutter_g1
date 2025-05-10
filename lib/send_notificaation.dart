import 'package:codex_flutter_g1/firebase_credenails_helper.dart';
import 'package:dio/dio.dart';

sendNotification() async {
  final dio = Dio();
  final accessToken = await getAccessToken();
  print("access token====> ${accessToken.accessToken.data}");

  try{
   final response = await dio.post(
        "https://fcm.googleapis.com/v1/projects/bekya-9038f/messages:send",
        data: {
          "message":{

            "token":"ctYpiZR5TsmxdZOjoveMUM:APA91bFbJ0_Kw5pEjSRJQZcuSLsHRkOMuX69-mBXK8sbzjUApxwNc-lY0cImA3Mh1Rs7_Zvxb6QVIUhRx0rBIZQYupAMi1vLbGtOtxYbPW-1XeUwzGr5S8U",
            "notification":{
              "body":"This is an FCM notification message!",


              "title":"FCM Message"
            }
          }
        },
        options: Options(
            headers: {
              "Authorization" : "Bearer ${accessToken.accessToken.data}"
            }
        )
    );
   print("response ====> $response");
  } on DioError catch(e){
    print("error ====> ${e.response}");
  }

}