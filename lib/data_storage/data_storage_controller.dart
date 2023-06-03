import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DataStorageLocally extends GetxController{
  GetStorage box = GetStorage();

  var _token = '';
  get token => _token;
  init() async {
    _token = box.read("token_string") ?? '';
  }

  void setUserToken(String value) {
    _token = value;
    setPref("token_string", value);
  }

  void setPref(String key, dynamic value) async {
    await box.write(key, value);
  }

  getPref(String key) async {
    await box.read(key);
  }

}