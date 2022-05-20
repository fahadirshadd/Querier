import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:querier/helpers/route_helper.dart';

import 'package:querier/widgets/custom_text.dart';

import 'package:querier/widgets/styles.dart';

class SenderDashboard extends StatefulWidget {
  const SenderDashboard({Key? key}) : super(key: key);

  @override
  State<SenderDashboard> createState() => _SenderDashboardState();
}

class _SenderDashboardState extends State<SenderDashboard> {
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
    return Scaffold(
      // drawer: LoginSideMenu(),
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            padding: const EdgeInsets.all(24),
            child: ListView(
              children: [
                Column(
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
                        Text("Welcome to Sender Dashboard",
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
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      width: MediaQuery.of(context).size.width / 3,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          primary: Colors.green,
                        ),
                        onPressed: () {
                          Get.toNamed(RouteHelper.getCreateRequestRoute());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: const CustomText(
                            text: "Create New Requests",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      width: MediaQuery.of(context).size.width / 3,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          primary: Colors.green,
                        ),
                        onPressed: () {
                          Get.toNamed(RouteHelper.getMyRequestRoute());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: const CustomText(
                            text: "My Requests",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
