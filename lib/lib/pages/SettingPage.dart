import 'package:flutter/material.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Setting',style: AppFonts.appBarFontStyle,),
      ),
      body: SingleChildScrollView(child: Column(children: [
        itemStatusWIdget("Gohar Amin","Allah tera shuker hai" ),
        Divider(),
        buildListTile(AppIcons.keyIcon,"Account","Security notifications, change number"),
        buildListTile(AppIcons.privacyIcon,"Privacy","Block contacts, disappearing messages"),
        // buildListTile(AppIcons.keyIcon,"Avatar","Create, edit, profile photo"),
        buildListTile(AppIcons.messageIcon,"Chats","Theme, wallpapers, chat history"),
        buildListTile(AppIcons.notificationIcon,"Notifications","Messages,group & call tones"),
        buildListTile(AppIcons.syncIcon,"Storage and data","Network usage, auto-download"),
        buildListTile(AppIcons.languageIcon,"App Language","English"),
        buildListTile(AppIcons.helpIcon,"Help","Help center, contact us, privacy policy"),
        buildListTile(AppIcons.inviteIcon,"Invite a friend",""),
      ],),),
    );
  }

  ListTile buildListTile(dynamic icon,String title,String subTitle) {
    return ListTile(
        leading: Padding(
          padding:  EdgeInsets.only(top: subTitle.isEmpty?0:6.0),
          child: Icon(icon),
        ),
        title: Text(title,style: AppFonts.appHeaderFontStyle.copyWith(fontWeight: FontWeight.w500),),
        subtitle:  Text(subTitle,style: AppFonts.appSubHeaderFontStyle,),
      );
  }
  Container itemStatusWIdget(String name,String date) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14,vertical: 6),
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
      ],),
    );
  }

  Container statusContent() {
    return Container(
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          // border: Border.all(color: ColorConstants.greyColor,width: 3)
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child:
          Image.network('https://tse1.mm.bing.net/th?id=OIP.fK5LE_-0NA1N2d1oka_DQgAAAA&pid=Api&P=0',fit:BoxFit.cover,height: 55,width: 55,)),
    );
  }
}
