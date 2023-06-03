import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:task_assignment/data/api_strings.dart';
import '../data/common_api_call.dart';
import '../data_storage/data_storage_controller.dart';
import '../view/app_common_widgets/common_colors.dart';
import '../view/app_common_widgets/common_progress_indicator.dart';
import '../view/home/home_screen.dart';

class ProfileController extends GetxController{
  var nameController = TextEditingController();
  var emailController = TextEditingController();


  /// TODO: profile api call
  Future<bool> profileApiCall() async {
    try {
      if (profileValidation() == "") {
        ProgressDialog.showProgressDialog(Get.context!);
        var response = await callPostApi({
          "name" : nameController.text.trim(),
          "email" : emailController.text.trim()
        }, createProfileUrl, token:  Get.find<DataStorageLocally>().token);
        if (response["status"] == true) {
          Navigator.of(Get.context!).pop();
          Get.offAll(
              const HomeScreen()
          );
          Fluttertoast.showToast(
              msg: response["response"],
              backgroundColor: Colors.green,
              textColor: Colors.white);
        } else {
          Navigator.of(Get.context!).pop();
          Fluttertoast.showToast(
              msg: response["response"],
              backgroundColor: redE2211C,
              textColor: Colors.white);
        }
      } else {
        Fluttertoast.showToast(
            msg: profileValidation(),
            backgroundColor: redE2211C,
            textColor: Colors.white);
      }
    } catch (e) {
      print("error-->$e");
    }
    return false;
  }

  ///TODO: profile validation

  profileValidation() {
    if(nameController.text.trim().isEmpty){
      return "Enter your Name!";
    }
    else if (!GetUtils.isEmail(
       emailController.value.text.trim())) {
      return 'please enter valid email!';
    } else {
      return "";
    }
  }
}