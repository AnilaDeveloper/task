import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_assignment/controllers/sign_in_controller.dart';
import '../app_common_widgets/common_button.dart';
import '../app_common_widgets/common_colors.dart';
import '../app_common_widgets/common_phone_field.dart';
import '../app_common_widgets/common_text_widget.dart';

class SigInScreen extends StatelessWidget {
   SigInScreen({Key? key}) : super(key: key);
   SignInController signInController = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                 Obx(() => Padding(
                   padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       const CommonText(
                         text: 'Get Started',
                         fontSize: 24,
                         color: Colors.black,
                         fontWeight: FontWeight.w700,
                       ),
                       const SizedBox(height: 20,),
                       PhoneField(
                         phoneController: signInController.mobileNumber,
                         countryCode:signInController.countryCode.value ,
                         countryFlag: signInController.countryFlag.value,
                         onCountryFlag: (value) {
                           signInController.countryFlag.value = value;
                           print('Country flag ---> $value');
                         },
                         onCodeChange: (value) {
                           signInController.countryCode.value=value;
                           // print('Country Code ---> $value');
                           // print(
                           //     'Country Code Controller Value ---> ${loginController.countryCode.value}');
                         },
                         textFieldColor: red0FE2211C,
                       ),
                       const SizedBox(height: 15),
                       const Center(
                         child: CommonText(
                           text: 'A 4 digit code will be sent to this number.',
                           fontWeight: FontWeight.w400,
                           fontSize: 14,
                           color: textLight868686,
                           textAlign: TextAlign.center,
                         ),
                       ),
                       const SizedBox(height: 30),
                       // loginController.isLoading.value == true
                       //     ? const Center(
                       //     child: CircularProgressIndicator(
                       //       color: redE2211C,
                       //     ))
                       //     :
                       CommonButton(
                         onTap: () async {
                           signInController.signUpApiCall(
                             {"mobile":signInController.mobileNumber.text.trim().toString()
                             }
                           );
                         },
                         text: 'Continue',
                         bgColor: redE2211C,
                         textColor: Colors.white,
                       ),


                     ],
                   ),
                 ))
              ,
            ],
          ),
        ),
      ),
    );
  }
}
