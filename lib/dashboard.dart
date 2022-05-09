import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:querier/signup.dart';

import 'package:querier/widgets/CustomText.dart';
import 'package:querier/widgets/custom_text_field.dart';
import 'package:querier/widgets/size_config.dart';
import 'package:querier/widgets/styles.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

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
                        Text("Querier Dashboard",
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
                                backgroundImage: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlrZqTCInyg6RfYC7Ape20o-EWP1EN_A8fOA&usqp=CAU"),
                                child: Stack(children: const [
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.white70,
                                      child: Icon(Icons.camera_alt,size: 15),
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
                                  padding:
                                  EdgeInsets.symmetric(horizontal: MySize.size8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: 'Jhonas Elie',
                                        fontWeight: FontWeight.w700,
                                        fontSize: MySize.size18,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.0, vertical: 4.0),
                                        color: Colors.green.shade100,
                                        child: CustomText(
                                          color: Colors.green,
                                          text: "Verified",
                                          fontWeight: FontWeight.w800,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: MySize.size8),
                                  child: Row(
                                    children: [
                                      CustomText(
                                        text: "UI/UX Designer",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17.0,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.edit),
                                        iconSize: 20,
                                        color: Colors.blue,
                                      )
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

                      controller: phoneController,
                      labelText: "Reporting Manager",
                      hintText: "Jhon...",
                      keyboardType: TextInputType.number,
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
                        onTap: () {
                          // Get.offAllNamed(routeHome);
                          // loginUser();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          padding:
                          const EdgeInsets.symmetric(vertical: 16),
                          child:  CustomText(
                            text: "Choose files",
                            color: primaryColor,
                          ),
                        )
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                        onTap: () {
                          // Get.offAllNamed(routeHome);
                          // loginUser();
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
                            text: "Submit",
                            color: Colors.white,
                          ),
                        )
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
