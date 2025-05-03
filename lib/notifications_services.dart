import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsServices {
  static final NotificationsServices _notificationsServices =
      NotificationsServices._notificationsServices;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    await _requestNotificationsPermission();
  }

  Future<void> showNotification(
      {required int id, required String title, required String body}) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          "ecommerce_1",
          "ecommerce",
          importance: Importance.max,
          priority: Priority.high,
        );
    flutterLocalNotificationsPlugin.show(
        id,
        title,
        body,
        NotificationDetails(
          android: androidNotificationDetails,
        ));

  }

  Future<void> _requestNotificationsPermission() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }
}
