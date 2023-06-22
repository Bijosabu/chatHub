import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:litehub/controller/razor_pay_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final razorPayController = Get.put(RazorPayController());
  final TextEditingController paymentText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Razorpay'),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200]),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter amount',
                    ),
                    controller: paymentText,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                razorPayController.openCheckOut(paymentText.text);
              },
              child: const Text('Donate now '),
            )
          ],
        ));
  }
}
