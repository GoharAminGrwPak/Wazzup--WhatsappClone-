import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/AppRoutes.dart';
import 'package:wazzup/lib/utils/AppUtils.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';
import 'package:wazzup/lib/widgets/app_ink_well.dart';


class Login extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 80),
          Center(
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppUtils.createMaterialColor(),
              ),
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20),
                ),
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20),
                ),
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                Get.offAndToNamed(AppRoutes.homePageRoute);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                padding: EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.center,
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppUtils.createMaterialColor(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // TextButton(
          //   onPressed: () {},
          //   child: Text(
          //     'Forgot Password?',
          //     style: TextStyle(
          //       color: ColorConstants.lightBlack,
          //       fontSize: AppFonts.normalFontSize,
          //     ),
          //   ),
          // ),
          AppInkWell(
            onTap: (){
              Get.toNamed(AppRoutes.signUpPageRoute);
            },
            child: RichText(
              text: TextSpan(
                text: "Don\'t have an account.",
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: AppFonts.normalFontSize+1,
                  color: ColorConstants.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Sign up',
                    style: TextStyle(
                      color: ColorConstants.floatingBtnColoe,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
