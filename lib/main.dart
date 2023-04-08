import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutterboilerplate/feature/presentation/pages/my_app.dart';
import 'feature/utils/pushnotification/push_nofitications.dart';
import 'injection_container.dart' as di;


@pragma('vm:entry-point')
Future<void> myBackgroundMessageHandler(RemoteMessage message) async {
  print("back ground ${message.toMap()}");
  final messageremot = message.toMap();

  if (messageremot.containsKey('data')) {
    // Handle data message
    final dynamic data = messageremot['data'];
  }

  if (messageremot.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = messageremot['notification'];
  }
}
//flutter notifiaction
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  PushNotificationsManager().init();
  FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
  return runZonedGuarded(() async {
    runApp(MyApp());
  }, (error, stack) {
    print(stack);
    print(error);
  });
}


