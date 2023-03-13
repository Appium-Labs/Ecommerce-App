import 'package:ecommerce_app/Controllers/Cart/CartController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

class PaymentButton extends StatefulWidget {
  bool areDetailsAdded;
  PaymentButton({required this.areDetailsAdded});

  @override
  State<PaymentButton> createState() => _PaymentButtonState();
}

class _PaymentButtonState extends State<PaymentButton> {
  String client_sec = "";

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    client_sec = controller.clientSecret.value;
    return GestureDetector(
      onTap: () {
        controller.getClientSecret(100);
        makePayment();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.areDetailsAdded == true ? Colors.red : Colors.grey,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  color: const Color(0xff5956E9).withOpacity(0.2),
                  blurRadius: 20)
            ]),
        child: Text(
          "Make Payment",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    await Stripe.instance
        .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
                paymentIntentClientSecret: client_sec,
                style: ThemeMode.light,
                merchantDisplayName: "Appium Labs"))
        .then((value) => displayPaymentSheet());
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance
          .presentPaymentSheet()
          .then((value) => print("done-------"));
    } catch (e) {
      print(e);
    }
  }
}
