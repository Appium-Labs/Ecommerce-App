import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String label;
  final double verticalMargin;
  final Widget icon;
  const DrawerItem(
      {super.key,
      required this.label,
      required this.verticalMargin,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: verticalMargin),
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Colors.white,
          width: 0.2, // Underline thickness
        ))),
        child: Row(
          children: [
            icon,
            Text(
              label,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ));
  }
}
