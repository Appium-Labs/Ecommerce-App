import 'package:flutter/material.dart';

import 'DioRequest.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DioRequest d = DioRequest();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
              onTap: () {
                print("clicked");
                d.GET("test/api");
              },
              child: Text("Hello world"))),
    );
  }
}
