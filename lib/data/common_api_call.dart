import 'dart:convert';

import 'package:http/http.dart';

Future<dynamic> callPostApi(Map<String, dynamic>? body,  url,
    {bool isToken = false,
      String? token,}) async {
  Map<String, String> withToken;

  withToken = {
    "Content-Type": "application/json",
    "Token": "$token",
  };

  print(
      'API Request Header ------------------------------->\n ${jsonEncode(withToken)}');

  print('URL Request ------------------------------->\n $url');
  print('API Request ------------------------------->\n ${(body)}');
  try {
    var response = await post(
      Uri.parse(url),
      body:jsonEncode(body),
      headers: withToken,
    );
    if (response.statusCode == 200) {
      print(
          'API response ------------------------------->\n ${response.statusCode}');

      print(
          'API response ------------------------------->\n ${response.body}');

      print(
          'API final body ------------------------------->\n ${response.body.toString()}');

      print(
          'API request Header ------------------------------->\n ${response.headers}');
      print('Run Successfully!!!!!');
      return jsonDecode(response.body);
    }

    else {
      print('<===== Error <====>  ====>');
    }
  } catch (e) {
    print("========> Responses Error ${e.toString()}");
  }
  return;
}