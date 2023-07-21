import 'package:flutter/material.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/widgets/app_ink_well.dart';

class AppRadioButton extends StatefulWidget {
  final Function(String) onSelected;
  final String groupValue;
  final String value;
  final String text;
   const AppRadioButton({required this.value,required this.groupValue,required this.text,required this.onSelected});

  @override
  State<AppRadioButton> createState() => _AppRadioButtonState();
}

class _AppRadioButtonState extends State<AppRadioButton> {
  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: (){
        setState(() {
          // widget.groupValue=widget.value;
          widget.onSelected(widget.value);
        });

      },
      child: Row(
        children: [
          Radio(
            value: widget.value,
            groupValue: widget.groupValue,
            onChanged: (value) {
              setState(() {
                // widget.groupValue=value as String;
                widget.onSelected(value as String);
              });
            },
          ),
          Text('${widget.text}',style: AppFonts.appSubHeaderFontStyle,),
        ],
      ),
    );
  }
}
