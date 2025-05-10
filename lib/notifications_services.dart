import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
// Future<void> firebaseMessagingOnBackGroundHandler(RemoteMessage message) async{
//   print("on background message");
//   print(message.notification!.title);
//   print(message.notification!.body);
//   if(message.notification != null){
//     print(message.notification!.title);
//     print(message.notification!.body);
//     NotificationsServices().showNotification(id: 0, title: message.notification!.title!, body:  message.notification!.body!);
//   }
// }
//
// class NotificationsServices {
//   static final NotificationsServices _notificationsServices =
//       NotificationsServices._notificationsServices;
//
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//    Future<void>  init() async {
//     AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings("@mipmap/ic_launcher");
//
//     InitializationSettings initializationSettings =
//     InitializationSettings(android: initializationSettingsAndroid);
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//     await _requestNotificationsPermission();
//     await _initFirebaseCloudMessaging();
//
//    }
//
//
// Future<void> _initFirebaseCloudMessaging()async{
//      await FirebaseMessaging.instance.requestPermission();
//      final fcmToken = await FirebaseMessaging.instance.getToken();
//      print("fcmToken ====> $fcmToken");
//      FirebaseMessaging.onMessage.listen((message){
//       if(message.notification != null){
//         print(message.notification!.title);
//         print(message.notification!.body);
//         showNotification(id: 0, title: message.notification!.title!, body:  message.notification!.body!);
//       }
//
//      });
//
// }
//
//
//   Future<void> showNotification({required int id, required String title, required String body}) async {
//      AndroidNotificationDetails androidNotificationDetails =
//     AndroidNotificationDetails(
//       "ecommerce_1",
//       "ecommerce",
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//
//    await  flutterLocalNotificationsPlugin.show(
//         id,
//         title,
//         body,
//         NotificationDetails(
//           android: androidNotificationDetails,
//         ));
//
//   }
//

// }


FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


void initFcm() async {
  initLocalNotifications();
await requestNotificationsPermission();

  FirebaseMessaging.instance.getToken().then((onValue){
    print("token===>$onValue");
  });
 FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);


 FirebaseMessaging.onMessage.listen((message){
    if(message.notification != null){
      showNotification(title: message.notification!.title!, body: message.notification!.body!);
    }
  });

}


@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
print("on background message");
  if(message.notification != null){
    showNotification(title: message.notification!.title!, body: message.notification!.body!);
  }
}

  Future<void> requestNotificationsPermission() async {
    if(await Permission.notification.request().isGranted){
      print("notification permission granted");
    }else{
      print("notification permission denied");
    }



  }

void initLocalNotifications()async{
    AndroidInitializationSettings  androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidSettings,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void showNotification({required String title,required String body})async{
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      "ecommerce_1",
      "ecommerce",
      priority: Priority.high,
      importance: Importance.max,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await flutterLocalNotificationsPlugin.show(
      title.hashCode,
      title,
      body,
      notificationDetails,
    );


  }






