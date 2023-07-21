import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileController extends GetxController{
  String appBarCollapse='appBarCollapse';
  ScrollController scrollController=ScrollController();
  bool isAppBarExpanded = true;

  void scrollListener() {
    debugPrint('ScrollController >>>  ${scrollController.offset} ${isAppBarExpanded}');
    if (scrollController.offset >= 250 && isAppBarExpanded) {
        isAppBarExpanded = false;
    } else if (scrollController.offset < 250 && !isAppBarExpanded) {
        isAppBarExpanded = true;
    }
    update([appBarCollapse]);
  }
}