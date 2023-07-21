import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/controller/GroupController.dart';
import 'package:wazzup/lib/utils/AppConstants.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/AppRoutes.dart';
import 'package:wazzup/lib/utils/AppUtils.dart';
import 'package:wazzup/lib/widgets/ContactItem.dart';
import 'package:wazzup/lib/widgets/SelectedContactItem.dart';
import 'package:wazzup/lib/widgets/app_ink_well.dart';

class CreateGroup extends StatelessWidget {
  GroupController controller=Get.find<GroupController>();
  CreateGroup(){
    controller.getContacts();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.isBroadCast?'${AppConstants.newBroadcast}':'${AppConstants.newGroup}',style: AppFonts.appBarFontStyle,),
                SizedBox(height: 5,),

                GetBuilder(
                    init: controller,
                    id: controller.selectedGroup,
                    builder: (_) {
                    return Text(controller.selectedContactList.isEmpty?'Add Participant': '${controller.selectedContactList.length} of ${controller.list.length} selected',style: AppFonts.appSmallHeaderFontStyle,);
                  }
                )
              ],
            ),
          ),
          actions: [
            AppInkWell(child: Padding(
              padding: const EdgeInsets.only(top: 10.0,right: 10),
              child: Icon(AppIcons.searchIcon,size: 25,),
            ), onTap: (){}),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(height: 10,),
            GetBuilder(
              init: controller,
              id: controller.selectedGroup,
              builder: (_) {
                return controller.selectedContactList.isEmpty?
                controller.isBroadCast==false?Container():
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
                  child: Text('Only contacts with ali@gmail.com in thier address book will receive your broadcast messages',textAlign: TextAlign.center,style: AppFonts.appSubHeaderBoldFontStyle,),
                )
                    :Container(
                  height: 90,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.selectedContactList.length,
                        // physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_,index){
                          return SelectContactItem(index,controller);
                        }),
                  ),
                );
              }
            ),
            GetBuilder(
                init: controller,
                id: controller.selectedGroup,
                builder: (_) {
                return (controller.selectedContactList.isEmpty && controller.isBroadCast==false)?Container():Divider();
              }
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: controller.list.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_,index){
                  return ContactItem(index,controller,callback: (){
                    controller.update([controller.selectedGroup]);
                  },);
                }),
          ],
        ),
      ),
      floatingActionButton: GetBuilder(
          init: controller,
          id: controller.selectedGroup,
          builder: (_) {
            return controller.selectedContactList.isEmpty?Container():FloatingActionButton(
            onPressed: () {
              if(controller.isBroadCast==true){
                AppUtils.gotoHome();
                AppUtils.showToastV1("Success", 'Broadcast created successfully');
              }else {
                Get.toNamed(AppRoutes.createGroupInfoRoute);
              }
            },
            child: Icon(controller.isBroadCast==false?AppIcons.arrowNext:AppIcons.done),
          );
        }
      ),
    );
  }
}
