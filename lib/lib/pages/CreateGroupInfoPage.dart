import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/controller/GroupController.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/AppUtils.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';
import 'package:wazzup/lib/widgets/AppCircleImage.dart';
import 'package:wazzup/lib/widgets/AppInput.dart';

class CreateGroupInfo extends StatelessWidget {
  final GroupController controller=Get.find<GroupController>();
  CreateGroupInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          // elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('New Group',style: AppFonts.appBarFontStyle,),
                SizedBox(height: 5,),
                Text('Add Participant',style: AppFonts.appSmallHeaderFontStyle,),
              ],
            ),
          ),
        ),
      ),
      body:Column(
        children: [
          SizedBox(height: 20,),

          Material(
            elevation: 0.5,
            color: ColorConstants.whiteColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
              child: Row(
                children: [
                  AppCircleImage(icon: AppIcons.camera,),
                SizedBox(width: 10,),
                Expanded(
                  child: Container(
                      // width: Get.width*0.6,
                      child: AppInput(controller.groupNameController, 'Type group subject here')),
                ),
                  SizedBox(width: 10,),
                  Icon(AppIcons.imogiFilled,color:ColorConstants.lightBlack),
              ],),
            ),
          ),
          SizedBox(height: 20,),
      Material(
        elevation: 0.5,
        color: ColorConstants.whiteColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Disappearing messages',style: AppFonts.appHeaderBoldFontStyle,),
                SizedBox(height: 10,),
                Text('Off',style: AppFonts.appSubHeaderFontStyle,),
              ],
            ),
            Icon(AppIcons.disappearingMessages,size: 30,color: ColorConstants.lightBlack,)
          ],),
        ),
      ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text('Participants: ${controller.selectedContactList.length}',style: AppFonts.appSubHeaderBoldFontStyle,)),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
              itemCount: controller.selectedContactList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.4,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppCircleImage(imagePath:AppIcons.dummyImage),
                      SizedBox(height: 5,),
                      Text(
                        controller.selectedContactList[index].name!,
                        style: AppFonts.appSmallHeaderFontStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppUtils.gotoHome();
          AppUtils.showToastV1("Success", 'Group created successfully');
          // Get.toNamed(AppRoutes.createGroupInfoRoute);
        },
        child: Icon(AppIcons.done),
      ),
    );
  }
}
