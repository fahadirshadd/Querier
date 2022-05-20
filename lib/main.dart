// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:querier/controllers/auth_controller.dart';

import 'package:querier/helpers/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AuthController registerController = Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Querier - Queries Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteHelper.getInitialRoute(),
      getPages: RouteHelper.routes,
    );
  }
}
