import 'package:e_kart/views/divertion_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../config/size_configs.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(milliseconds: 2600),
        (() => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const DivertionPage()),
            (route) => false)));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            body: Center(
          child: Lottie.asset('assets/animations/splash.json',
              width: MediaQuery.of(context).size.width * 0.8),
        )));
  }
}
