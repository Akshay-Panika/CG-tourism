import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../feature/place/screen/place_details_screen.dart';
import 'custom_container.dart';
import 'custom_favorite_button.dart';
import 'custom_headline.dart';

class CustomServiceList extends StatelessWidget {
  final String headline;
   CustomServiceList({super.key, required this.headline});

  final List<Map<String, String>> bannerData = [
    {
      'image' : 'assets/image/thumbnail1.png'
    },
    {
      'image' : 'assets/image/thumbnail2.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeadline(headline: headline,),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bannerData.length,
            itemBuilder: (context, index) {
              return CustomContainer(
                border: true,
                width: 300,
                backgroundColor: Colors.white,
                padding: EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomContainer(
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(0),
                        assetsImg: '${bannerData[index]['image']}',
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
            },
          ),
        ),
      ],
    );
  }
}
