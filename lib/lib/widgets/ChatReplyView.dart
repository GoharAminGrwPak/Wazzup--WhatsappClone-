import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wazzup/lib/models/ChatModel.dart';
import 'package:wazzup/lib/utils/AppFonts.dart';
import 'package:wazzup/lib/utils/ColorConstants.dart';

class ChatReplyView extends StatelessWidget{
  final ChatModel model;
  const ChatReplyView({required this.model});
  @override
  Widget build(BuildContext context) {
    return  IntrinsicHeight(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorConstants.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  8.0,
                ),
                topLeft: Radius.circular(
                  8.0,
                ),
              ),
            ),
            width: 7.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    "${model.preMsgName}",
                    style: AppFonts.appHeaderFontStyle.copyWith(color: ColorConstants.primaryColor),
                  ),
                  Text(
                    "${model.preMsg}",
                    style: AppFonts.appSubHeaderFontStyle,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}