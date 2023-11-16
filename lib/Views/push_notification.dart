// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';

// class PushNotificationManager {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

//   Future<void> init() async {
//     // Configure Firebase
//     _firebaseMessaging.configure(
//       onMessage: (Map<String, dynamic> message) async {
//         print("onMessage: $message");
//         // Handle the incoming message while the app is in the foreground
//       },
//       onLaunch: (Map<String, dynamic> message) async {
//         print("onLaunch: $message");
//         // Handle the incoming message when the app is launched from a terminated state
//       },
//       onResume: (Map<String, dynamic> message) async {
//         print("onResume: $message");
//         // Handle the incoming message when the app is resumed from a background state
//       },
//     );

//     // Request permission for notifications (iOS only)
//     _firebaseMessaging.requestNotificationPermissions(
//         const IosNotificationSettings(
//             sound: true, badge: true, alert: true, provisional: false));

//     // Get the token
//     String token = await _firebaseMessaging.getToken();
//     print("Firebase Token: $token");
//   }
// }
