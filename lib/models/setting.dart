import 'package:flutter/material.dart';

import 'package:alumina/shared/shared.dart' as Iconic;

class MenuContent extends Object {
  final String name;
  final Widget active;
  final Widget inactive;
  final bool isactive;

  MenuContent({this.name, this.active, this.inactive, this.isactive = false});
}

List<String> gender = ["Laki-laki", "Perempuan"];

List<MenuContent> menuTab = [
  MenuContent(name: 'Home', active: Iconic.home, inactive: Iconic.homeAEC0DB),
  MenuContent(
      name: 'Archive', active: Iconic.menu, inactive: Iconic.menuAEC0DB),
  MenuContent(
      name: 'Setting', active: Iconic.settings, inactive: Iconic.settingsAEC0DB)
];

List<MenuContent> menuSetting = [
  MenuContent(
      name: 'profile', active: Iconic.user, inactive: Iconic.userDDE9FB),
  MenuContent(
      name: 'address', active: Iconic.mappin, inactive: Iconic.mappinDDE9FB),
  MenuContent(
      name: 'phone number',
      active: Iconic.smartphone,
      inactive: Iconic.smartphoneDDE9FB),
  MenuContent(
      name: 'logout',
      active: Iconic.logout,
      inactive: Iconic.logoutDDE9FB,
      isactive: true)
];
