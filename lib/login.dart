import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:querier/dashboard.dart';
import 'package:querier/signup.dart';

import 'package:querier/widgets/CustomText.dart';
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
  //LoginController loginController = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // emailController.text = "eve.holt@reqres.in";
    // passwordController.text = "cityslicka";
   // loginController.isLoginRoute.value = true;
    super.initState();
   // print(loginController.isLoginRoute.value);
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
     // drawer: LoginSideMenu(),
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
                    // Expanded(
                    //   flex: 1,
                    //   child: Container(
                    //     // width: MediaQuery.of(context).size.width / 3,

                    //     // padding: const EdgeInsets.only(right: 12),
                    //     child: Image.asset(
                    //       "assets/images/pro_wear.png",
                    //       fit: BoxFit.cover,
                    //       height: 100,
                    //       // width: 300,
                    //     ),
                    //   ),
                    // ),
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
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        const CustomText(
                          text: "Remeber Me",
                        ),
                      ],
                    ),
                    CustomText(text: "Forgot password?", color: primaryColor)
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                    onTap: () {
                      // Get.offAllNamed(routeHome);
                      // loginUser();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                    },
                    child: Container(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          padding:
                          const EdgeInsets.symmetric(vertical: 16),
                          child: const CustomText(
                            text: "Login",
                            color: Colors.white,
                          ),
                        )
                           ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(text: "Do not have credentials? "),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
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
