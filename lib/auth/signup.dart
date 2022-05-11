import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:querier/controllers/register_controller.dart';

import 'package:querier/widgets/custom_text.dart';
import 'package:querier/widgets/custom_text_field.dart';
import 'package:querier/widgets/styles.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  RegisterController registerController = Get.find();
  final _formKey = GlobalKey<FormState>();
  get usernameValidator => (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your Username';
        }
        return null;
      };
  get emailValidator => (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your Email';
        }
        return null;
      };
  get passwordValidator => (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your Password';
        }
        return null;
      };
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Container()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Register",
                        style: GoogleFonts.raleway(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Create Your Account for Querier.",
                      color: lightGrey,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: usernameController,
                  validator: usernameValidator,
                  labelText: "Username",
                  hintText: "John Doe",
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: emailController,
                  validator: emailValidator,
                  labelText: "Email",
                  hintText: "abc@domain.com",
                ),
                const SizedBox(
                  height: 15,
                ),
                // CustomTextField(
                //   controller: phoneController,
                //   labelText: "Phone Number",
                //   hintText: "+92 3001234567",
                //   keyboardType: TextInputType.number,
                // ),
                // const SizedBox(
                //   height: 15,
                // ),
                CustomTextField(
                  obscureText: true,
                  controller: passwordController,
                  validator: passwordValidator,
                  labelText: "Password",
                  hintText: "123",
                ),
                const SizedBox(
                  height: 15,
                ),
                // CustomTextField(
                //   controller: confirmPasswordController,
                //   labelText: "Confirm Password",
                //   hintText: "123",
                // ),
                // const SizedBox(
                //   height: 15,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [],
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                    onTap: () {
                      registerUser();
                    },
                    child: GetX<RegisterController>(
                        builder: (_) => registerController
                                    .isDataSubmitting.value ==
                                false
                            ? Container(
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(20)),
                                alignment: Alignment.center,
                                width: double.maxFinite,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: const CustomText(
                                  text: "Register",
                                  color: Colors.white,
                                ),
                              )
                            : CircularProgressIndicator())),

                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(text: "Already have the credentials? "),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                          CustomText(text: "Let's Query", color: primaryColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void registerUser() {
    final _isValid = _formKey.currentState!.validate();
    if (_isValid) {
      registerController.loginWithDetails(usernameController.text,
          emailController.text, passwordController.text);
    }
  }
}
