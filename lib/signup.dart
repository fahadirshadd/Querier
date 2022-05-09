import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:querier/widgets/CustomText.dart';
import 'package:querier/widgets/custom_text_field.dart';
import 'package:querier/widgets/styles.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController? nameController,
      emailController,
      phoneController,
      passwordController,
      confirmPasswordController;
  // final signupController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.only(bottom: 10),
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
              // const SizedBox(
              //   height: 30,
              // ),
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
                controller: nameController,
                labelText: "Name",
                hintText: "John Doe",
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: emailController,
                labelText: "Email",
                hintText: "abc@domain.com",
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(

                controller: phoneController,
                labelText: "Phone Number",
                hintText: "+92 3001234567",
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                obscureText: true,
                controller: passwordController,
                labelText: "Password",
                hintText: "123",
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: confirmPasswordController,
                labelText: "Confirm Password",
                hintText: "123",
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  // Row(
                  //   children: [
                  //     Checkbox(value: true, onChanged: (value) {}),
                  //     const CustomText(
                  //       text: "Remeber Me",
                  //     ),
                  //   ],
                  // ),
                  //CustomText(text: "Forgot password?", color: primaryColor)
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  // signupController.signUpUser(
                  //     nameController!.text,
                  //     emailController!.text,
                  //     phoneController!.text,
                  //     passwordController!.text,
                  //     confirmPasswordController!.text);
                  // Get.offAllNamed(routeHome);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: const CustomText(
                    text: "Register",
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(text: "Already have the credentials? "),
                  InkWell(
                    onTap: () {

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
    );
  }
}
