import 'package:e_kart/views/home_page.dart';
import 'package:e_kart/views/login_page.dart';
import 'package:e_kart/views/otp.dart';
import 'package:e_kart/views/splash_page.dart';
import 'package:get/get_navigation/get_navigation.dart';

/// Routes name to directly navigate the route by its name
class Routes {
  static String splash = '/splash';
  static String login = '/login';
  static String otp = '/otp';
  static String home = '/home';
}

/// Add this list variable into your GetMaterialApp as the value of getPages parameter.
final getPages = [
  GetPage(
    name: Routes.splash,
    page: () => const SplashPage(),
  ),
  GetPage(
    name: Routes.login,
    page: () => const LoginPage(),
  ),
  GetPage(
    name: Routes.otp,
    page: () => const OTP(),
  ),
  GetPage(
    name: Routes.home,
    page: () => const HomePage(),
  ),
];
