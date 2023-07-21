import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/controller/GroupController.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';
import 'package:wazzup/lib/widgets/AppCircleImage.dart';

class SelectContactItem extends StatelessWidget {
  final int index;
  final GroupController controller;
  const SelectContactItem(this.index,this.controller);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        var indexOf = controller.list.indexOf(controller.selectedContactList[index]);
        controller.list[indexOf].isSelected= (!controller.list[indexOf].isSelected);
        debugPrint('AppInkWell>> ${controller.list[indexOf].isSelected}');
        controller.update([controller.list[indexOf].contactId!]);
        if(controller.selectedContactList.contains(controller.list[indexOf])){
          controller.selectedContactList.remove(controller.list[indexOf]);

        }else{
          controller.selectedContactList.add(controller.list[indexOf]);

        }
        controller.update([controller.selectedGroup]);
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Column(children: [
          Stack(
            children: [
              AppCircleImage(imagePath:'${controller.selectedContactList[index].profilePic}'),
              GetBuilder(
                init: controller,
                id: controller.selectedContactList[index].contactId,
                builder: (_) {
                  return Positioned(
                    bottom: 5,
                    right: 0,
                    child: Container(
                      // margin: EdgeInsets.only(left: 1),
                      padding: EdgeInsets.all( 2),
                        decoration: BoxDecoration(
                            color: ColorConstants.red,
                            border: Border.all(color: ColorConstants.whiteColor,width: 1),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Icon(AppIcons.clear,color: ColorConstants.whiteColor,size: 16,)),
                  );
                }
              )
            ],
          ),
          SizedBox(width: 10,),
          Text('${controller.selectedContactList[index].name}',style: AppFonts.appHeaderBoldFontStyle,),
        ],),
      ),
    );
  }
}
