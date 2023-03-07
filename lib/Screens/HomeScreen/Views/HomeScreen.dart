import 'package:ecommerce_app/Screens/HomeScreen/Controller/CategoryController.dart';
import 'package:ecommerce_app/Screens/HomeScreen/Views/ProductCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    CategoryController controller = Get.put(CategoryController());
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 120,
            title: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 10),
                  child: IconButton(
                    onPressed: () => ZoomDrawer.of(context)!.toggle(),
                    iconSize: 12,
                    icon: SvgPicture.asset("assets/icons/MenuIcon.svg"),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIconConstraints: BoxConstraints(maxHeight: 30),
                        prefixIcon: Container(
                            margin: EdgeInsets.only(left: 15),
                            child: SvgPicture.asset("assets/icons/Search.svg")),
                        contentPadding: const EdgeInsets.all(18),
                        label: Container(
                          margin: const EdgeInsets.only(left: 8.0, top: 1),
                          child: const Text(
                            "Search",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.black))),
                  ),
                ),
              ],
            ),
            // leading:
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: const Text(
                "CheckOut Our Latest Products",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
            height: 30,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.list.length,
                itemBuilder: (context, index) {
                  return Obx(() => GestureDetector(
                        onTap: () {
                          controller.onTapped(index);
                          print(index);
                        },
                        child: Container(
                          decoration: controller.list[index].isSelected.value
                              ? const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                  color: Colors.purple,
                                  width: 1.2, // Underline thickness
                                )))
                              : BoxDecoration(),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: Text(
                            controller.list[index].name,
                            style: TextStyle(
                                color: controller.list[index].isSelected.value
                                    ? Colors.purple
                                    : Colors.grey,
                                fontWeight:
                                    controller.list[index].isSelected.value
                                        ? FontWeight.bold
                                        : FontWeight.w400),
                          ),
                        ),
                      ));
                }),
          )),
          SliverToBoxAdapter(
              child: Container(
            height: 350,
            margin: const EdgeInsets.only(left: 40, top: 20),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: ProductCard(),
                    ),
                  );
                }),
          )),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "Show More -",
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
