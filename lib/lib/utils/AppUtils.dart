import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/controller/HomeController.dart';
import 'package:wazzup/lib/widgets/app_ink_well.dart';


import 'AppRoutes.dart';
import 'ColorConstants.dart';
class AppUtils {
  static HomeController homeController=Get.find<HomeController>();
  static gotoHome(){
    homeController.index=0;
    Get.offAndToNamed(AppRoutes.homePageRoute);
  }
  static Widget showNetworkImages(
      {required String imgUrl, double? width, double? height, Color? color, BoxFit? fit,Function? ownPreview}) {
    print(imgUrl);
    return (width == null) ? AppInkWell(
      onTap: () {
        if(ownPreview==null) {
          showPreviewImage(imgUrl, color);
        }else{
          ownPreview();
        }
      },
      child: Image.network(
        imgUrl, fit: fit == null ? BoxFit.contain : BoxFit.fill,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress){
          return networkImageLoadingBuilder(context,child,loadingProgress,width,height);
        },
        errorBuilder: (BuildContext context, Object exception,
            StackTrace? stackTrace) {
          return networkImageErrorBuilder(imgUrl: imgUrl,
              width: width,
              height: height,
              color: color,
              fit: fit);
        },
      ),
    ) : AppInkWell(
      onTap: () {
        if(ownPreview==null) {
          showPreviewImage(imgUrl, color);
        }else{
          ownPreview();
        }
      },
      child: Image.network(imgUrl, width: width,
        height: height,
        fit: fit == null ? BoxFit.contain : BoxFit.fill,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress){
          return networkImageLoadingBuilder(context,child,loadingProgress,width,height);
        },
        errorBuilder: (BuildContext context, Object exception,
            StackTrace? stackTrace) {
          return networkImageErrorBuilder(imgUrl: imgUrl,
              width: width,
              height: height,
              color: color,
              fit: fit);
        },
      ),
    );
  }

  static Widget networkImageErrorBuilder(
      {required String imgUrl, double? width, double? height, Color? color, BoxFit? fit, bool isBorder = true}) {
    return Container(
        decoration: BoxDecoration(border:
        (isBorder == true) ? Border(
          top: BorderSide(
              color: color == null ? ColorConstants.primaryColor : color),
          bottom: BorderSide(
              color: color == null ? ColorConstants.primaryColor : color),
          right: BorderSide(
              color: color == null ? ColorConstants.primaryColor : color),
          left: BorderSide(
              color: color == null ? ColorConstants.primaryColor : color),
        ) : null,
            borderRadius: BorderRadius.circular(width! / 2)
        ),
        child: Padding(
          padding: width > 40 ? EdgeInsets.only(
              left: 8.0, right: 8, bottom: 16, top: 8) : EdgeInsets.all(0),
          child: Icon(FontAwesomeIcons.user,
              color: color == null ? ColorConstants.primaryColor : color,
              size: width - ((width / 100) * 35)),
        ));
  }

  static void showPreviewImage(String imgUrl, Color? color) {
    debugPrint('${imgUrl}');
    var w = Image.network(imgUrl, fit: BoxFit.fill,
      height: 300,
      width: 300,
      // loadingBuilder: networkImageLoadingBuilder,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress){
      return networkImageLoadingBuilder(context,child,loadingProgress,300,300);
      },
      errorBuilder: (BuildContext context, Object exception,
          StackTrace? stackTrace) {
        return SizedBox(height: 300,
            width: 300,
            child: networkImageErrorBuilder(imgUrl: imgUrl,
                width: 40,
                height: 30,
                color: color,
                fit: BoxFit.cover,
                isBorder: false));
      },
    );
    customDialogBox(ClipRRect(
        borderRadius: BorderRadius.circular(32.0),
        child: SizedBox(
            height: 300, width: 300,
            child: w)));
  }

  static Widget networkImageLoadingBuilder(BuildContext context, Widget child,
      ImageChunkEvent? loadingProgress,double? width,double? height) {
    if (loadingProgress == null) return child;
    return Container(
      width: width==null?300:width,
      height: height==null?300:height,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircularProgressIndicator(
            color: ColorConstants.primaryColor,
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress
                .cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                : null,
          ),
        ),
      ),
    );
  }

  static void showToastV1(String title, String message) {
    if (message == "Connection reset by peer") {
      return;
    }
    if (message == "Null check operator used on a null value") {
      return;
    }
    if (message == null) {
      return;
    }
    if (message == "null") {
      return;
    }
    if (message.contains("widget")) {
      return;
    }
    Get.snackbar(
      "${title}".tr,
      '${message}',
      duration: Duration(seconds: 2),
      colorText: ColorConstants.whiteColor,
      backgroundColor: title == 'Error'.tr ? Colors.red : ColorConstants
          .primaryColor,
      animationDuration: Duration(milliseconds: 1000),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void customDialogBox(Widget widget,) {
    Get.dialog(AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        contentPadding: EdgeInsets.only(top: 0.0),
        content: Stack(

          children: <Widget>[
            widget,
            Positioned(
              top: -4,
              right: 0.0,
              child: AppInkWell(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(Icons.clear, color: Colors.white,size: 30,),
                ),
                onTap: () {
                  Get.back();
                },
              ),
            ),
          ],
        )
    ));
  }
  static MaterialColor createMaterialColor() {
    final strengths = <double>[.05];
    final swatch = <int, Color>{};
    final r = ColorConstants.primaryColor.red, g = ColorConstants.primaryColor.green, b = ColorConstants.primaryColor.blue;

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(ColorConstants.primaryColor.value, swatch);
  }
}