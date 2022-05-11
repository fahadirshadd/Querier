import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:querier/widgets/custom_text.dart';
import 'package:querier/widgets/custom_text_field.dart';
import 'package:querier/widgets/size_config.dart';
import 'package:querier/widgets/styles.dart';

class CreateRequests extends StatefulWidget {
  const CreateRequests({Key? key}) : super(key: key);

  @override
  State<CreateRequests> createState() => _CreateRequestsState();
}

class _CreateRequestsState extends State<CreateRequests> {
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
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: MySize.size12!, horizontal: MySize.size20!),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: const NetworkImage(
                                    "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909__340.png"),
                                child: Stack(children: const [
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.white70,
                                      child: Icon(Icons.camera_alt, size: 15),
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: MySize.size8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: 'Jhonas Elie',
                                        fontWeight: FontWeight.w700,
                                        fontSize: MySize.size18,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: MySize.size8),
                                  child: Row(
                                    children: const [
                                      CustomText(
                                        text: "UI/UX Designer",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17.0,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      controller: nameController,
                      labelText: "Query Title",
                      hintText: "Urgent Leave needed...",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      controller: emailController,
                      labelText: "Team",
                      hintText: "Development team...",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      maxLines: 10,
                      obscureText: false,
                      controller: passwordController,
                      labelText: "Description",
                      hintText: "Detail about your query...",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: CustomText(
                            text: "Choose files",
                            color: primaryColor,
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: const CustomText(
                          text: "Submit",
                          color: Colors.white,
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
