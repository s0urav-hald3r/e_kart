import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../config/app_constants.dart';
import '../config/input_validators.dart';
import '../config/size_configs.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  final AuthController _authController = Get.find<AuthController>();

  void handleOtpLogin() {
    String mobile = phoneController.text.trim();
    if (!(_formKey.currentState!.validate())) {
      FocusManager.instance.primaryFocus?.unfocus();
      Get.snackbar("Error", 'Invalid Phone Number',
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppConstants.blackColor);
      Future.delayed(
          const Duration(seconds: 2), (() => _formKey.currentState!.reset()));
      return;
    }
    _authController.sendOtpAction(mobile);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Obx(() => Stack(children: [
                  Container(
                    height: SizeConfig.screenHeight,
                    width: SizeConfig.screenWidth,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Spacer(flex: 2),
                        Lottie.asset('assets/animations/login.json',
                            width: SizeConfig.screenWidth! * 0.8),
                        const Spacer(),
                        Text(
                          'Welcome to eKart',
                          style: GoogleFonts.poppins(
                              color: AppConstants.blackColor,
                              fontSize: SizeConfig.screenWidth! * 0.07,
                              fontWeight: FontWeight.bold),
                        ),
                        const Gap(10),
                        Text(
                          'Purchase whatever you want',
                          style: GoogleFonts.poppins(
                              color: AppConstants.greyColor,
                              fontSize: SizeConfig.screenWidth! * 0.04,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Container(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight! * 0.065,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppConstants.primaryColor),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Form(
                                  key: _formKey,
                                  child: TextFormField(
                                    cursorColor: AppConstants.primaryColor,
                                    autofocus: false,
                                    maxLength: 10,
                                    controller: phoneController,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.screenWidth! * 0.04,
                                        letterSpacing: 01,
                                        fontWeight: FontWeight.w500,
                                        color: AppConstants.blackColor),
                                    decoration: InputDecoration(
                                      errorStyle: const TextStyle(
                                          height: 0,
                                          fontSize: 0,
                                          color: Colors.white),
                                      hintText: 'Enter Mobile Number',
                                      hintStyle: GoogleFonts.poppins(
                                        color: AppConstants.greyColor,
                                        letterSpacing: 01,
                                        fontSize:
                                            SizeConfig.screenWidth! * 0.04,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      counterText: '',
                                      border: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsets.only(left: 20),
                                    ),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    onChanged: (v) {
                                      if (v.length == 10) {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      }
                                    },
                                    validator: (val) {
                                      return Validators.choose('phone', val);
                                    },
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => phoneController.text.isEmpty
                                    ? null
                                    : handleOtpLogin(),
                                child: Container(
                                  width: SizeConfig.screenWidth! * 0.25,
                                  height: SizeConfig.screenHeight! * 0.065,
                                  margin: const EdgeInsets.all(2.5),
                                  decoration: BoxDecoration(
                                      color: AppConstants.primaryColor,
                                      border: Border.all(
                                          color: AppConstants.primaryColor),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                    child: Text(
                                      'Get OTP',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(flex: 2)
                      ],
                    ),
                  ),
                  _authController.isLoading
                      ? Container(
                          height: SizeConfig.screenHeight,
                          width: SizeConfig.screenWidth,
                          color: Colors.black12,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: AppConstants.primaryColor,
                            ),
                          ),
                        )
                      : const SizedBox()
                ]))));
  }
}
