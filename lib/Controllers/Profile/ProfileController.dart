import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:ecommerce_app/Constants.dart';
import 'package:ecommerce_app/Models/User.dart';
import 'package:ecommerce_app/Models/UserModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../NetworkLayer/NetworkCalls.dart';

class ProfileController extends GetxController {
  Rx<ImagePicker> imagePicker = ImagePicker().obs;
  RxString imagePath = "".obs;
  RxString base64String = "".obs;
  RxBool isLoading = false.obs;
  final user = User().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    updateUser();
  }

  openImage() async {
    try {
      var pickedFile =
          await imagePicker.value.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imagePath.value = pickedFile.path;
        print(imagePath);
        XFile file = XFile(imagePath.value.toString());
        Uint8List imageBytes = await file.readAsBytes();
        print(imageBytes);
        base64String.value = base64Encode(imageBytes);
        print(base64String);
        return 1;
      } else {
        print("no image selected");
        return -1;
      }
    } catch (e) {
      print("error in image file");
      print(e);
      return -1;
    }
  }

  updateUser() async {
    try {
      isLoading.value = true;
      final prefs = GetStorage();
      String? token = prefs.read("token").toString();
      print("--------");
      print(token);
      Map<String, dynamic> req = user.toJson();
      print(req);
      req.removeWhere((key, value) {
        return value == null;
      });
      // req.re
      print(req);
      // print(req);
      await updateUserResponse(BASE_URL + "/api/users/profile/${token}", req)
          .then((value) {
        user.value = value.user!;
      });
      isLoading.value = false;

      // print(updateUser.user!.email);
    } on Exception catch (e) {
      print(e);
    }
  }
}
