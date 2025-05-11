import 'package:cg_tourism/core/costant/custom_color.dart';
import 'package:cg_tourism/core/costant/text_style.dart';
import 'package:cg_tourism/core/widget/custom_appbar.dart';
import 'package:cg_tourism/core/widget/custom_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Booking',
        showFavoriteIcon: true,
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
              return CustomContainer(
                backgroundColor: CustomColor.whiteColor,
                padding: EdgeInsets.zero,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  leading: CircleAvatar(backgroundColor: CustomColor.canvasColor,child: Icon(Icons.place, color: CustomColor.greenColor,),),
                  title: Text('Place Name', style: textStyle14(context),),
                  subtitle: Text('Place Name', style: textStyle12(context, color: CustomColor.descriptionColor),),
                ),
              );
            },),
          )
        ],
      ),
    );
  }
}
