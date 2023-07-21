import 'package:flutter/material.dart';
import 'package:wazzup/lib/models/MediaModel.dart';
import 'package:wazzup/lib/pages/ChatPage.dart';
import 'package:wazzup/lib/pages/CreateGroupInfoPage.dart';
import 'package:wazzup/lib/pages/CreateGroupPage.dart';
import 'package:wazzup/lib/pages/HomePage.dart';
import 'package:wazzup/lib/pages/LandinPage.dart';
import 'package:wazzup/lib/pages/LoginPage.dart';
import 'package:wazzup/lib/pages/OpenMediaMessagePage.dart';
import 'package:wazzup/lib/pages/OtpScreenPage.dart';
import 'package:wazzup/lib/pages/SettingPage.dart';
import 'package:wazzup/lib/pages/SignUpPage.dart';
import 'package:wazzup/lib/pages/SplashPage.dart';
import 'package:wazzup/lib/pages/StarredMessagePage.dart';
import 'package:wazzup/lib/pages/StatusPrivacyPage.dart';
import 'package:wazzup/lib/pages/StatusPrivacySettingPage.dart';
import 'package:wazzup/lib/pages/UserInfoPage.dart';


class RoutesGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch(settings.name){
      case AppRoutes.splashPageRoute:
        return MaterialPageRoute(builder: (_) => Splash());
        case AppRoutes.homePageRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
        case AppRoutes.chatPageRoute:
        return MaterialPageRoute(builder: (_) => ChatPage());
      case AppRoutes.settingPageRoute:
        return MaterialPageRoute(builder: (_) => SettingPage());
        case AppRoutes.createGroupPageRoute:
        return MaterialPageRoute(builder: (_) => CreateGroup());
        case AppRoutes.createGroupInfoRoute:
        return MaterialPageRoute(builder: (_) => CreateGroupInfo());
        case AppRoutes.statusPrivacyRoute:
        return MaterialPageRoute(builder: (_) => StatusPrivacy());
        case AppRoutes.statusPrivacySettingRoute:
        return MaterialPageRoute(builder: (_) => StatusPrivacySetting());
        case AppRoutes.starredMessagesRoute:
        return MaterialPageRoute(builder: (_) => StarredMessage());
        case AppRoutes.loginPageRoute:
        return MaterialPageRoute(builder: (_) => Login());
        case AppRoutes.infoPageRoute:
        return MaterialPageRoute(builder: (_) => ContactDetailScreen());
        case AppRoutes.signUpPageRoute:
        return MaterialPageRoute(builder: (_) => SignupScreen());
        case AppRoutes.otpPageRoute:
        return MaterialPageRoute(builder: (_) => OtpScreen());
        case AppRoutes.landingPageRoute:
        return MaterialPageRoute(builder: (_) => LandingPage());
        case AppRoutes.openMediaMessagePageRoute:
        return MaterialPageRoute(builder: (_) => OpenMediaMessage(args as MediaModel));
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
class AppRoutes{
  static const splashPageRoute='/';
  static const landingPageRoute='landingPage';
  static const loginPageRoute='loginPage';
  static const signUpPageRoute='signUpPage';
  static const otpPageRoute='otpPage';
  static const infoPageRoute='infoPage';
  static const homePageRoute='homePage';
  static const settingPageRoute='settingPage';
  static const chatPageRoute='chatPage';
  static const createGroupPageRoute='createGroupPage';
  static const openMediaMessagePageRoute='openMediaMessagePage';
  static const createGroupInfoRoute='createGroupInfo';
  static const statusPrivacyRoute='statusPrivacy';
  static const statusPrivacySettingRoute='statusPrivacySetting';
  static const starredMessagesRoute='starredMessages';
}