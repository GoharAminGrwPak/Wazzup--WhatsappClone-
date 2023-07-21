import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/AppRoutes.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';
import 'package:wazzup/lib/widgets/custom_button.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context) {
    Get.offAndToNamed(AppRoutes.loginPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
             Text(
              'Welcome to WhatsApp',
              style:AppFonts.appBarFontStyle.copyWith(color: ColorConstants.floatingBtnColoe,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            Image.asset(
              AppIcons.bgLanding,
              height: Get.width/2,
              width: 340,
              color: ColorConstants.floatingBtnColoe,
            ),
            // SizedBox(height: size.height / 9),
            Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: RichText(
              text: TextSpan(
                text: 'Read our Privacy Policy. Tap',
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: AppFonts.normalFontSize,
                  color: ColorConstants.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Agree and continue ',
                    style: TextStyle(
                      color: ColorConstants.floatingBtnColoe,
                    ),
                  ),
                  TextSpan(
                    text: 'to accept the Terms of Service.',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

            SizedBox(height: 50),

            Container(
              margin: EdgeInsets.only(bottom: 60,left: 60,right: 60),
              // width: size.width * 0.75,
              child: CustomButton(
                text: 'AGREE AND CONTINUE',
                onPressed: () => navigateToLoginScreen(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
