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

class PlaceSubcategoryScreen extends StatefulWidget {
  final String districtName;
  const PlaceSubcategoryScreen({super.key, required this.districtName});

  @override
  State<PlaceSubcategoryScreen> createState() => _PlaceSubcategoryScreenState();
}

class _PlaceSubcategoryScreenState extends State<PlaceSubcategoryScreen> {

  final List<Map<String, dynamic>> placesWithIcons = [
    {"name": "Temple", "icon": Icons.account_balance},
    {"name": "Mountain", "icon": Icons.terrain},
    {"name": "River", "icon": Icons.water},
    {"name": "Palace", "icon": Icons.account_balance_outlined},
    {"name": "Railway Station", "icon": Icons.train},
    {"name": "Stadium", "icon": Icons.sports_soccer},
    {"name": "Restaurant", "icon": Icons.restaurant},
    {"name": "Forest", "icon": Icons.forest},
    {"name": "Market", "icon": Icons.store},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'District,  ${widget.districtName}', showBackButton: true,),

      body: SafeArea(
        child: Column(
          children: [

            /// Filter
            Row(
              children: [
                Expanded(
                  child: CustomContainer(
                    height: 40,
                    backgroundColor: Colors.transparent,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    padding: EdgeInsets.all(0),
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CustomContainer(
                          border: true,
                          backgroundColor: Colors.white,
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          width: 100,child: Center(child: Text("Filter $index",style: textStyle12(context, color: CustomColor.greenColor,fontWeight: FontWeight.w400),)),);
                      },),
                  ),
                ),

                CustomContainer(
                  border: true,
                  backgroundColor: CustomColor.whiteColor,
                  child: Icon(Icons.filter_list, color: CustomColor.greenColor,),
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.zero,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) => FractionallySizedBox(
                        heightFactor: 0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Filter Options', style: textStyle14(context,)),
                              10.height,

                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: 5,
                                        itemBuilder: (context, index) {
                                          return CustomContainer(
                                            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                            child: Text("Filter $index"),
                                            onTap: () {
                                              // Apply filter logic here
                                              Navigator.pop(context); // Optional: close on selection
                                            },
                                          );
                                        },),
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: Container()),
                                  ],
                                ),
                              ),



                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context); // Close the bottom sheet
                                },
                                child: Text('Apply Filters'),
                              ),
                              30.height
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                10.width
              ],
            ),

            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: ListView.builder(
                      itemCount: placesWithIcons.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return CustomContainer(
                          height: 100,
                          backgroundColor: CupertinoColors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(placesWithIcons[index]['icon'], color: CustomColor.greenColor,),
                              10.height,
                              Text(placesWithIcons[index]['name'], style: textStyle12(context, color: CustomColor.greenColor),textAlign: TextAlign.center,)
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
                          height: 200,
                          padding: EdgeInsets.zero,
                          backgroundColor: CupertinoColors.white,
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceDetailsScreen(),)),
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CustomContainer(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                assetsImg: CustomImage.thumbnailImage,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: CustomFavoriteButton(),
                                ),
                                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceDetailsScreen(),)),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Place Name', style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Location Name', style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on_outlined,size: 14,),
                                          Text('4.5 KM', style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        );
                      },),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
