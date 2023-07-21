import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/AppRoutes.dart';
import 'package:wazzup/lib/utils/AppUtils.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';
import 'package:wazzup/lib/widgets/app_ink_well.dart';


class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: 60),
        Center(
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppUtils.createMaterialColor().shade900,
            ),
          ),
        ),
        SizedBox(height: 20),

        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[200],
                child:  Icon(
                  Icons.camera_alt,
                  size: 40,
                  color: Colors.grey[800],
                )
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.edit,
                  color: Colors.grey[800],
                ),
              ),
            )
          ],
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
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name',
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
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
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
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: AppUtils.createMaterialColor().shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )),
        SizedBox(height: 10),
        AppInkWell(
          onTap: (){
            Get.offAndToNamed(AppRoutes.loginPageRoute);
          },
          child: RichText(
            text: TextSpan(
              text: "Already have an account.",
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: AppFonts.normalFontSize+1,
                color: ColorConstants.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' Login',
                  style: TextStyle(
                      color: ColorConstants.floatingBtnColoe,
                      fontWeight: FontWeight.bold
                  ),
                ),

              ],
            ),
          ),
        ),
      ]),
    ));
  }
}
