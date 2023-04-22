import 'package:e_kart/config/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../config/app_constants.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String _verificationId = '';
  final RxBool _isLoading = false.obs;

  sendOtpAction(String mobile) async {
    _isLoading.value = true;
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+91$mobile',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        _isLoading.value = false;
        Get.toNamed(Routes.otp, arguments: {'mobile': mobile});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  verifyOtpAction(String otp) async {
    _isLoading.value = true;

    try {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: otp);

      // Sign the user in (or link) with the credential
      await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        Get.snackbar("Error", 'Invalid OTP',
            snackPosition: SnackPosition.BOTTOM,
            colorText: AppConstants.blackColor);
        return;
      }
      Get.snackbar("Error", 'Something went wrong',
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppConstants.blackColor);
    } finally {
      _isLoading.value = false;
    }
  }

  bool get isLoading => _isLoading.value;
}
