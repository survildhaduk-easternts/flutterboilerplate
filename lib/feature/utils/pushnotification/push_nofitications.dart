import 'dart:async';

import 'package:bhagat_group_ticket_management/features/data/constants.dart';
import 'package:bhagat_group_ticket_management/features/utility/app_shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'features/utility/utility.dart';
import 'main.dart';

class PushNotificationsManager {
  PushNotificationsManager._();
  factory PushNotificationsManager() => _instance;
  static final PushNotificationsManager _instance =
      PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  // Map<String, dynamic>? notificationMessage;

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high_importance_channel1', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
      enableLights: true,
      showBadge: true);

  Future<void> init() async {
    await _firebaseMessaging.setAutoInitEnabled(true);
//init notification
    var androidInit =
        const AndroidInitializationSettings("drawable/ic_launcher_foreground");
//     var iosInit = const DarwinInitializationSettings(
//         // defaultPresentBadge: true,
//         // defaultPresentAlert: true,
//         // defaultPresentSound: true,
//         );
    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInit,
        iOS: DarwinInitializationSettings(defaultPresentSound: true));

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

//foreground, however you will still receive events relating to the notification
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
//android notification details setting
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description,
            playSound: true,

            // sound: channel.sound,
            importance: Importance.max,
            priority: Priority.high);
//
//     //ios noitifiaction details
//
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
      presentBadge: true,
      presentSound: true,
      presentAlert: true,
    );
//
    NotificationDetails notificationSetting = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    //

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        AppleNotification? ios = message.notification?.apple;
        print("on massge ${message.toMap()}");
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(notification.hashCode,
              notification.title, notification.body, notificationSetting);
        }
      });
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print("on open ${message.data}");
      });
    } else {
      Utility.showToast("Please On Push Notifiacation");
    }

    // For testing purposes print the Firebase Messaging token
    String? token = await _firebaseMessaging.getToken();
    print("XXXXXX : token $token");
    AppSharedPreferences.setStringData(SharedPreferenceKeys.FCMTOKEN, token!);
  }
}
