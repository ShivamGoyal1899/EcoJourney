import 'dart:ui';

import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<PermissionGroup, PermissionStatus> permissions;

void getPermission() async {
  permissions = await PermissionHandler().requestPermissions([
    PermissionGroup.microphone,
    PermissionGroup.camera,
    PermissionGroup.contacts,
    PermissionGroup.storage,
    PermissionGroup.phone,
    PermissionGroup.sms,
    PermissionGroup.location,
    PermissionGroup.notification,
  ]);
}

var registrationStatus;
var myName;
var myEmail;
var myReward;

void updateReward(myReward) async {
  final prefs = await SharedPreferences.getInstance();
  final rewardKey = 'myReward';
  prefs.setString(rewardKey, myReward);
}

void checkRegistrationStatus() async {
  final prefs = await SharedPreferences.getInstance();

  final registrationStatusKey = 'registrationStatus';
  registrationStatus =
      prefs.getString(registrationStatusKey) ?? 'Not Registered';

  final nameKey = 'myName';
  final emailKey = 'myEmail';
  final rewardKey = 'myReward';

  myName = prefs.getString(nameKey) ?? 'Unknown';
  myEmail = prefs.getString(emailKey) ?? 'unknown@xyz.com';
  myReward = prefs.getString(rewardKey) ?? '200';

  print(registrationStatus);
}

void registerUser(myName, myEmail) async {
  final prefs = await SharedPreferences.getInstance();

  print(myName);
  print(myEmail);

  final nameKey = 'myName';
  final emailKey = 'myEmail';
  final rewardKey = 'myReward';

  prefs.setString(nameKey, myName);
  prefs.setString(emailKey, myEmail);
  prefs.setString(rewardKey, '200');

  registrationStatus = 'Registered';
  final registrationStatusKey = 'registrationStatus';
  prefs.setString(registrationStatusKey, registrationStatus);
  print(registrationStatus);
}

void deregisterUser() async {
  final prefs = await SharedPreferences.getInstance();

  final rewardKey = 'myReward';
  prefs.setString(rewardKey, '200');

  registrationStatus = 'Not Registered';
  final registrationStatusKey = 'registrationStatus';
  prefs.setString(registrationStatusKey, registrationStatus);
  print(registrationStatus);
}

const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

const List<Color> signUpGradients = [
  Color(0xFFFF9945),
  Color(0xFFFc6076),
];
