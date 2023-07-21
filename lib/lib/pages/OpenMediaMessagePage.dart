import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/controller/ChatController.dart';
import 'package:wazzup/lib/models/MediaModel.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';
import 'package:wazzup/lib/widgets/app_ink_well.dart';

class OpenMediaMessage extends StatefulWidget {
  ChatController chatController=Get.find<ChatController>();
  final MediaModel mediaModel;
    OpenMediaMessage(this.mediaModel);
  @override
  State<OpenMediaMessage> createState() => _OpenMediaMessageState();
}

class _OpenMediaMessageState extends State<OpenMediaMessage> {
BuildContext? mContext;
  @override
  Widget build(BuildContext context) {
    if(mContext==null) {
      mContext=context;
      if (!(widget.mediaModel.controller == null)) {
        widget.mediaModel.controller!.addListener(() {
          widget.chatController.update(['media_seek']);
        });

        widget.mediaModel.controller!.play();
      }
    }
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   // title: Text('Setting',style: AppFonts.appBarFontStyle,),
      // ),
      body: Center(
        child: Hero(
          tag: widget.mediaModel.mediaUrl!,
          child: widget.mediaModel.controller==null?Image.network(
            widget.mediaModel.mediaUrl!,
            fit: BoxFit.cover,
            width: Get.width,
            height: Get.width,
            // height: double.infinity,
          ):Center(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: AppInkWell(
                    onTap: (){
                      widget.mediaModel.controller!.pause();
                      widget.chatController.update(['play_Pause']);
                    },
                    child: AspectRatio(
                        aspectRatio: widget.mediaModel.controller!.value.aspectRatio,child: CachedVideoPlayer(widget.mediaModel.controller!)),
                  ),
                ),
                GetBuilder(
                  init: widget.chatController,
                  id: 'play_Pause',
                  builder: (_) {
                    return widget.mediaModel.controller!.value.isPlaying?Container():Align(
                      alignment: Alignment.center,
                      child: AppInkWell(
                        onTap: (){
                          widget.mediaModel.controller!.play();
                          widget.chatController.update(['play_Pause']);
                          },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color:ColorConstants.lightBlack,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Icon(AppIcons.play,size: 30,color: ColorConstants.whiteColor,),
                        ),
                      ),
                    );
                  }
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                        left: 10,
                        right: 10,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: GetBuilder(
                              init: widget.chatController,
                                id: 'media_seek',
                                builder: (_){
                              return Text(
                                "${formatDuration(widget.mediaModel.controller!.value.position)}",
                                style: TextStyle(fontSize: 16.0),
                              );
                            }),
                          ),
                          SizedBox(width: 10,),
                          Expanded(child: VideoProgressIndicator(widget.mediaModel.controller!, allowScrubbing: true,colors: VideoProgressColors(playedColor: ColorConstants.primaryColor),)),
                          SizedBox(width: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: GetBuilder(
                                init: widget.chatController,
                                id: 'media_seek',
                                builder: (_){
                                  return Text(
                                    "${formatDuration(widget.mediaModel.controller!.value.duration)}",
                                    style: TextStyle(fontSize: 16.0),
                                  );
                                }),
                          ),
                        ],
                      ),
                    )),

              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    if (!(widget.mediaModel.controller == null)) {
      widget.mediaModel.controller!.pause();
    }
    super.dispose();
  }
  formatDuration(Duration duration){
    return "${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}";
  }
}

