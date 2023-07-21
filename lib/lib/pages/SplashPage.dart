import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/AppRoutes.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';

class Splash extends StatefulWidget {

  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 3000),(){
      Get.offAndToNamed(AppRoutes.landingPageRoute);
      // Get.offAndToNamed(AppRoutes.infoPageRoute);
    });
  }
  @override
  Widget build(BuildContext context) {
   ;
    return Scaffold(
      body: Container(
        // width:Get.width,
        // height:Get.height,
        decoration: BoxDecoration(
          color: ColorConstants.logoColor,
          image: DecorationImage(image: AssetImage(AppIcons.logo,))
        ),
        // child: Center(child: Image.asset(AppIcons.logo,width: 120,height: 120,)),
        // color: ColorConstants.logoColor,
      ),
    );
  }
}
