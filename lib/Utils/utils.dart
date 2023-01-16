import 'package:flutter/material.dart';

import '../Screens/first_page.dart';

List<Widget> homeScreenItems = [
  const FirstPage(),
  const Text('Booking'),
  const Text('Saved'),
  const Text('Notifications'),
  const Text('Menu'),
];

Color activeColor = Colors.black;
Color inactiveColor = const Color(0xFFe7eced);
