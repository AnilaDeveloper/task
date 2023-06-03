import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_assignment/view/auth/sign_in_view.dart';

import 'data_storage/data_storage_controller.dart';

void main() async{
  await GetStorage.init();
  DataStorageLocally dataStorageLocally = Get.put(DataStorageLocally());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:  SigInScreen(),
    );
  }
}

