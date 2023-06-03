import 'package:flutter/material.dart';

import '../app_common_widgets/common_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CommonText(
          text: "Welcome Home Screen",
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
