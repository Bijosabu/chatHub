import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:litehub/model/Notifications/notification_services.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  // final notificationController = Get.put(NotificationsController());
  final NotificationServices notificationServices = NotificationServices();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // notificationController.requestPermission();
      // notificationController.getToken();
      notificationServices.requestNotificationPermission();
      notificationServices.getDeviceToken();
      notificationServices.isTokenRefresh();
      notificationServices.firebaseInit(context);
    });
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Push notification')),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const Center(
                child: Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'ChatHub',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            )),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: const ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                leading: Icon(Icons.logout),
              ),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                // notificationServices.firebaseInit(context);
              },
              child: const Text('get token')),
          const Center(
            child: Text(
              'HomePage',
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}
