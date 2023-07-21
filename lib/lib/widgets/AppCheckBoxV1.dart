import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';


class AppCheckBoxV1 extends StatelessWidget {
  String? text;
  bool? value;
  double? textSize=18;
  Function(bool) setSelectedRadioTile;
  bool? isLow=false;
  bool isStart=false;
  bool isWrap=false;
  AppCheckBoxV1(this.text,this.value,this.setSelectedRadioTile,{this.isStart=false,this.textSize=18,this.isLow=false,this.isWrap=false});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        value= !value!;
        setSelectedRadioTile(value!);
      },
      child: Container(
        child: Icon(AppIcons.check,size: 10,color: ColorConstants.whiteColor,),
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: value==true ? ColorConstants.red : Colors.transparent,
          border: Border.all(
            width: 2.0,
            color: value==true ? ColorConstants.red : Colors.transparent,
          ),
        ),
      ),
    );
  }
}