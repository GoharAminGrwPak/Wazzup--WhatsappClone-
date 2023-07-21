import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/controller/ProfileController.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';
import 'package:wazzup/lib/widgets/AppCircleImage.dart';
import 'package:wazzup/lib/widgets/app_ink_well.dart';

class ContactDetailScreen extends StatefulWidget {
  ProfileController controller=Get.find<ProfileController>();

   ContactDetailScreen({Key? key}) : super(key: key);

  @override
  State<ContactDetailScreen> createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {

  @override
  void initState() {
    super.initState();
    widget.controller.isAppBarExpanded = true;

    widget.controller.scrollController.addListener(widget.controller.scrollListener);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppInkWell(onTap: (){
          Get.back();
        },
        child: Icon(AppIcons.backArrawIcon,color: ColorConstants.whiteColor,),),
        elevation: 0,),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.only(bottom: 20),
          color: ColorConstants.floatingBtnColoe,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppCircleImage(imagePath:AppIcons.dummyImage,width: 80,),
              Text('Ali Haider',style: AppFonts.appBarFontStyle.copyWith(color:ColorConstants.whiteColor),),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(AppIcons.phoneIcon,color: ColorConstants.whiteColor,size:29,),
                      Text('Call',style: AppFonts.appSmallHeaderFontStyle.copyWith(color:ColorConstants.whiteColor),),
                    ],
                  ),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Icon(AppIcons.videoIcon,color: ColorConstants.whiteColor,size: 30,),
                      Text('Video',style: AppFonts.appSmallHeaderFontStyle.copyWith(color:ColorConstants.whiteColor),),
                    ],
                  ),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Icon(AppIcons.searchIcon,color: ColorConstants.whiteColor,size: 30,),
                      Text('Search',style: AppFonts.appSmallHeaderFontStyle.copyWith(color:ColorConstants.whiteColor),),
                    ],
                  ),
                ],)
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15,right: 15,top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('At Work',style: AppFonts.appHeaderBoldFontStyle),
              Text('August15,2022',style: AppFonts.appSubHeaderFontStyle),
            ],),
        ),
        Container(
          margin: EdgeInsets.only(left: 15,right: 15,top: 15),

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Media, links, docs',style: AppFonts.appSubHeaderBoldFontStyle),
                  Text('10',style: AppFonts.appSubHeaderFontStyle),

                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                height: 100,
                child: ListView.builder(
                    itemCount: 12,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_,indx){
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: ColorConstants.primaryColor,
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15,right: 15,top: 15),

          child: Column(children: [
            ListTile(
              contentPadding:EdgeInsets.only(left:0),

              leading:Icon(AppIcons.notificationIcon),
              title: Text('Mute Notification',style: AppFonts.appSubHeaderBoldFontStyle),
            ),
            ListTile(
              contentPadding:EdgeInsets.only(left:0),

              leading:Icon(AppIcons.music),
              title: Text('Custom Nitifications',style: AppFonts.appSubHeaderBoldFontStyle),
            ),
            ListTile(
              contentPadding:EdgeInsets.only(left:0),

              leading:Icon(AppIcons.media),
              title: Text('Media Visibility',style: AppFonts.appSubHeaderBoldFontStyle),
            ),
          ],),
        ),
        Container(
          margin: EdgeInsets.only(left: 15,right: 15,top: 15),

          child: Column(
            children: [
              ListTile(
                contentPadding:EdgeInsets.only(left:0),
                leading:Icon(AppIcons.lock),
                title: Text('Encryption',style: AppFonts.appSubHeaderBoldFontStyle),
                subtitle: Text('Messsages and calls are end-to-end encrypted.Tap to verify',style: AppFonts.appSubHeaderFontStyle),
              ),
              ListTile(
                contentPadding:EdgeInsets.only(left:0),

                leading:Icon(AppIcons.disappearingMessages),
                title: Text('Disappearing messages',style: AppFonts.appSubHeaderBoldFontStyle),
                subtitle: Text('Off',style: AppFonts.appSubHeaderBoldFontStyle),
              ),

            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15,right: 15,top: 15),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('No groups in common',style: AppFonts.appSubHeaderBoldFontStyle),
              SizedBox(height: 10,),
              Row(children: [
                Container(
                  height:40,
                  width: 40,
                  decoration:BoxDecoration(
                      color: ColorConstants.primaryColor,
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child:
                  Icon(AppIcons.group),),
                SizedBox(width: 10,),
                Text('Create group with Ali haider',style: AppFonts.appSubHeaderBoldFontStyle)
              ],)
            ],),),
        Container(
          margin: EdgeInsets.only(left: 15,right: 15,top: 15),

          child:Column(children: [
            ListTile(
              contentPadding:EdgeInsets.only(left:0),

              leading:Icon(AppIcons.block,color: ColorConstants.red,),
              title: Text('Block Ali haider',style: AppFonts.appSubHeaderBoldFontStyle.copyWith(color: ColorConstants.red),),
            ),
            ListTile(
              contentPadding:EdgeInsets.only(left:0),

              leading:Icon(AppIcons.report,color: ColorConstants.red),
              title: Text('Report  Ali Haider',style: AppFonts.appSubHeaderBoldFontStyle.copyWith(color: ColorConstants.red)),
            ),
          ],),)
      ],),
    );
  }
}
