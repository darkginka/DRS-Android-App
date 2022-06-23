import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';

class Utils {
  static Future<Response> httpGet(String uri, BuildContext context) async {
    Response response = await get(Uri.parse(uri));
    return response;
  }

  static Future<Response> httpPost(
      String uri, String dname, BuildContext context) async {
    Response response = await post(Uri.parse(uri), body: {"disease": dname});
    return response;
  }

  static String formatDate(DateTime date, String format) {
    DateFormat formatter = DateFormat(format);
    return formatter.format(date);
  }

  static stringToDouble(String? string) {
    final value = double.parse(string!);
    return value;
  }

  static isValidEmail(String email) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(email);
  }
}
