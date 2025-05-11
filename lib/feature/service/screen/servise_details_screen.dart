import 'package:carousel_slider/carousel_slider.dart';
import 'package:cg_tourism/core/costant/dimension.dart';
import 'package:cg_tourism/core/widget/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/widget/custom_container.dart';

class ServiceDetailsScreen extends StatefulWidget {
  const ServiceDetailsScreen({super.key});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {


  int _current = 0;

  final List<Map<String, String>> bannerData = [
    {'image': 'assets/image/thumbnail1.png'},
    {'image': 'assets/image/thumbnail2.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: 'Place Name', showBackButton: true,showFavoriteIcon: true,),

      body: SafeArea(child: Column(
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

              50.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(bannerData.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    height: 5,
                    width: _current == index ? 24 : 10,
                    decoration: BoxDecoration(
                      color: _current == index ? Colors.blueAccent : Colors.grey,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
