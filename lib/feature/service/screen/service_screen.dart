import 'package:cg_tourism/core/costant/custom_color.dart';
import 'package:cg_tourism/core/costant/custom_image.dart';
import 'package:cg_tourism/core/costant/dimension.dart';
import 'package:cg_tourism/core/widget/custom_container.dart';
import 'package:cg_tourism/feature/service/screen/servise_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: ListView.builder(
            itemCount: 12,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
            return CustomContainer(
              height: 100,
              backgroundColor: CupertinoColors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.travel_explore, color: CustomColor.appColor,),
                  10.height,
                  Text('Location')
                ],
              ),
            );
          },),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 12,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
            return CustomContainer(
              height: 150,
              backgroundColor: CupertinoColors.white,
              assetsImg: CustomImage.thumbnailImage,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceDetailsScreen(),)),
            );
          },),
        ),
      ],
    );
  }
}
