import 'package:ecommerce_app/UI/pages/AuthenticationScreens/LoginScreen.dart';
import 'package:ecommerce_app/PaymentButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/UI/shared/Drawer/DrawerHolder.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  Stripe.publishableKey =
      "pk_test_51HYoWMA79opfJT5scdJaJ2mcssKI1lkkJ7EnyKIvziFx5ymYAFmOzXXnAJht2s7N3WmRQXZ1WIybAz77wtr3dks600WkvFbGwl";
  await GetStorage.init();
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final prefs = GetStorage();

  ///segwr
  @override
  Widget build(BuildContext context) {
    String? id = prefs.read("token");
    // prefs.write("token", "640b3e2c5dd959dc32f95560");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: id != null ? DrawerHolder() : LoginScreen(),
      // home: Temp(),
    );
  }
}
