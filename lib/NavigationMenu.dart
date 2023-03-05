import 'package:ecommerce_app/Screens/CartScreen/CartScreen.dart';
import 'package:ecommerce_app/Screens/FavoritesScreen/FavoritesScreen.dart';
import 'package:ecommerce_app/Screens/HomeScreen/Views/HomeScreen.dart';
import 'package:ecommerce_app/Screens/ProfileScreen/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//erhewr

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _index = 0;
  final screens = [
    HomeScreen(),
    FavorittesScreen(),
    ProfileScreen(),
    CartScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_index],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            iconSize: 30,
            onTap: (i) {
              setState(() {
                _index = i;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/Heart.svg"),
                  label: "",
                  backgroundColor: Color(0xffF2F2F2)),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/Heart.svg"),
                  label: "",
                  backgroundColor: Color(0xffF2F2F2)),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/Profile.svg"),
                  label: "",
                  backgroundColor: Color(0xffF2F2F2)),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/Buy.svg"),
                  label: "",
                  backgroundColor: Color(0xffF2F2F2))
            ]));
  }
}
