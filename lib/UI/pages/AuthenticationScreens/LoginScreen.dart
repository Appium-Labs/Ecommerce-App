import 'package:ecommerce_app/Constants.dart';
import 'package:ecommerce_app/UI/shared/Drawer/DrawerHolder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../Controllers/Authentication/LoginController.dart';

// Obx(()=>LoginContainer());
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UpperContainer(),
                    (loginController.pageState.value == "LOGIN"
                        ? LoginContainer()
                        : SignupContainer())
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UpperContainer extends StatelessWidget {
  const UpperContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset('assets/svg/Ellipse_21.svg'),
            ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: SvgPicture.asset('assets/svg/Ellipse_19.svg')),
          ],
        ),
        Text(
          "Welcome back",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w800, fontSize: 55),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              'assets/svg/Ellipse_21.svg',
            ),
          ],
        ),
      ]),
    );
  }
}

class LoginContainer extends StatelessWidget {
  final loginController = Get.find<LoginController>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final prefs = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      height: MediaQuery.of(context).size.height / 1.6,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 36),
        child: Obx(
          () => loginController.isLoginButtonClicked.value == true
              ? Center(
                  child: CircularPercentIndicator(
                      radius: 130.0,
                      animation: true,
                      animationDuration: 3000,
                      lineWidth: 15.0,
                      percent: 1,
                      center: Text(
                        "Checking Credentials",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      circularStrokeCap: CircularStrokeCap.butt,
                      backgroundColor: Colors.yellow,
                      progressColor: primaryColor),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 44,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/Message.svg',
                            // color: Color(0xff868686),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff868686)),
                          )
                        ],
                      ),
                      TextFormField(
                        controller: emailController,
                        scrollPadding: EdgeInsets.all(0),
                        cursorColor: primaryColor,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 17),
                        decoration: const InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor))),
                      ),
                      SizedBox(height: 34),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/Lock.svg',
                            // color: Color(0xff868686),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Text(
                            "Password",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff868686)),
                          )
                        ],
                      ),
                      Obx(
                        () => TextFormField(
                          controller: passwordController,
                          obscureText: loginController.hidePassword.value,
                          cursorColor: primaryColor,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 17),
                          decoration: InputDecoration(
                              suffix: GestureDetector(
                                onTap: () {
                                  loginController.hidePassword.value =
                                      !loginController.hidePassword.value;
                                },
                                child: Text(
                                  loginController.hidePassword.value == true
                                      ? "Show"
                                      : "Hide",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor))),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          print(emailController.text);
                          print(emailController.value);
                          if (emailController.text == "" ||
                              passwordController.text == "") {
                            Get.snackbar("Invalid request!",
                                "Please enter the correct details");
                          } else {
                            loginController.isLoginButtonClicked.value = true;
                            loginController.user.value.email =
                                emailController.text;
                            loginController.user.value.password =
                                passwordController.text;
                            loginController.loginUser(
                                emailController.text, passwordController.text);
                            Future.delayed(const Duration(seconds: 3), () {
                              if (loginController.statusCode.value == 201) {
                                // prefs.write("token",
                                //     loginController.user.value.sId!.toString());
                                print("here -------------------");
                                Get.offAll(DrawerHolder());
                                loginController.isLoginButtonClicked.value =
                                    false;
                              } else {
                                loginController.isLoginButtonClicked.value =
                                    false;
                                Get.snackbar("Something went wrong",
                                    "Invalid Password or email");
                              }
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 22),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      GestureDetector(
                        onTap: () {
                          loginController
                              .changePageState(loginController.pageState.value);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Text(
                            "Create account",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          ),
                        ),
                      )
                    ]),
        ),
      ),
    );
  }
}

class SignupContainer extends StatelessWidget {
  final loginController = Get.find<LoginController>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final prefs = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      height: MediaQuery.of(context).size.height / 1.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 36),
        child: Obx(
          () => loginController.isLoginButtonClicked.value == true
              ? Center(
                  child: CircularPercentIndicator(
                    radius: 130.0,
                    animation: true,
                    animationDuration: 3000,
                    lineWidth: 15.0,
                    percent: 1,
                    center: Text(
                      "Checking Credentials",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.butt,
                    backgroundColor: Colors.yellow,
                    progressColor: primaryColor,
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 34,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/Message.svg',
                            // color: Color(0xff868686),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff868686)),
                          )
                        ],
                      ),
                      TextFormField(
                        controller: emailController,
                        cursorColor: primaryColor,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 17),
                        decoration: const InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor))),
                      ),
                      SizedBox(height: 34),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/Profile.svg',
                            color: Color(0xff868686),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Text(
                            "Username",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff868686)),
                          )
                        ],
                      ),
                      TextFormField(
                        controller: nameController,
                        cursorColor: primaryColor,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 17),
                        decoration: const InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor))),
                      ),
                      SizedBox(height: 34),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/Lock.svg',
                            // color: Color(0xff868686),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Text(
                            "Password",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff868686)),
                          )
                        ],
                      ),
                      Obx(
                        () => TextFormField(
                          controller: passwordController,
                          obscureText: loginController.hidePassword.value,
                          cursorColor: primaryColor,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 17),
                          decoration: InputDecoration(
                              suffix: GestureDetector(
                                onTap: () {
                                  loginController.hidePassword.value =
                                      !loginController.hidePassword.value;
                                },
                                child: Text(
                                  loginController.hidePassword.value == true
                                      ? "Show"
                                      : "Hide",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor))),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {
                          if (emailController.text == "" ||
                              passwordController.text == "") {
                            Get.snackbar("Invalid request!",
                                "Please enter the correct details");
                          } else {
                            print("fg");
                            loginController.isLoginButtonClicked.value = true;
                            loginController.user.value.email =
                                emailController.text;
                            loginController.user.value.password =
                                passwordController.text;
                            loginController.user.value.name =
                                nameController.text;
                            loginController.signUpUser(emailController.text,
                                passwordController.text, nameController.text);
                            Future.delayed(const Duration(seconds: 3), () {
                              if (loginController.statusCode.value == 201) {
                                // prefs.write("token",
                                //     loginController.user.value.sId.toString());
                                Get.offAll(DrawerHolder());
                              } else {
                                loginController.isLoginButtonClicked.value =
                                    false;
                                Get.snackbar("Something went wrong",
                                    "User already exists");
                              }
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 22),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: Text(
                            "Signup",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      GestureDetector(
                        onTap: () {
                          loginController
                              .changePageState(loginController.pageState.value);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Text(
                            "Already have an account?",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          ),
                        ),
                      )
                    ]),
        ),
      ),
    );
    ;
  }
}
