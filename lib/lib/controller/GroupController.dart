import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/models/ChatContactModel.dart';
import 'package:wazzup/lib/utils/AppIcons.dart';

class GroupController extends GetxController{
  TextEditingController groupNameController=TextEditingController();
  bool isBroadCast=false;
  final String selectedGroup='selectedGroup';
   List<ChatContactModel> list=[];
   List<ChatContactModel> selectedContactList=[];
   getContacts(){
     list.add(ChatContactModel.param(name: 'Áli', profilePic: AppIcons.dummyImage, contactId: 'ali@gmail.com', timeSent: DateTime.now(), lastMessage: 'Hello', status: 'Available'));
     list.add(ChatContactModel.param(name: 'Usama', profilePic: AppIcons.dummyImage, contactId: 'usama@gmail.com', timeSent: DateTime.now(), lastMessage: 'Hello', status: 'Available'));
     list.add(ChatContactModel.param(name: 'Gohar', profilePic: AppIcons.dummyImage, contactId: 'gohar@gmail.com', timeSent: DateTime.now(), lastMessage: 'Hello', status: 'In a meeting'));
     list.add(ChatContactModel.param(name: 'Haider', profilePic: AppIcons.dummyImage, contactId: 'haider@gmail.com', timeSent: DateTime.now(), lastMessage: 'Hello', status: 'Available'));
     list.add(ChatContactModel.param(name: 'Haider', profilePic: AppIcons.dummyImage, contactId: 'haider@gmail.com', timeSent: DateTime.now(), lastMessage: 'Hello', status: 'Available'));
     list.add(ChatContactModel.param(name: 'Haider', profilePic: AppIcons.dummyImage, contactId: 'haider@gmail.com', timeSent: DateTime.now(), lastMessage: 'Hello', status: 'Available'));
     list.add(ChatContactModel.param(name: 'Haider', profilePic: AppIcons.dummyImage, contactId: 'haider@gmail.com', timeSent: DateTime.now(), lastMessage: 'Hello', status: 'Available'));
     list.add(ChatContactModel.param(name: 'Haider', profilePic: AppIcons.dummyImage, contactId: 'haider@gmail.com', timeSent: DateTime.now(), lastMessage: 'Hello', status: 'Available'));
     list.add(ChatContactModel.param(name: 'Haider', profilePic: AppIcons.dummyImage, contactId: 'haider@gmail.com', timeSent: DateTime.now(), lastMessage: 'Hello', status: 'Available'));
     list.add(ChatContactModel.param(name: 'Haider', profilePic: AppIcons.dummyImage, contactId: 'haider@gmail.com', timeSent: DateTime.now(), lastMessage: 'Hello', status: 'Available'));
   }
}