import 'package:cg_tourism/core/costant/dimension.dart';
import 'package:cg_tourism/core/widget/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/costant/custom_color.dart';
import '../../../core/widget/custom_container.dart';
import '../../../core/widget/custom_headline.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Place',showFavoriteIcon: true,),

      body: Column(
        children: [

          20.height,
          CustomHeadline(headline: 'Locations',),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.11 / 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
              ),
              itemBuilder: (context, index) {
                return CustomContainer(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  backgroundColor: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: CustomContainer(
                        backgroundColor: Colors.transparent,
                        child: Icon(Icons.travel_explore, size: 30, color: CustomColor.appColor,),
                      )),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Location',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
