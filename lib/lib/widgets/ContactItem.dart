import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/controller/GroupController.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';

import '../utils/AppFonts.dart';
import 'AppCheckBoxV1.dart';
import 'AppCircleImage.dart';

class ContactItem extends StatelessWidget {
  final int index;
  final GroupController controller;
  final bool isStatus;
  final Function callback;
  const ContactItem(this.index,this.controller,{this.isStatus=false,required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        selection();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        child: Row(children: [
          Stack(
            children: [
              AppCircleImage(imagePath:'${controller.list[index].profilePic}',width: 50,),
              if(isStatus==false)GetBuilder(
                init: controller,
                id: controller.list[index].contactId,
                builder: (_) {
                  return controller.list[index].isSelected==true?Positioned(
                    bottom: 5,
                    right: 0,
                    child: Container(
                      // margin: EdgeInsets.only(left: 1),
                      padding: EdgeInsets.all( 2),
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorConstants.whiteColor,width: 1),

                            color: ColorConstants.primaryColor,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Icon(AppIcons.done,color: ColorConstants.whiteColor,size: 16,)),
                  ):Container();
                }
              )
            ],
          ),
          SizedBox(width: 10,),
          if(isStatus==false)Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${controller.list[index].name}',style: AppFonts.appHeaderBoldFontStyle,),
              SizedBox(height: 8,),
              Text('${controller.list[index].status}',style: AppFonts.appSubHeaderFontStyle.copyWith(color:ColorConstants.lightBlack ),)
            ],),
          if(isStatus==true)   Expanded(child: Text('${controller.list[index].name}',style: AppFonts.appHeaderBoldFontStyle,)),

          if(isStatus==true)SizedBox(width: 10,),
          if(isStatus==true)GetBuilder(
              init: controller,
              id: controller.list[index].contactId!,
              builder: (_) {
              return AppCheckBoxV1('', controller.list[index].isSelected, (p0){
                selection();
              });
            }
          )
        ],),
      ),
    );
  }

  void selection() {
    controller.list[index].isSelected= (!controller.list[index].isSelected);
    debugPrint('AppInkWell>> ${controller.list[index].isSelected}');
    controller.update([controller.list[index].contactId!]);
    if(controller.selectedContactList.contains(controller.list[index])){
      controller.selectedContactList.remove(controller.list[index]);
    }else{
      controller.selectedContactList.add(controller.list[index]);
    }
    callback();

  }
}
