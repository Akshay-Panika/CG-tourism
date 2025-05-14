import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../place/screen/place_screen.dart';
import 'home_screen.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {

  String selectedPlace = '';
  bool isHomeScreen = true;
  void toggleScreen(bool value, String placeName) {
    setState(() {
      isHomeScreen = value;
      selectedPlace = placeName;
    });
  }


  @override
  Widget build(BuildContext context) {
    return isHomeScreen ?
           HomeScreen(onToggle: toggleScreen,placeName: selectedPlace,):
           PlaceScreen(onToggle: (val) => toggleScreen(val, selectedPlace), placeName: selectedPlace);
  }
}
