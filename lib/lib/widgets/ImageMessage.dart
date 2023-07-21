import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/models/MediaModel.dart';
import 'package:wazzup/lib/utils/AppRoutes.dart';
import 'package:wazzup/lib/utils/AppUtils.dart';

class ImageMessage extends StatelessWidget {
  final String imageUrl;

  const ImageMessage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return AppUtils.showNetworkImages(imgUrl: imageUrl,height: Get.width/2,width: Get.width/2,fit: BoxFit.cover,ownPreview: (){
      MediaModel model=MediaModel();
      model.mediaUrl=imageUrl;
      Get.toNamed(AppRoutes.openMediaMessagePageRoute,arguments: model);
    });
  }
}