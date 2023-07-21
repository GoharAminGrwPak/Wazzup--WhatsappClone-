import 'package:flutter/material.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';
import 'package:wazzup/lib/widgets/AppCircleImage.dart';

class StatusWidget extends StatelessWidget {

  const StatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 6),
      child: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              itemStatusWIdget('My Status', 'Today, 2:35 am',true),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Recent Updates',style: AppFonts.appSubHeaderFontStyle.copyWith(fontWeight:FontWeight.w500,color: ColorConstants.black.withOpacity(0.6)),),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  shrinkWrap: true,
                  itemBuilder: (cntxt,index){
                return itemStatusWIdget('Alex', 'Today, 2:35 am',false);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Container itemStatusWIdget(String name,String date,bool isMine) {
    return Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: Row(children: [
                statusContent(),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('${name}',style: AppFonts.appHeaderBoldFontStyle,),
                  SizedBox(height: 6,),
                  Text('${date}',style: AppFonts.appSubHeaderFontStyle.copyWith(fontWeight: FontWeight.w500,color: ColorConstants.lightBlack),)
                ],),
                if(isMine)Spacer(),
                if(isMine)Icon(AppIcons.menuIcon,size: 28,color: ColorConstants.lightGreen,)
              ],),
            );
  }

  Container statusContent() {
    return Container(
                padding: EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),

                    border: Border.all(color: ColorConstants.greyColor,width: 3)
                ),
                child: AppCircleImage(imagePath:AppIcons.dummyImage,width: 45,),
              );
  }
}
