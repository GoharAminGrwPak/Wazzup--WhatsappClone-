import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/controller/StatusController.dart';
import 'package:wazzup/lib/utils/AppConstants.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/widgets/ContactItem.dart';
import 'package:wazzup/lib/widgets/app_ink_well.dart';

class StatusPrivacySetting extends StatelessWidget {
  StatusController controller=Get.find<StatusController>();
  BuildContext? mContext;
   StatusPrivacySetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(mContext==null){
      mContext=context;
      controller.groupController.getContacts();
    }
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
                Text(AppConstants.statusPrivacy,style: AppFonts.appBarFontStyle,),
                SizedBox(height: 5,),

                GetBuilder(
                    init: controller,
                    id: controller.groupController.selectedGroup,
                    builder: (_) {
                      return Text(controller.groupController.selectedContactList.isEmpty?'Add Participant': '${controller.groupController.selectedContactList.length} of ${controller.groupController.list.length} selected',style: AppFonts.appSmallHeaderFontStyle,);
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
        padding: EdgeInsets.only(left: 15,right: 5),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.groupController.list.length,
            itemBuilder: (_,index){
          return ContactItem(index, controller.groupController,isStatus: true,callback: (){
            controller.update([controller.groupController.selectedGroup]);
          },);
        }),
      ),
      floatingActionButton: GetBuilder(
          init: controller,
          id: controller.groupController.selectedGroup,
          builder: (_) {
            debugPrint('selectedGroupselectedGroup >>> ${controller.groupController.selectedContactList.length}');
            return controller.groupController.selectedContactList.isEmpty?Container():FloatingActionButton(
              onPressed: () {
                Get.back();
              },
              child: Icon(AppIcons.done),
            );
          }
      ),
    );
  }
}
