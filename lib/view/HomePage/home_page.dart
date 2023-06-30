import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:litehub/model/Notifications/notification_services.dart';
import 'package:get/get.dart';
import 'package:litehub/view/ChatPage/chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  // final notificationController = Get.put(NotificationsController());
  final NotificationServices notificationServices = NotificationServices();
  final FirebaseFirestore _fireBaseStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
        body: _buildUserList());
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _fireBaseStore.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error occured');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading');
        }
        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItem(doc))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;
    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
        title: Text(
          data['email'],
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        onTap: () {
          Get.to(const ChatPage());
        },
      );
    }
    return const SizedBox();
  }
}
