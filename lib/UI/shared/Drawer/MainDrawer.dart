import 'package:ecommerce_app/UI/pages/OrdersScreen/OrderScreen.dart';
import 'package:ecommerce_app/UI/shared/Drawer/DrawerItem.dart';
import 'package:ecommerce_app/UI/pages/AuthenticationScreens/LoginScreen.dart';
import 'package:ecommerce_app/UI/pages/AuthenticationScreens/SplashScreen.dart';
import 'package:ecommerce_app/Models/UserModel.dart';
import 'package:ecommerce_app/UI/shared/NavigationMenu.dart';
import 'package:ecommerce_app/UI/pages/CartScreen/CartScreen.dart';
import 'package:ecommerce_app/UI/pages/FavoritesScreen/FavoritesScreen.dart';
import 'package:ecommerce_app/UI/pages/ProfileScreen/ProfileScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = GetStorage();
    return Scaffold(
      backgroundColor: Color(0xff5956E),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              GestureDetector(
                onTap: () {
                  ZoomDrawer.of(context)!.toggle();
                  Get.to(ProfileScreen());
                },
                child: DrawerItem(
                    label: "Profile",
                    verticalMargin: 10,
                    icon: IconButton(
                      icon: SvgPicture.asset("assets/icons/Profile_white.svg"),
                      onPressed: () {},
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(OrdersScree());
                },
                child: DrawerItem(
                    label: "My Orders",
                    verticalMargin: 10,
                    icon: IconButton(
                      icon: SvgPicture.asset("assets/icons/Bag_white.svg"),
                      onPressed: () {},
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(CartScreen());
                },
                child: DrawerItem(
                    label: "Cart",
                    verticalMargin: 10,
                    icon: IconButton(
                      icon: SvgPicture.asset("assets/icons/Buy_white.svg"),
                      onPressed: () {},
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(FavorittesScreen());
                },
                child: DrawerItem(
                    label: "Favorites",
                    verticalMargin: 10,
                    icon: IconButton(
                      icon: SvgPicture.asset("assets/icons/Heart_white.svg"),
                      onPressed: () {},
                    )),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  prefs.remove("token");
                  Get.deleteAll();
                  Get.offAll(SplashScreen());
                },
                child: DrawerItem(
                    label: "LogOut",
                    verticalMargin: 100,
                    icon: IconButton(
                      icon: SvgPicture.asset("assets/icons/Logout_white.svg"),
                      onPressed: () {},
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
