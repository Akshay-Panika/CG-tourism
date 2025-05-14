import 'package:carousel_slider/carousel_slider.dart';
import 'package:cg_tourism/core/costant/custom_color.dart';
import 'package:cg_tourism/core/costant/dimension.dart';
import 'package:cg_tourism/core/costant/text_style.dart';
import 'package:cg_tourism/core/widget/custom_appbar.dart';
import 'package:cg_tourism/core/widget/custom_button.dart';
import 'package:cg_tourism/feature/favorite/screen/current_booking_creen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/widget/custom_container.dart';

class PlaceDetailsScreen extends StatefulWidget {
  const PlaceDetailsScreen({super.key});

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {


  int _current = 0;

  final List<Map<String, String>> bannerData = [
    {'image': 'assets/image/thumbnail1.png'},
    {'image': 'assets/image/thumbnail2.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: 'Place Name', showBackButton: true,showFavoriteIcon: true,),

      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 4),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: bannerData.map((data) {
                  return Builder(
                    builder: (BuildContext context) {
                      return CustomContainer(
                        width: double.infinity,
                        assetsImg: data['image'],
                        borderRadius: false,
                        margin: EdgeInsets.zero,
                      );
                    },
                  );
                }).toList(),
              ),

              15.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(bannerData.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    height: 5,
                    width: _current == index ? 24 : 10,
                    decoration: BoxDecoration(
                      color: _current == index ? CustomColor.greenColor : Colors.grey,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  );
                }),
              ),
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Place Name', style: textStyle16(context,),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 14,),
                        Text('4.5  (5.523, Reviews)', style: textStyle14(context,color: CustomColor.descriptionColor),),
                      ],
                    ),

                  ],
                ),
                10.height,
                Text('This is place description'*5, style: textStyle14(context,color: CustomColor.descriptionColor),textAlign: TextAlign.start,),

                20.height,
                _RowText(context, keys: 'Open : ', valve: '8 AM - 5 PM'),
                _RowText(context, keys: 'Entry fee : ', valve: '₹ 20'),
                _RowText(context, keys: 'Location : ', valve: '______'),

              ],
            ),
          ),
          Expanded(child: CustomContainer(backgroundColor: CustomColor.whiteColor,
          networkImg: 'https://cdn.buttercms.com/aY8pmetzRZzc3fYxkOUg',)),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(text: 'Book Now',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentBookingScreen(),)),
            ),
          ),
          20.height
        ],
      )),
    );
  }
}


Widget _RowText(BuildContext context,{String? keys, String? valve}){
  return Row(
    children: [
      Text(keys!,style: textStyle14(context),),
      Text(valve!,style: textStyle14(context, color: CustomColor.descriptionColor),),
    ],
  );
}