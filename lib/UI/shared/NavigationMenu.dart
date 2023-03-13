import 'package:ecommerce_app/Constants.dart';
import 'package:ecommerce_app/UI/pages/CartScreen/CartScreen.dart';
import 'package:ecommerce_app/UI/pages/FavoritesScreen/FavoritesScreen.dart';
import 'package:ecommerce_app/UI/pages/HomeScreen/HomeScreen.dart';
import 'package:ecommerce_app/UI/pages/ProfileScreen/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//erhewr

class NavigationMenu extends StatefulWidget {
  int currIndex;
  NavigationMenu({super.key, required this.currIndex});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _index = 0;
  final screens = [
    const HomeScreen(),
    FavorittesScreen(),
    ProfileScreen(),
    CartScreen()
  ];

  @override
  void initState() {
    super.initState();
    _index = widget.currIndex;
  }

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
                  activeIcon: Container(
                    child: SvgPicture.asset(
                      "assets/svg/Home.svg",
                      color: primaryColor,
                    ),
                  ),
                  icon: SvgPicture.asset("assets/svg/Home.svg"),
                  label: "",
                  backgroundColor: Color(0xffF2F2F2)),
              BottomNavigationBarItem(
                  activeIcon: Container(
                    child: SvgPicture.asset(
                      "assets/icons/Heart.svg",
                      color: primaryColor,
                    ),
                  ),
                  icon: SvgPicture.asset("assets/icons/Heart.svg"),
                  label: "",
                  backgroundColor: Color(0xffF2F2F2)),
              BottomNavigationBarItem(
                  activeIcon: Container(
                    child: SvgPicture.asset(
                      "assets/icons/Profile.svg",
                      color: primaryColor,
                    ),
                  ),
                  icon: SvgPicture.asset("assets/icons/Profile.svg"),
                  label: "",
                  backgroundColor: Color(0xffF2F2F2)),
              BottomNavigationBarItem(
                  activeIcon: Container(
                    child: SvgPicture.asset(
                      "assets/icons/Buy.svg",
                      color: primaryColor,
                    ),
                  ),
                  icon: SvgPicture.asset("assets/icons/Buy.svg"),
                  label: "",
                  backgroundColor: Color(0xffF2F2F2))
            ]));
  }
}
