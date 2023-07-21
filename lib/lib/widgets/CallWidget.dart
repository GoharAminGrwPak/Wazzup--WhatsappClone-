import 'package:flutter/material.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';
import 'package:wazzup/lib/widgets/AppCircleImage.dart';

class CallWidget extends StatelessWidget {
  const CallWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 6),
      child: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              itemStatusWIdget(-1,'Create a call link', 'Share a link for your Whatsapp call',true),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Recent Updates',style: AppFonts.appSubHeaderFontStyle.copyWith(fontWeight:FontWeight.w500,color: ColorConstants.black.withOpacity(0.6)),),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (cntxt,index){
                    return itemStatusWIdget(index,'Alex', '41 minutes ago',false);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Container itemStatusWIdget(int index,String name,String date,bool isLink) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Row(children: [
        statusContent(isLink),
        SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${name}',style: AppFonts.appHeaderBoldFontStyle,),
            SizedBox(height: 6,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if(!isLink&&index==0)Icon(AppIcons.outGoingCall,size:19,color: ColorConstants.lightGreen,),
                if(!isLink&& index>=1)Icon(AppIcons.inComingCall,size:19,color: ColorConstants.red,),
                Text('${date}',style: AppFonts.appSubHeaderFontStyle.copyWith(fontWeight: FontWeight.w500,color: ColorConstants.lightBlack),),
              ],
            )
          ],),
        if(!isLink)Spacer(),
        if(!isLink&&index==0)Icon(AppIcons.phoneIcon,size:26,color: ColorConstants.primaryColor,),
        if(!isLink&&index>=1)Icon(AppIcons.videoIcon,size:26,color: ColorConstants.primaryColor,),
      ],),
    );
  }

  Container statusContent(bool isLink) {
    return Container(
      padding: EdgeInsets.all(isLink?16:0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: isLink?ColorConstants.primaryColor:null,
          // border: Border.all(color: ColorConstants.greyColor,width: 3)
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child:
          isLink?Icon(AppIcons.linkIcon,size: 20,color: ColorConstants.whiteColor,):AppCircleImage(imagePath:AppIcons.dummyImage,width: 55,)),
    );
  }
}
