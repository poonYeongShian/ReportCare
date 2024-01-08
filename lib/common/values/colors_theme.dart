import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFE2F1F5),
  100: Color(0xFFB6DDE5),
  200: Color(0xFF86C6D4),
  300: Color(0xFF56AFC2),
  400: Color(0xFF319DB5),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF0B84A0),
  700: Color(0xFF097997),
  800: Color(0xFF076F8D),
  900: Color(0xFF035C7D),
});
const int _primaryPrimaryValue = 0xFF0D8CA8;

const MaterialColor primaryAccent = MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFAAE5FF),
  200: Color(_primaryAccentValue),
  400: Color(0xFF44C5FF),
  700: Color(0xFF2ABDFF),
});
const int _primaryAccentValue = 0xFF77D5FF;