import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCheckBox extends StatelessWidget {
  String? text;
  bool? value;
  double? textSize=18;
  Function(bool) setSelectedRadioTile;
  bool? isLow=false;
  bool isStart=false;
  bool isWrap=false;
  AppCheckBox(this.text,this.value,this.setSelectedRadioTile,{this.isStart=false,this.textSize=18,this.isLow=false,this.isWrap=false});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        value= !value!;
        setSelectedRadioTile(value!);
      },
      child: Row(
        mainAxisSize: isWrap==true?MainAxisSize.min:MainAxisSize.max,
        mainAxisAlignment: this.isStart?MainAxisAlignment.start:MainAxisAlignment.end,
        children: [
          Checkbox(
              splashRadius: 20,
              value: value,
              onChanged: (v) {
                value= v as bool;
                setSelectedRadioTile(value!);
              }),
          Text("$text",style:Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: textSize!,
            color: Colors.black,
            fontWeight: (isLow! ==true)?FontWeight.w300:FontWeight.w500,)),
        ],
      ),
    );
  }
}