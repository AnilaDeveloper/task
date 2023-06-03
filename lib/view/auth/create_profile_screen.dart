import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_assignment/view/app_common_widgets/common_text_field.dart';

import '../../controllers/profile_controller.dart';
import '../app_common_widgets/common_button.dart';
import '../app_common_widgets/common_colors.dart';
import '../app_common_widgets/common_text_widget.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
     body: SafeArea(
       child: Padding(
         padding: const EdgeInsets.fromLTRB(20,35,20,0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             const CommonText(
               text: 'Welcome',
               fontSize: 34,
               color: Colors.black,
               fontWeight: FontWeight.w700,
             ),
             const SizedBox(height: 15),
             const CommonText(
               text: 'Looks like you are new here. Tell us a bit about yourself.',
               fontWeight: FontWeight.w400,
               fontSize: 18,
               color: textLight868686,
               textAlign: TextAlign.start,
             ),
             const SizedBox(height: 25),
             CommonTextFormField(
               controller: profileController.nameController,
               hintText: "Enter Name",
              filled: true,
             ),
             const SizedBox(height: 15),
             CommonTextFormField(
               hintText: "Enter Email",
               filled: true,
               controller: profileController.emailController,
             ),
             const SizedBox(height: 35),
             CommonButton(
               onTap: () async {
                 profileController.profileApiCall();
               //  Get.to(const OtpVerificationScreen());
               },
               text: 'Submit',
               bgColor: redE2211C,
               textColor: Colors.white,
             ),
           ],
         ),
       ),
     ),
    );
  }
}
