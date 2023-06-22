// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayController extends GetxController {
  Razorpay? razorpay;
  @override
  void onInit() {
    razorpay = Razorpay();
    super.onInit();
    razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentFailure);
    razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    razorpay?.clear();
    super.dispose();
  }

  void openCheckOut(String amount) {
    var options = {
      "key": "rzp_test_bwIGjiUc62qykk",
      "amount": num.parse(amount) * 100,
      "description": "Donation for a cause",
      "name": "Sample App",
      "prefill": {
        "contact": "9495436983",
        "email": "bijosabu123@gmail.com",
      },
      "external": {
        "wallets": ['paytm'],
      },
    };
    try {
      razorpay?.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    print('Payment successfful');
  }

  handlerPaymentFailure() {
    print('Payment failure');
  }

  handlerExternalWallet() {
    print('External wallet');
  }
}
