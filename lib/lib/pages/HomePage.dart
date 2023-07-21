import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/controller/HomeController.dart';
import 'package:wazzup/lib/utils/AppConstants.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/AppRoutes.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';
import 'package:wazzup/lib/widgets/AppPopupmenuButton.dart';
import 'package:wazzup/lib/widgets/CallWidget.dart';
import 'package:wazzup/lib/widgets/ChatsWidget.dart';
import 'package:wazzup/lib/widgets/StatusWidget.dart';

class HomePage extends StatelessWidget{
  HomeController controller=Get.find<HomeController>();
   HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3, child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(AppConstants.appName,style: AppFonts.appBarFontStyle.copyWith(color: ColorConstants.whiteColor),),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0,right: 10,),
              child: Icon(AppIcons.searchIcon,size: 28,color: ColorConstants.whiteColor,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0,right: 10),
              child: GetBuilder(
                init: controller,
                id: controller.homeTab,
                builder: (_) {
                  return AppPopupMenuButton<String>(list:
                  controller.index==0?controller.chatsList:
                  controller.index==1?controller.statusList:controller.callList
                    ,callback: (res){
                    debugPrint('AppPopupMenuButton >>> ${res}');
                    if(res.trim()==AppConstants.settings){
                      Get.toNamed(AppRoutes.settingPageRoute);
                    }
                    else if(res.trim()==AppConstants.starredMessages){
                      Get.toNamed(AppRoutes.starredMessagesRoute);

                    }
                    else if(res.trim()==AppConstants.starredMessages){}
                    else if(res.trim()==AppConstants.newGroup){
                      controller.controller.isBroadCast=false;
                      controller.controller.selectedContactList=[];
                      controller.controller.list=[];
                      Get.toNamed(AppRoutes.createGroupPageRoute);
                    }
                    else if(res.trim()==AppConstants.newBroadcast){
                      controller.controller.isBroadCast=true;
                      controller.controller.selectedContactList=[];
                      controller.controller.list=[];
                      Get.toNamed(AppRoutes.createGroupPageRoute);
                    }
                    else if(res.trim()==AppConstants.statusPrivacy){
                      Get.toNamed(AppRoutes.statusPrivacyRoute);
                    }
                  },);
                }
              ),
            )
          ],
        ),
      ),
      body: Column(children: [
        Container(
          width: Get.width,
          color: ColorConstants.primaryColor,
          child: TabBar(
            // isScrollable: true,
            onTap: (index){
              controller.index=index;
              controller.update([controller.homeTab]);
            },
              indicatorColor: ColorConstants.whiteColor,
              labelStyle: AppFonts.appTabFontStyle,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  Tab(child: Text('Chats',style: AppFonts.appHeaderFontStyle.copyWith(color: ColorConstants.whiteColor),)),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      color: ColorConstants.whiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('103',style: TextStyle(color: ColorConstants.primaryColor,fontSize: 13),),
                  )
                ],),
                Tab(child: Text('Status',style: AppFonts.appHeaderFontStyle.copyWith(color: ColorConstants.whiteColor),)),
                Tab(child: Text('Calls',style: AppFonts.appHeaderFontStyle.copyWith(color: ColorConstants.whiteColor),)),
              ]),
        ),
        Expanded(child: TabBarView(children: [
          ChatsWidget(),
          StatusWidget(),
          CallWidget(),
        ]))
      ],),
      floatingActionButton: GetBuilder(
          init: controller,
          id: controller.homeTab,
          builder: (_) {
          return (controller.index==0)?FloatingActionButton(
            child: Icon(AppIcons.messageIcon,size: 20,color: ColorConstants.whiteColor,),
            onPressed: () {  },):(controller.index==1)?Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            FloatingActionButton(
              backgroundColor: ColorConstants.lightBlack,
              child: Icon(AppIcons.edit,size: 20,color: ColorConstants.whiteColor,),
              onPressed: () {  },),
            SizedBox(height: 10,),
            FloatingActionButton(
              child: Icon(AppIcons.camera,size: 20,color: ColorConstants.whiteColor,),
              onPressed: () {  },),
          ],):FloatingActionButton(
            child: Icon(AppIcons.diallerIcon,size: 20,color: ColorConstants.whiteColor,),
            onPressed: () {  },);
        }
      ),
    ));
  }
}
