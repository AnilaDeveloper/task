import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_assignment/data/common_api_call.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_assignment/view/app_common_widgets/common_colors.dart';
import '../data/api_strings.dart';
import '../view/app_common_widgets/common_progress_indicator.dart';
import '../view/auth/otp_verification_screen.dart';

class SignInController extends GetxController {
  var countryCode = '91'.obs;
  var countryFlag = '🇮🇳'.obs;
  var mobileNumber = TextEditingController();

  /// TODO: signup api call
  Future<bool> signUpApiCall(body) async {
    try {
      if (signUpValidation() == "") {
        ProgressDialog.showProgressDialog(Get.context!);
        var response = await callPostApi(body, singUpUrl);
        if (response["status"] == true) {
          Navigator.of(Get.context!).pop();
          Get.offAll(
            OtpVerificationScreen(
              mobileNumber: "+$countryCode${mobileNumber.value.text}",
              requestId: response["request_id"],
            ),
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
            msg: signUpValidation(),
            backgroundColor: redE2211C,
            textColor: Colors.white);
      }
    } catch (e) {
      print("error-->$e");
    }
    return false;
  }

  ///TODO: signup validation
  signUpValidation() {
    if (!GetUtils.isPhoneNumber(mobileNumber.value.text.trim())) {
      return "Enter Valid PhoneNumber";
    } else {
      return "";
    }
  }
}
