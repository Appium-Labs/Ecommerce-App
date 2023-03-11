import 'package:ecommerce_app/Features-Login/Views/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/Drawer/DrawerHolder.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final prefs = GetStorage();

  ///segwr
  @override
  Widget build(BuildContext context) {
    String? id = prefs.read("token");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: id != null ? DrawerHolder() : LoginScreen(),
    );
  }
}
