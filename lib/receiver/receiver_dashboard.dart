import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:querier/models/receiver_data_model.dart';

import 'package:querier/widgets/custom_text.dart';

import 'package:querier/widgets/styles.dart';

class ReceiverDashboard extends StatefulWidget {
  const ReceiverDashboard({Key? key}) : super(key: key);

  @override
  State<ReceiverDashboard> createState() => _ReceiverDashboardState();
}

class _ReceiverDashboardState extends State<ReceiverDashboard> {
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
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            padding: const EdgeInsets.all(30),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    headerSection(),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: receiverRequestCard(
                                name: receiverData[0]["name"],
                                imgUrl: receiverData[0]["imgUrl"],
                                days: receiverData[0]["days"],
                                designation: receiverData[0]["designation"],
                                reason: receiverData[0]["reason"])),
                        Expanded(
                            child: receiverRequestCard(
                                name: receiverData[1]["name"],
                                imgUrl: receiverData[1]["imgUrl"],
                                days: receiverData[1]["days"],
                                designation: receiverData[1]["designation"],
                                reason: receiverData[1]["reason"])),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget receiverRequestCard({imgUrl, name, days, designation, reason}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(imgUrl),
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
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: name,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.green.shade50,
                                  borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 4.0),
                              child: CustomText(
                                color: Colors.green,
                                text: "$days days",
                                fontWeight: FontWeight.w800,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            CustomText(
                              text: designation,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.0,
                            ),
                            const SizedBox(
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
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CustomText(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  text: reason,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column headerSection() {
    return Column(
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
            Text("Receiver Dashboard",
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
      ],
    );
  }
}
