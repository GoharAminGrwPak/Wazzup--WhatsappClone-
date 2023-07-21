import 'package:get/get.dart';
import 'package:wazzup/lib/controller/ChatController.dart';
import 'package:wazzup/lib/controller/GroupController.dart';
import 'package:wazzup/lib/controller/HomeController.dart';
import 'package:wazzup/lib/controller/ProfileController.dart';
import 'package:wazzup/lib/controller/StatusController.dart';


class AppDependencies{
  static void addDependencies(){
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => GroupController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => StatusController());
    Get.lazyPut(() => ProfileController());
  }
}