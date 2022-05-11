import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:querier/admin/admin_dashboard.dart';

import 'package:querier/auth/signup.dart';
import 'package:querier/receiver/receiver_dashboard.dart';
import 'package:querier/sender/sender_dashboard.dart';

import 'package:querier/widgets/custom_text.dart';
import 'package:querier/widgets/custom_text_field.dart';
import 'package:querier/widgets/size_config.dart';
import 'package:querier/widgets/styles.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
  final _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    emailController.text = "admin@test.com";
    passwordController.text = "123456";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login",
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
                      text: "Welcome back to the Querier",
                      color: lightGrey,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: emailController,
                  labelText: "Email",
                  obscureText: false,
                  hintText: "abc@domain.com",
                  validator: emailValidator,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                    controller: passwordController,
                    labelText: "Password",
                    hintText: "123",
                    obscureText: obscurePassword,
                    validator: passwordValidator,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                      child: Icon(
                        obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        semanticLabel:
                            obscurePassword ? 'hide password' : 'show password',
                      ),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Forgot password?", color: primaryColor)
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                    onTap: () {
                      if (emailController.text == "sender@test.com" &&
                          passwordController.text == "123456") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SenderDashboard()));
                      } else if (emailController.text == "receiver@test.com" &&
                          passwordController.text == "123456") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ReceiverDashboard()));
                      } else if (emailController.text == "admin@test.com" &&
                          passwordController.text == "123456") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdminDashboard()));
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: const CustomText(
                        text: "Login",
                        color: Colors.white,
                      ),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(text: "Do not have credentials? "),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Signup(),
                          ),
                        );
                      },
                      child: CustomText(
                          text: "Request Credentials! ", color: primaryColor),
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

  // void loginUser() {
  //   final _isValid = _formKey.currentState!.validate();
  //   if (_isValid) {
  //     loginController.loginWithDetails(
  //         emailController.text, passwordController.text);
  //   }
  // }
}
