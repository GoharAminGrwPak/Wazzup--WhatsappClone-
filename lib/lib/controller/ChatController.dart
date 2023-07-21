import 'package:get/get.dart';
import 'package:wazzup/lib/utils/AppConstants.dart';

class ChatController extends GetxController{
  static const viewContact='View Contact';
  static const mediaLinkDocs='Media, Links, and docs';
  static const search='Search';
  static const muteNotifications='Mute Notifications';
  static const disappearingMessages='Disappearing Messages';
  static const wallpaper='Wallpaper';
  static const more='More';
  static const report='Report';
  static const block='Block';
  static const clearChat='Clear Chat';
  static const exportChat='Export Chat';
  static const addShortcut='Add Shortcut';
  List<String> dropDownList=[
    AppConstants.viewContact,
    AppConstants.mediaLinkDocs,
    AppConstants.search,
    AppConstants.muteNotifications,
    AppConstants.disappearingMessages,
    AppConstants.wallpaper,
    AppConstants.more,
  ];
  List<String> moreList=[
    AppConstants.report,
    AppConstants.block,
    AppConstants.clearChat,
    AppConstants.exportChat,
    AppConstants.addShortcut,
  ];


}