import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../data/api_strings.dart';
import '../data/common_api_call.dart';
import '../data_storage/data_storage_controller.dart';
import '../view/app_common_widgets/common_colors.dart';
import '../view/app_common_widgets/common_progress_indicator.dart';
import '../view/auth/create_profile_screen.dart';
import '../view/home/home_screen.dart';

class OtpController extends GetxController{
  var pinOutPut = ''.obs;

  ///TODO: otp verify api call

  /// TODO: signup api call
  Future<bool> otpVerificationApiCall(body) async {
    try {
      if (otpValidation() == "") {
        ProgressDialog.showProgressDialog(Get.context!);
        var response = await callPostApi(body, verifyOtpUrl);
        if (response["status"] == true) {
          Navigator.of(Get.context!).pop();
      response["profile_exists"]==true?
          Get.offAll(
              const HomeScreen()
          ): Get.offAll(const CreateProfileScreen());
         Get.find<DataStorageLocally>().setUserToken(response["jwt"]);
          Fluttertoast.showToast(
              msg: response["response"], backgroundColor: Colors.green,  textColor: Colors.white);
        } else {
          Navigator.of(Get.context!).pop();
          Fluttertoast.showToast(
              msg: response["response"], backgroundColor: redE2211C,  textColor: Colors.white);
        }
      } else {
        Fluttertoast.showToast(
            msg: otpValidation(),
            backgroundColor: redE2211C,
            textColor: Colors.white
        );
      }
    } catch (e) {
      print("error-->$e");
    }
    return false;
  }

  ///TODO: otp validation
  otpValidation() {
    if (pinOutPut.value == '') {
      return 'Please enter otp!';
    }
    return '';
  }

}