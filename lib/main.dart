import 'package:ecommerce_app/Features-Login/Views/SplashScreen.dart';
import 'package:ecommerce_app/x.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/Drawer/DrawerHolder.dart';
import 'package:ecommerce_app/NavigationMenu.dart';
import 'package:ecommerce_app/Screens/HomeScreen/Views/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(GetMaterialApp(home: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const SplashScreen(),
    );
  }
}
