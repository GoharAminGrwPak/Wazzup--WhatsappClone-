import 'package:flutter/material.dart';
import 'package:wazzup/lib/utils/AppConstants.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';

class AppPopupMenuButton<T> extends StatelessWidget {
  final List<T> list;
  final Function(T) callback;
  List<PopupMenuItem> item=[];
   AppPopupMenuButton({required this.list,required this.callback}){
    item=list.map((e) =>PopupMenuItem(
      height: 40,
        value: e,
        child: (e==AppConstants.more)?
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('${e}',style: AppFonts.appPopUpMenuFontStyle,),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(AppIcons.rightArrowIcon,size: 24,color: ColorConstants.black,),
              )
            ],)
            :Text('${e}',style: AppFonts.appPopUpMenuFontStyle,))).toList();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(AppIcons.menuIcon,color: ColorConstants.whiteColor,),
        elevation: 10,
        onSelected: (selected){
          callback(selected);
        },
        itemBuilder: (context)=>item);
  }
}
