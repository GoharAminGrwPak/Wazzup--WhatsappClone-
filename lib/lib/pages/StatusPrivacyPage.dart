import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/controller/StatusController.dart';
import 'package:wazzup/lib/utils/AppConstants.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/AppRoutes.dart';
import 'package:wazzup/lib/widgets/AppRadioButton.dart';

class StatusPrivacy extends StatelessWidget {
   StatusController controller=Get.find<StatusController>();
   StatusPrivacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(AppConstants.statusPrivacy,style: AppFonts.appBarFontStyle,),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: 20,),
          Text('Who can see my status updates',style: AppFonts.appSubHeaderBoldFontStyle,),
          SizedBox(height: 20,),
          GetBuilder(
            init: controller,
            id: controller.radioSelection,
            builder: (_) {
              return ListView.builder(
                  itemCount:controller.privacyList.length ,
                  shrinkWrap: true,
                  itemBuilder: (_,index){
                return AppRadioButton(value: controller.privacyList[index], groupValue: controller.selectedItem, text: controller.privacyList[index], onSelected: (val){

                  if((val==AppConstants.myContacts)){
                    controller.selectedItem=val;
                    controller.update([controller.radioSelection]);

                  }else{
                    controller.groupController.list=[];
                    controller.groupController.selectedContactList=[];
                    Get.toNamed(AppRoutes.statusPrivacySettingRoute)?.then((value){

                      controller.selectedItem=val;
                      controller.update([controller.radioSelection]);
                    });
                  }
                });
              });
            }
          ),
          SizedBox(height: 20,),
          Text("Changes to your privacy settings won\'t affect status updates that yo\'ve sent already",style: AppFonts.appSubHeaderBoldFontStyle,),
        ],),),
    );
  }
}
