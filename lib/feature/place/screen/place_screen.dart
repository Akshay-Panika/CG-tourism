import 'package:carousel_slider/carousel_slider.dart';
import 'package:cg_tourism/core/costant/custom_color.dart';
import 'package:cg_tourism/core/costant/dimension.dart';
import 'package:cg_tourism/core/widget/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/costant/text_style.dart';
import '../../../core/widget/custom_banner.dart';
import '../../../core/widget/custom_container.dart';
import '../../../core/widget/custom_search_bar.dart';
import '../../../core/widget/custom_service_list.dart';
import '../../search/screen/search_screen.dart';

class PlaceScreen extends StatefulWidget {
  final String placeName;
  final Function(bool) onToggle;
  PlaceScreen({super.key, required this.onToggle, required this.placeName});

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  int _current = 0;

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
    return Scaffold(
      appBar: CustomAppBar(
        titleWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text('${widget.placeName}', style: textStyle16(context, color: CustomColor.greenColor),),
          SizedBox(height: 2),
          Text(
            "Waidhan Singrauli Madhya Pradesh Pin- 486886",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
        showSearchIcon: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: IconButton(onPressed: () {
          setState(() {
           widget.onToggle(true);
                 });
                }, icon: Icon(Icons.dashboard, color: CustomColor.greenColor,)),
        ),
        leadingWidth: 40,
      ),

      body: CustomScrollView(
        slivers: [
           SliverToBoxAdapter(child: Column(
             children: [
               0.height,
               Column(
                 children: [
                   CarouselSlider(
                     options: CarouselOptions(
                       height: 250,
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
                             borderRadius: false,
                             width: double.infinity,
                             assetsImg: data['image'],
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
               20.height,

               CustomServiceList(headline: 'Suggestion for you',),
               10.height,
               CustomServiceList(headline: 'Popular Place',),
               10.height,
               CustomServiceList(headline: 'Near by Place',),
               10.height,
             ],
           ),)
        ],
      ),
    );
  }
}
