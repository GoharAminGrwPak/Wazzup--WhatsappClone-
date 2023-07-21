import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/AppRoutes.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';
import 'package:wazzup/lib/widgets/AppCircleImage.dart';

class ChatsWidget extends StatelessWidget {
  const ChatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 6),
      child: ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (cntxt,index){
        return InkWell(
          onTap:(){
            Get.toNamed(AppRoutes.chatPageRoute);
          },
          child: Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          child: Row(children: [
            AppCircleImage(imagePath:AppIcons.dummyImage,width: 55,),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('Programmer',style: AppFonts.appHeaderBoldFontStyle,),
                SizedBox(height: 8,),
                Text('Hi, Programmer how are you',style: AppFonts.appSubHeaderFontStyle.copyWith(color:ColorConstants.lightBlack ),)
            ],),
            Spacer(),
            Column(children: [
              Text('12:15',style: AppFonts.appSubHeaderFontStyle.copyWith(color: ColorConstants.lightGreen,fontWeight: FontWeight.w500),),
              SizedBox(height: 6,),
              Container(
                alignment: Alignment.center,
                height: 28,width: 28,decoration: BoxDecoration(
                color: ColorConstants.lightGreen,
                borderRadius: BorderRadius.circular(20)
              ),child: Text('123',style: AppFonts.appSubHeaderFontStyle.copyWith(color: ColorConstants.whiteColor,fontWeight: FontWeight.w500),),)
            ],)
          ],),
        ),);
      }),
    );
  }
}
