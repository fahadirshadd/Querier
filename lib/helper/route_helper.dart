import 'package:get/get.dart';
import 'package:querier/admin/admin_dashboard.dart';
import 'package:querier/auth/login.dart';
import 'package:querier/receiver/receiver_dashboard.dart';
import 'package:querier/sender/sender_dashboard.dart';

class RouteHelper {
  static const String initial = '/';
  static const String admin = '/admin';
  static const String sender = '/sender';
  static const String receiver = '/receiver';

  static String getInitialRoute() => initial;
  static String getAdminRoute() => admin;
  static String getSenderRoute() => sender;
  static String getReceiverRoute() => receiver;

// List of Routes
  static List<GetPage> routes = [
    GetPage(name: getInitialRoute(), page: () => const Login()),
    GetPage(name: getAdminRoute(), page: () => const AdminDashboard()),
    GetPage(name: getSenderRoute(), page: () => const SenderDashboard()),
    GetPage(name: getReceiverRoute(), page: () => const ReceiverDashboard()),
  ];
}
