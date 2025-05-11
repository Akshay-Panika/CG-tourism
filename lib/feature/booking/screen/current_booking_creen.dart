import 'package:cg_tourism/core/widget/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentBookingScreen extends StatelessWidget {
  const CurrentBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Current Booking', showBackButton: true,),
    );
  }
}
