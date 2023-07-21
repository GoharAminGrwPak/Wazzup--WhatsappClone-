// import 'package:audioplayers/audioplayers.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/pages/ChatPage.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';

import 'ChatReplyView.dart';
import 'ImageMessage.dart';
import 'VideoThumbnail.dart';
class ChatItem extends StatelessWidget {
  final bool isReceiver;
  final int index;
  const ChatItem({required this.isReceiver,required this.index});

  @override
  Widget build(BuildContext context) {
    bool isPlaying = false;
    // final AudioPlayer audioPlayer = AudioPlayer();
    return Column(
      crossAxisAlignment: isReceiver?CrossAxisAlignment.start:CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.only(left: isReceiver?0:80,right: isReceiver?80:0),
          child: ClipPath(
            clipper: UpperNipMessageClipperTwo(isReceiver?MessageType.receive:MessageType.send),
            child: Container(
              padding: EdgeInsets.only(left: isReceiver?25:10,right: isReceiver?10:25,top: 10,bottom: 10),
              decoration: BoxDecoration(
                color: isReceiver?ColorConstants.whiteColor:ColorConstants.ownMessageColor
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if(index==1)ChatReplyView(model:ChatPage.messages[index]),
                  if(index==3)ImageMessage(imageUrl: 'https://ssg-prod.s3.amazonaws.com/projects/83ffe5d5-80b2-4c9e-be03-63cfccbeb1c9/dummy2.JPG'),
                  if(index==2)VideoThumbnail(videoUrl: 'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_5mb.mp4', width: Get.width/2,height: Get.width/2,),
                 // if(index==1)StatefulBuilder(builder: (context, setState) {
                 //    return IconButton(
                 //      constraints: const BoxConstraints(
                 //        minWidth: 100,
                 //      ),
                 //      onPressed: () async {
                 //        if (isPlaying) {
                 //          await audioPlayer.pause();
                 //          setState(() {
                 //            isPlaying = false;
                 //          });
                 //        } else {
                 //          await audioPlayer.play(UrlSource(AppConstants.dummyVoice));
                 //          setState(() {
                 //            isPlaying = true;
                 //          });
                 //        }
                 //      },
                 //      icon: Icon(
                 //        isPlaying ? Icons.pause_circle : Icons.play_circle,
                 //      ),
                 //    );
                 //  }),
                  Text(
                    '${ChatPage.messages[index].name}',
                    textAlign: TextAlign.start,
                    style: AppFonts.appSubHeaderFontStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(AppIcons.startIcon,size: 14,color: ColorConstants.greyColor,),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${ChatPage.messages[index].date}',
                        style: TextStyle(
                          fontSize: 10,
                          color: ColorConstants.lightBlack,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        color: ColorConstants.lightBlack,
                        Icons.done_all,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
