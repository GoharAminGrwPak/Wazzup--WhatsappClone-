import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/controller/ChatController.dart';
import 'package:wazzup/lib/models/ChatModel.dart';
import 'package:wazzup/lib/utils/AppConstants.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/AppRoutes.dart';
import 'package:wazzup/lib/utils/AppUtils.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';
import 'package:wazzup/lib/widgets/AppCircleImage.dart';
import 'package:wazzup/lib/widgets/AppPopupmenuButton.dart';
import 'package:wazzup/lib/widgets/ChatBottomNavbar.dart';
import 'package:wazzup/lib/widgets/ChatItem.dart';

class ChatPage extends StatelessWidget {
  ChatController chatController=Get.find<ChatController>();
  final TextEditingController textInputController=TextEditingController();
  static List<ChatModel> messages=[
    ChatModel("Hi", '12:30 am', 'You', ''),
    ChatModel("Hello, Hope you\'re doing well", '12:40 am', 'Programmer', 'Hi'),
    ChatModel("Whats going on now a days", '12:41 am', 'programmer', ''),
    ChatModel("Nothing special", '12:41 am', 'programmer', ''),
    ChatModel("Ok", '12:41 am', 'programmer', ''),
    ChatModel("Good", '12:42 am', 'programmer', ''),
  ];

   ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: AppBar(
            leadingWidth: 25,
            elevation: 0,
            leading: Padding(
                padding: EdgeInsets.only(top: 10,left: 5),
                    child: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(AppIcons.backArrawIcon,size: 25,color: ColorConstants.whiteColor,)),
            ),
            title: Padding(padding: EdgeInsets.only(top: 5),
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child:
                  AppCircleImage(imagePath: AppIcons.dummyImage,width: 45,)),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Programmer',style: AppFonts.appHeaderBoldFontStyle.copyWith(color: ColorConstants.whiteColor),),
                    SizedBox(height: 5,),
                    Text('Online',style: AppFonts.appSubHeaderFontStyle.copyWith(color: ColorConstants.whiteColor.withOpacity(.8)),)
                  ],
                ),
              )
            ],),
            ),
            actions: [
              actionButtion(AppIcons.videoIcon,25),
              actionButtion(AppIcons.phoneIcon,5),
              // actionButtion(AppIcons.menuIcon,10),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: AppPopupMenuButton(list: chatController.dropDownList, callback: (val){
                  if(val.trim()==AppConstants.viewContact){
                    Get.toNamed(AppRoutes.infoPageRoute);
                  }
                }),
              ),
            ],
          )),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppIcons.chatBackground),fit: BoxFit.cover)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8,top: 10,bottom: 80),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorConstants.lightYellow,
                    boxShadow: [
                      BoxShadow(color: ColorConstants.greyColor.withOpacity(0.5))
                    ]
                  ),
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.all(8),
                  child: Text('Messages and calls are end-to-end encrypted, No one outside of this chat can read or listen, Tap to learn more',
                    textAlign: TextAlign.center,
                  style: AppFonts.appSubHeaderFontStyle,
                  ),),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    itemCount: messages.length,
                    shrinkWrap: true,
                    itemBuilder: (_,index){
                      // return ImageMessage(message: 'Hello', imageUrl: 'https://tse1.mm.bing.net/th?id=OIP.fK5LE_-0NA1N2d1oka_DQgAAAA&pid=Api&P=0');
                      return ChatItem(isReceiver: index==0|| index==4,index:index);
                      // return ChatReplyView();
                    }),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: ChatBottomNavbar(controller: textInputController,),
    );
  }

  Widget actionButtion(IconData icon,double rightPadding) {
    return Padding(
      padding:  EdgeInsets.only(top:10.0,right: rightPadding),
      child: Icon(icon,size: 25,color: ColorConstants.whiteColor,),
    );
  }
}
