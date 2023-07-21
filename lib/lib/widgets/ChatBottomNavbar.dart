import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/controller/ChatController.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';
import 'package:wazzup/lib/widgets/AppInput.dart';

class ChatBottomNavbar extends StatelessWidget {
  final TextEditingController controller;
  final ChatController chatController=Get.find<ChatController>();
   ChatBottomNavbar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      margin: EdgeInsets.only(bottom: 20),
      child: Row(children: [
        Container(
          // width: Get.width*0.8,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
          decoration: BoxDecoration(
              color: ColorConstants.whiteColor,
              borderRadius: BorderRadius.circular(30)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
            Icon(AppIcons.imogi,color:ColorConstants.lightBlack,size: 30,),
            SizedBox(width: 5,),
              Container(
                width: Get.width*0.5,
                  child: AppInput(controller, 'Message',isBorder: false,onTextChanged: (s){
                    chatController.update(['input']);
                  },)),
            Icon(AppIcons.attachment,color: ColorConstants.lightBlack,size: 30,),
            SizedBox(width: 5,),
            Icon(AppIcons.camera,color: ColorConstants.lightBlack,size: 30,),
            // AppInput(controller, 'Type here ...')
          ],),
        ),
        GetBuilder(
          init:chatController ,
          id: 'input',
          builder: (_) {
            return Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorConstants.floatingBtnColoe.withOpacity(0.8),
                borderRadius: BorderRadius.circular(30)
              ),
              child: controller.text.isEmpty?Icon(AppIcons.mic,size: 30,color: ColorConstants.whiteColor,):Icon(AppIcons.send,size: 30,color: ColorConstants.whiteColor,),
            );
          }
        )
      ],),
    );
  }
}