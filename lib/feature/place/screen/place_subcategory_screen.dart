import 'package:cg_tourism/core/costant/custom_color.dart';
import 'package:cg_tourism/core/costant/custom_image.dart';
import 'package:cg_tourism/core/costant/dimension.dart';
import 'package:cg_tourism/core/costant/text_style.dart';
import 'package:cg_tourism/core/widget/custom_appbar.dart';
import 'package:cg_tourism/core/widget/custom_container.dart';
import 'package:cg_tourism/core/widget/custom_favorite_button.dart';
import 'package:cg_tourism/feature/place/screen/place_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaceSubcategoryScreen extends StatelessWidget {
  const PlaceSubcategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Place', showBackButton: true,),

      body: SafeArea(
        child: Row(
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
                        Icon(Icons.travel_explore, color: CustomColor.greenColor,),
                        10.height,
                        Text('Location', style: textStyle12(context, color: CustomColor.greenColor),)
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
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceDetailsScreen(),)),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CustomFavoriteButton(),
                    ),
                  );
                },),
            ),
          ],
        ),
      ),
    );
  }
}
