import 'package:flutter/material.dart';
class AppInkWell extends StatelessWidget {
  final Widget child;
  bool isEnabled=false;
  Function onTap;
  Color? splashColor;
  BorderRadius? borderRadius;
   AppInkWell({Key? key,required this.child,required this.onTap,this.splashColor,this.borderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor:splashColor ,
      borderRadius:borderRadius,
      child: child,onTap: (){
      if(isEnabled==false) {
        isEnabled=true;
        Future.delayed(Duration(milliseconds: 2000),(){
          isEnabled=false;
        });
        onTap();
      }
    },);
  }
}
