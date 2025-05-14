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

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Favorite',
        showSearchIcon: true,
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
              return Stack(
                children: [
                  CustomContainer(
                    backgroundColor: CustomColor.whiteColor,
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomContainer(
                          margin: EdgeInsets.zero,
                          height: 100,
                          width: 180,
                          assetsImg: CustomImage.thumbnailImage,),
                        15.width,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              20.height,
                              Text('Place Name', style: textStyle14(context),),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined,size: 14,),
                                  Text('4.5 KM', style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                ],
                              ),
                              Text('Location Name', style: textStyle12(context, color: CustomColor.descriptionColor),),

                            ],
                          ),
                        ),
                      ],
                    ),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceDetailsScreen(),)),
                  ),

                  Positioned(
                    right: 0,top: 0,
                    child: CustomFavoriteButton(),
                  )
                ],
              );
            },),
          )
        ],
      ),
    );
  }
}
