import 'package:ecommerce_app/Controllers/Cart/CartController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

class PaymentButton extends StatelessWidget {
  PaymentButton({super.key});
  String client_sec = "";
  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    client_sec = controller.clientSecret.value;
    return ElevatedButton(
        onPressed: () {
          controller.getClientSecret(100);
          makePayment();
        },
        child: Text("Pay"));
  }

  Future<void> makePayment() async {
    Stripe.instance
        .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
                paymentIntentClientSecret: client_sec,
                style: ThemeMode.light,
                merchantDisplayName: "Appium Labs"))
        .then((value) => displayPaymentSheet());
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      print(e);
    }
  }
}
