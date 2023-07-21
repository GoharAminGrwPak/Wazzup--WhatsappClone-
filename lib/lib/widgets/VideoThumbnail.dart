import 'dart:async';
import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/models/MediaModel.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/AppRoutes.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';

import 'dart:io';
import 'dart:ui' as ui;

import 'app_ink_well.dart';

class VideoThumbnail extends StatefulWidget {
  final String videoUrl;
  final double width;
  final double height;

  VideoThumbnail({
    required this.videoUrl,
    required this.width,
    required this.height,
  });

  @override
  State<VideoThumbnail> createState() => _VideoThumbnailState();
}

class _VideoThumbnailState extends State<VideoThumbnail> {
  late CachedVideoPlayerController controller;
  @override
  void initState() {
    controller = CachedVideoPlayerController.network(
        widget.videoUrl);
    // controller.setLooping(true);

    controller.initialize().then((value) {
      // controller.play();
      setState(() {});
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    debugPrint('CachedVideoPlayer >>> ${controller.value}');
    return Container(
      width: widget.width,
        height: widget.height,
        child: controller.value.isInitialized
            ? AppInkWell(
              onTap: (){
                MediaModel model=MediaModel();
                model.mediaUrl=widget.videoUrl;
                model.duration='00:29';
                controller.seekTo(Duration.zero);
                model.controller=controller;
                Get.toNamed(AppRoutes.openMediaMessagePageRoute,arguments: model);
              },
              child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: Stack(
                children: [
                  CachedVideoPlayer(controller),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color:ColorConstants.lightBlack,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Icon(AppIcons.play,size: 30,color: ColorConstants.whiteColor,),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                      child: Row(children: [
                        Row(children: [
                          Icon(AppIcons.videoIcon,size: 16,color: ColorConstants.whiteColor,),
                          SizedBox(width: 10,),
                          Text('00:29',style: AppFonts.appSmallHeaderFontStyle.copyWith(color: ColorConstants.whiteColor),)
                        ],)
                      ],),
                    ),
                  )
                ],
              )),
            )
            : Center(child: const CircularProgressIndicator()));
  }

  @override
  void dispose() async{
    // TODO: implement dispose
    await controller.dispose();
    controller.pause();
    super.dispose();
  }
}
