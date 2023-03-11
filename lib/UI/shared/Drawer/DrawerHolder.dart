import 'package:ecommerce_app/UI/shared/Drawer/MainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../NavigationMenu.dart';

class DrawerHolder extends StatelessWidget {
  const DrawerHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: MainDrawer(),
      mainScreen: NavigationMenu(
        currIndex: 0,
      ),
      borderRadius: 24.0,
      angle: 0,
      showShadow: true,
      drawerShadowsBackgroundColor: Colors.grey[300]!,
      menuBackgroundColor: Colors.indigo,
    );
  }
}
