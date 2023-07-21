import 'package:get/get.dart';
import 'package:wazzup/lib/controller/GroupController.dart';
import 'package:wazzup/lib/utils/AppConstants.dart';


class StatusController extends GetxController{
  List<String> privacyList=[
    AppConstants.myContacts,
    AppConstants.myContactsExcept,
    AppConstants.onlyShareWith
  ];
  String selectedItem=AppConstants.myContacts;
  String radioSelection='radioSelection';
  GroupController groupController=Get.find<GroupController>();
}