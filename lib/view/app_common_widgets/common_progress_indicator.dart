import 'package:flutter/material.dart';

import 'common_colors.dart';

class ProgressDialog {
  static void showProgressDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      elevation: 0,
      content: Center(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
                color: redE2211C,
              ),
            ],
          ),
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(onWillPop: () async => true, child: alert);
      },
    );
  }
}