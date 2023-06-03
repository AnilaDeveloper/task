import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:task_assignment/view/auth/sign_in_view.dart';
import '../../controllers/otp_controller.dart';
import '../app_common_widgets/common_button.dart';
import '../app_common_widgets/common_colors.dart';
import '../app_common_widgets/common_text_widget.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String? mobileNumber;
  final String ? requestId;
  const OtpVerificationScreen({Key? key, this.mobileNumber, this.requestId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OtpController controller = Get.put(OtpController());
    return Scaffold(
       body: SafeArea(
         child: SingleChildScrollView(
           child: Column(
             children: <Widget>[
               Stack(
                 children: [
                   Image.asset(
                     "assets/images/mobile_sign_in_screen_background.png",
                     height: 247,
                   ),
                   Image.asset(
                     "assets/images/mobile_sign_in_screen.png",
                     height: 247,
                   ),
                 ],
               ),
               const SizedBox(height: 35),
               const Padding(
                 padding: EdgeInsets.only(top: 20),
               ),
               const CommonText(
                 text: 'Enter the 4 digit code sent to',
                 fontWeight: FontWeight.w400,
                 fontSize: 18,
                 color: textDark3F3E3E,
               ),
               const SizedBox(height: 5),
               CommonText(
                 text: mobileNumber,
                 fontWeight: FontWeight.w500,
                 color: black000000,
                 fontSize: 22,
               ),
               const SizedBox(height: 40),
               PinBoxWidget(),
               const SizedBox(height: 38),

               // otpController.isLoading.value == true
               //     ? const Center(
               //     child: CircularProgressIndicator(
               //       color: redE2211C,
               //     ),)
               //     :
               Container(
                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
                 child: CommonButton(
                   onTap: ()  {
                     controller.otpVerificationApiCall({
                       "request_id" :requestId,
                       "code" : controller.pinOutPut.value
                     });

                   },
                   text: 'Verify',
                   bgColor: redE2211C,
                   textColor: Colors.white,
                 ),
               ),

               const SizedBox(height: 20),
               InkWell(
                 onTap: ()  {
                  Get.offAll(SigInScreen());
                 },
                 child: const CommonText(
                   text: 'Retry',
                   decoration: TextDecoration.underline,
                   color: redE2211C,
                   fontSize: 16,
                   fontWeight: FontWeight.w400,
                 ),
               ),

             ],
           ),
         ),
       ),
    );
  }
}

class PinBoxWidget extends StatelessWidget {
  OtpController controller = Get.find();

  PinBoxWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // PIN INPUT BOX
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
      ),
      child: Pinput(
        // controller: controller.otp,
        length: 6,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        defaultPinTheme: const PinTheme(
          width: 64,
          height: 75,
          decoration: BoxDecoration(color: otpFieldFDF4F3),
          textStyle: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 40, color: black000000),
        ),
        onCompleted: (pin) {
         controller.pinOutPut.value = pin;
        },
        onChanged: (newValue) {
          print(newValue);
        },
      ),
    );
  }
}
