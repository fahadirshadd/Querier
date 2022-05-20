import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:querier/helpers/route_helper.dart';
import 'package:querier/models/custom_web_services.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var isDataSubmitting = false.obs;
  var isLoginRoute = false.obs;
  var isDataReadingCompleted = false.obs;
  var isLoggedIn = false.obs;

  void loginWithDetails(String username, String password) async {
    isDataSubmitting.value = true;
    Map<String, dynamic> dataBody = {
      CustomWebServices.username: username,
      CustomWebServices.password: password
    };

    var dataToSend = json.encode(dataBody);

    var response = await http.post(Uri.parse(CustomWebServices.loginUrl),
        body: dataToSend, headers: {"Content-Type": "application/json"});
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      isDataSubmitting.value = false;
      Get.snackbar("Success", "Login Successfully!",
          backgroundColor: Color(0xff24b04b),
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          borderRadius: 10,
          borderWidth: 2,
          maxWidth: 200);
      Map<String, dynamic> responseData = jsonDecode(response.body);

      isDataReadingCompleted.value = true;
      isLoggedIn.value = true;
      Get.offAllNamed(RouteHelper.getAdminRoute());
      // return responseData;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', username);
      prefs.setBool('isLoggedIn', true);
    } else {
      isDataSubmitting.value = false;
      Get.snackbar(
        "Sign Up Failed",
        "API Problem",
        snackPosition: SnackPosition.TOP,
        borderRadius: 10,
        borderWidth: 2,
      );
      isDataSubmitting.value = false;
    }
    isLoginRoute.value = false;
  }

  // function to register the user
  void registerWithDetails(
      String username, String email, String password) async {
    isDataSubmitting.value = true;
    Map<String, dynamic> dataBody = {
      CustomWebServices.username: username,
      CustomWebServices.email: email,
      CustomWebServices.password: password,
    };

    var dataToSend = json.encode(dataBody);

    var response = await http.post(Uri.parse(CustomWebServices.registerUrl),
        body: dataToSend, headers: {"Content-Type": "application/json"});
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 201 || response.statusCode == 200) {
      isDataSubmitting.value = false;
      Get.snackbar("Success", "Register Successfully!",
          backgroundColor: const Color(0xff24b04b),
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          borderRadius: 10,
          borderWidth: 2,
          maxWidth: 200);
      Map<String, dynamic> responseData = jsonDecode(response.body);
      debugPrint("RESPONSE IS ################");
      debugPrint(responseData["isAdmin"]);
      // print(res)

      isDataReadingCompleted.value = true;
      isLoggedIn.value = true;
      if (responseData["isAdmin"] == true) {
        Get.toNamed(RouteHelper.getAdminRoute());
      } else {
        Get.toNamed(RouteHelper.getSenderRoute());
      }
      // return responseData;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', username);
      prefs.setString('email', email);
      prefs.setBool('isAdmin', true);
    } else if (!isEmailValid(email)) {
      Get.snackbar(
        "Register Failed", "Email Id is not valid",
        // backgroundColor: Colors.black,
        snackPosition: SnackPosition.TOP,
        borderRadius: 10,
        borderWidth: 2,
      );
      isDataSubmitting.value = false;
    } else {
      isDataSubmitting.value = false;
      Get.snackbar(
        "Sign Up Failed",
        "API Problem",
        snackPosition: SnackPosition.TOP,
        borderRadius: 10,
        borderWidth: 2,
      );
      isDataSubmitting.value = false;
    }
    isLoginRoute.value = false;
  }

  bool isEmailValid(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }
}
