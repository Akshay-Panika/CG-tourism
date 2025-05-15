
import 'package:cg_tourism/core/costant/dimension.dart';
import 'package:cg_tourism/core/costant/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/costant/custom_color.dart';
import '../../../core/widget/custom_container.dart';
import '../../favorite/screen/current_booking_creen.dart';
import '../../favorite/screen/favorite_screen.dart';


class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: EdgeInsets.all(0),
      backgroundColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              CircleAvatar(radius: 25,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/image/Null_Profile.jpg'),
               ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Akshay !', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  Text('Good Morning', style: textStyle12(context, color: CustomColor.descriptionColor),),
                  Text('Welcome to Waidhan', style: textStyle12(context, color: CustomColor.descriptionColor),),
                ],
              ),
            ],
          ),

          Row(
            children: [
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentBookingScreen(),)),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: CustomColor.greenColor, width: 0.5),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    spacing: 5,
                    children: [
                      Icon(Icons.directions_car, size: 16,color: CustomColor.greenColor,),
                      Text('My Booking', style: textStyle12(context),)
                    ],
                  ),
                ),
              ),
             10.width,

              // IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold())), icon: Icon(Icons.favorite_border,))
            ],
          )

        ],
      ),
    );
  }
}
