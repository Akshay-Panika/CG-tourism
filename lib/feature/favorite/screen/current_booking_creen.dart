import 'package:cg_tourism/core/costant/custom_color.dart';
import 'package:cg_tourism/core/costant/custom_image.dart';
import 'package:cg_tourism/core/costant/dimension.dart';
import 'package:cg_tourism/core/costant/text_style.dart';
import 'package:cg_tourism/core/widget/custom_appbar.dart';
import 'package:cg_tourism/core/widget/custom_container.dart';
import 'package:flutter/material.dart';

class CurrentBookingScreen extends StatefulWidget {
  const CurrentBookingScreen({super.key});

  @override
  State<CurrentBookingScreen> createState() => _CurrentBookingScreenState();
}

class _CurrentBookingScreenState extends State<CurrentBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Current Booking', showBackButton: true),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(CustomImage.locationImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          // Draggable Bottom Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.2, // start height
            minChildSize: 0.2,     // min drag down
            maxChildSize: 0.4,     // max drag up
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 5),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 4,
                          width: 40,
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      Text('Booking Details',
                          style: textStyle16(context)),
                      const SizedBox(height: 10),
                      Text('• Place Name'),
                      Text('• Time: 8:30 PM'),
                      Text('• Location'),
                      const SizedBox(height: 20),
                      Text('Distance', style: textStyle16(context)),
                      const SizedBox(height: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('00.0 km'),
                          Text('00.0 km'),
                        ],
                      ),
                      LinearProgressIndicator(
                        value: 0.5,
                        color: CustomColor.greenColor,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
