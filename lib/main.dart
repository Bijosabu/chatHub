import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:litehub/view/Authentication/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:litehub/view/HomePage/my_home_page.dart';
import 'firebase_options.dart';
// import 'package:litehub/view/login_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundNotificationHandler);
  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> firebaseBackgroundNotificationHandler(
    RemoteMessage message) async {
  await Firebase.initializeApp();
  if (kDebugMode) {
    print(
      message.notification!.title.toString(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatHub',
      home: AuthPage(),
    );
  }
}
