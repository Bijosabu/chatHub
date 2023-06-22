import 'package:get/get.dart';
import 'package:litehub/model/Notifications/notification_services.dart';

class NotificationsController extends GetxController {
  void requestPermission() {
    NotificationServices().requestNotificationPermission();
  }

  void getToken() {
    NotificationServices().getDeviceToken();
  }
}
