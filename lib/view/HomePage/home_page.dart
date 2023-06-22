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
        title: const Text('Push notification'),
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
