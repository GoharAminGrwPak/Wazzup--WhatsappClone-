import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/utils/AppConstants.dart';

class AppInput extends StatelessWidget {
  TextEditingController controller;
  String label="";
  String? placeholder;
  bool isRequired=false;
  bool isEnabled=true;
  Widget? icon;
  int? maxLength,maxLines,minimumLines;
  TextInputType? textInputType;
  bool isBorder=true;
  List<TextInputFormatter>? formaters;
  final Function? onTextChanged;
  AppInput(this.controller,this.label,{this.isRequired=false,this.placeholder,this.maxLines,this.minimumLines,this.icon,this.isEnabled=true,this.textInputType,this.formaters,this.maxLength,this.onTextChanged,this.isBorder=true}) ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: formaters,
      keyboardType: textInputType,
      maxLines:maxLines??1,
      minLines: minimumLines??1,
      maxLength: maxLength,

      onChanged: (query) {
        onTextChanged!(query);
      },
      validator: (v){
        if(isRequired==true&&v!.isEmpty)
        {
          return "Field must be filled".tr;
        }
        else{
          return null;
        }
      },
      decoration: InputDecoration(
        suffixIcon:icon==null?const Visibility(
            visible:false,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              // child: Icon(Icons.arrow_drop_down),
            )):Padding(
          padding: const EdgeInsets.all(0),
          child: icon,
        ),
        isCollapsed: true,
        isDense: true,
        counterText: "",
        hintText: label,
        enabled: isEnabled,
        contentPadding: EdgeInsets.only(top: 12,bottom: 0,left: 6,right: 6),
        border: isBorder?AppConstants.outlineInputBorderLight:AppConstants.noneInputBorder,
        focusedBorder: isBorder?AppConstants.outlineInputBorderLight:AppConstants.noneInputBorder,
        enabledBorder: isBorder?AppConstants.outlineInputBorderLight:AppConstants.noneInputBorder,
        errorBorder: isBorder?AppConstants.outlineInputBorderLight:AppConstants.noneInputBorder,
        // label: Row(children: [Text('${label}'.tr,style: TextStyle(color: ColorConstants.greyColor),),Text("${this.isRequired==true?' *':''}",style: TextStyle(color: Colors.red),)],),
      ),
    );
  }
}