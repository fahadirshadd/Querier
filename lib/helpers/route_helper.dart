import 'package:get/get.dart';

import 'package:querier/modules/admin/admin_dashboard.dart';
import 'package:querier/modules/auth/login.dart';
import 'package:querier/modules/auth/signup.dart';
import 'package:querier/modules/receiver/receiver_dashboard.dart';
import 'package:querier/modules/sender/create_request.dart';
import 'package:querier/modules/sender/sender_dashboard.dart';
import 'package:querier/modules/sender/sender_requests.dart';

class RouteHelper {
  static const String initial = '/';
  static const String signup = '/signup';
  static const String admin = '/admin';
  static const String sender = '/sender';
  static const String receiver = '/receiver';
  static const String createRequest = '/createRequest';
  static const String myRequest = '/myRequest';

  static String getInitialRoute() => initial;
  static String getSignupRoute() => signup;
  static String getAdminRoute() => admin;
  static String getSenderRoute() => sender;
  static String getReceiverRoute() => receiver;
  static String getCreateRequestRoute() => createRequest;
  static String getMyRequestRoute() => myRequest;

// List of Routes
  static List<GetPage> routes = [
    GetPage(name: getInitialRoute(), page: () => const Login()),
    GetPage(name: getSignupRoute(), page: () => const Signup()),
    GetPage(name: getAdminRoute(), page: () => const AdminDashboard()),
    GetPage(name: getSenderRoute(), page: () => const SenderDashboard()),
    GetPage(name: getReceiverRoute(), page: () => const ReceiverDashboard()),
    GetPage(name: getCreateRequestRoute(), page: () => const CreateRequests()),
    GetPage(name: getMyRequestRoute(), page: () => const MyRequests()),
  ];
}
