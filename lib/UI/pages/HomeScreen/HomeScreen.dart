import 'package:ecommerce_app/Controllers/Products/ProductController.dart';
import 'package:ecommerce_app/UI/pages/HomeScreen/ProductCard.dart';
import 'package:ecommerce_app/UI/shared/Loading.dart';
import 'package:ecommerce_app/UI/pages/HomeScreen/AllProductsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../../Controllers/Products/CategoryController.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    CategoryController controller = Get.put(CategoryController());
    ProductController productController = Get.put(ProductController());
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: Obx(
          () => productController.products.length == 0
              ? Loading()
              : CustomScrollView(
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
                              icon:
                                  SvgPicture.asset("assets/icons/MenuIcon.svg"),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: TextField(
                              decoration: InputDecoration(
                                  prefixIconConstraints:
                                      BoxConstraints(maxHeight: 30),
                                  prefixIcon: Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: SvgPicture.asset(
                                          "assets/icons/Search.svg")),
                                  contentPadding: const EdgeInsets.all(18),
                                  label: Container(
                                    margin: const EdgeInsets.only(
                                        left: 8.0, top: 1),
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
                        margin: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 30),
                        child: const Text(
                          "Check-Out Our Latest Products",
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
                                    controller.updateIndex(
                                        controller.list[index].name.toString());
                                    print(index);
                                  },
                                  child: Container(
                                    decoration: controller
                                            .list[index].isSelected.value
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
                                          color: controller
                                                  .list[index].isSelected.value
                                              ? Colors.purple
                                              : Colors.grey,
                                          fontWeight: controller
                                                  .list[index].isSelected.value
                                              ? FontWeight.bold
                                              : FontWeight.w400),
                                    ),
                                  ),
                                ));
                          }),
                    )),
                    SliverToBoxAdapter(
                        child: Obx(
                      () => Container(
                        height: 350,
                        margin: const EdgeInsets.only(left: 10, top: 20),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: productController.products.length,
                            itemBuilder: (context, index) {
                              return Obx(
                                () => Padding(
                                  padding: productController
                                              .products[index].category
                                              .toString() ==
                                          controller.catIndex.toString()
                                      ? EdgeInsets.all(8.0)
                                      : EdgeInsets.all(0.0),
                                  child: productController
                                              .products[index].category
                                              .toString() ==
                                          controller.catIndex.toString()
                                      ? GestureDetector(
                                          onTap: () {},
                                          child: ProductCard(
                                            product: productController
                                                .products[index],
                                          ),
                                        )
                                      : null,
                                ),
                              );
                            }),
                      ),
                    )),
                    SliverToBoxAdapter(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(AllProductsScreen());
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                "Show More -",
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ));
  }
}
