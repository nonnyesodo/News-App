import 'package:flutter/material.dart';

class HomeStaticRepo {
  static List<BottomNavModel> bottomNav = [
    BottomNavModel(
        iconActivate: Icons.home,
        iconInactive: Icons.home_outlined,
        label: 'Today'),
    BottomNavModel(
        iconActivate: Icons.audiotrack,
        iconInactive: Icons.audiotrack_outlined,
        label: 'Audio'),
    BottomNavModel(
        iconActivate: Icons.person_3,
        iconInactive: Icons.person_3_outlined,
        label: 'Profile'),
  ];
}

class BottomNavModel {
  final String label;
  final IconData? iconActivate, iconInactive;
  BottomNavModel(
      {required this.label,
      required this.iconActivate,
      required this.iconInactive});
}
