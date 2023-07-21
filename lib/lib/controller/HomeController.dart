import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/utils/AppConstants.dart';

import 'GroupController.dart';


class HomeController extends GetxController{
  // TabController tabController = TabController(length: 3, vsync: this);
  int index=0;
  String homeTab='homeTab';
  GroupController controller=Get.find<GroupController>();
  List<String> chatsList=[AppConstants.newGroup,AppConstants.newBroadcast,AppConstants.starredMessages,AppConstants.settings];
  List<String> statusList=[AppConstants.statusPrivacy,AppConstants.settings];
  List<String> callList=[AppConstants.clearLog,AppConstants.settings];

}