import 'package:flutter/material.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/AppUtils.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';

class AppCircleImage extends StatelessWidget {
  final String? imageUrl;
  final String? imagePath;
  final dynamic? icon;
  final double width;
  const AppCircleImage({this.imageUrl,this.width=55,this.imagePath='${AppIcons.chatBackground}',this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(width),
        child:
        (!(icon==null))?Container(
          padding: EdgeInsets.all(14),
            decoration: BoxDecoration(color: ColorConstants.greyColor.withOpacity(.5)),
            child: Icon(icon,size: 30,color: ColorConstants.whiteColor,)):(imageUrl==null || imageUrl=='')?Image.asset('${imagePath}',width: width,height: width,fit: BoxFit.fill,):AppUtils.showNetworkImages(imgUrl: imageUrl!,height: width,width: width,ownPreview: (){}));
  }
}
