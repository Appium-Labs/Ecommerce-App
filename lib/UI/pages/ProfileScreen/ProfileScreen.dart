import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:ecommerce_app/Constants.dart';
import 'package:ecommerce_app/Controllers/Profile/ProfileController.dart';
import 'package:ecommerce_app/UI/pages/OrdersScreen/OrderScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 42, vertical: 200),
        child: Obx(
          () => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Profile",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 23),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/svg/Profile.svg"),
                            SizedBox(
                              width: 23,
                            ),
                            Text(
                                profileController.user.value.name == null ||
                                        profileController.user.value.name == ""
                                    ? "Please update your name"
                                    : (profileController.user.value.name!),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/svg/Location.svg"),
                            SizedBox(
                              width: 23,
                            ),
                            Flexible(
                              child: Text(
                                profileController.user.value.shipping_address ==
                                            null ||
                                        profileController
                                                .user.value.shipping_address ==
                                            ""
                                    ? "Please update your address"
                                    : (profileController
                                        .user.value.shipping_address!),
                                // softWrap: true,
                                // overflow: TextOverflow.fade,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                GestureDetector(
                  onTap: () {
                    TextEditingController name = TextEditingController();
                    TextEditingController address = TextEditingController();
                    Get.dialog(
                      Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: MediaQuery.of(context).size.height / 2,
                            // color: Colors.white,
                            padding: EdgeInsets.all(16),
                            child: Center(
                                child: Obx(
                              () => Stack(
                                alignment: Alignment.center,
                                children: [
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextField(
                                          controller: name,
                                          scrollPadding: EdgeInsets.all(0),
                                          cursorColor: primaryColor,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontSize: 17),
                                          decoration: const InputDecoration(
                                              hintText: "Enter your name",
                                              isDense: true,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                              border: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: primaryColor)),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              primaryColor))),
                                        ),
                                        TextField(
                                          controller: address,
                                          scrollPadding: EdgeInsets.all(0),
                                          cursorColor: primaryColor,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontSize: 17),
                                          decoration: const InputDecoration(
                                              hintText: "Enter your address",
                                              isDense: true,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                              border: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: primaryColor)),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              primaryColor))),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              if (name.text != "" ||
                                                  address.text != "") {
                                                profileController
                                                    .isLoading.value = true;
                                                profileController.user.value
                                                    .name = name.text;
                                                profileController.user.value
                                                        .shipping_address =
                                                    address.text;

                                                profileController.updateUser();
                                                Future.delayed(
                                                    const Duration(seconds: 3),
                                                    () {
                                                  Get.back();
                                                });
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                color: primaryColor,
                                              ),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              child: Text(
                                                "Update my info",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                        GestureDetector(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                            ),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            child: Text(
                                              "Close",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )
                                      ]),
                                  (profileController.isLoading.value == true)
                                      ? CircularProgressIndicator()
                                      : Container(),
                                ],
                              ),
                            )),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Card(
                    text: "Edit Profile",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(OrdersScree());
                  },
                  child: Card(
                    text: "Order history",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  String? text;
  Card({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 23),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          text!,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              fontFamily: "SF Pro Text"),
        ),
        SvgPicture.asset("assets/svg/left.svg"),
      ]),
    );
  }
}
