import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_constants.dart';
import '../config/size_configs.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => FirebaseAuth.instance.signOut(),
          child: Text(
            'Sign Out',
            style: GoogleFonts.poppins(
                color: AppConstants.blackColor,
                fontSize: SizeConfig.screenWidth! * 0.04,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
