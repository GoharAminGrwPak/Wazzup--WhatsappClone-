import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/controller/ChatController.dart';
import 'package:wazzup/lib/pages/ChatPage.dart';
import 'package:wazzup/lib/utils/AppConstants.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';
import 'package:wazzup/lib/widgets/ChatItem.dart';

class StarredMessage extends StatelessWidget {
  ChatController controller=Get.find<ChatController>();
   StarredMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.starredMessages,style: AppFonts.appBarFontStyle,),
        actions: [

          Icon(AppIcons.searchIcon,size: 25,),
          SizedBox(width: 20,),
          Icon(AppIcons.menuIcon,size: 25,),
          SizedBox(width: 10,),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: (false)?ListView.builder(
            itemCount: ChatPage.messages.length,
            shrinkWrap: true,
            itemBuilder: (_,index){
          return ChatItem(isReceiver: index==0, index: index);
        }):Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            Container(
              width: 150,height: 150,
              decoration: BoxDecoration(
                color: ColorConstants.floatingBtnColoe,
                borderRadius: BorderRadius.circular(80)
              ),
              child: Icon(AppIcons.startIconFilled,size: 60,color: Colors.white,),
            ),
              Padding(
                padding: const EdgeInsets.only(left: 50,right: 50,top: 20),
                child: Text('Tap and hold on any message in any chat to star it, so you can easily find it later',style: AppFonts.appHeaderBoldFontStyle,),
              )
          ],),
        ),
      ),
    );
  }
}
