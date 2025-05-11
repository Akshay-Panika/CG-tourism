import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../costant/custom_color.dart';

class CustomButton extends StatelessWidget {
 final String? text;
 final VoidCallback? onTap;
  const CustomButton({super.key, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: CustomColor.appColor,
        ),
        child: Center(child: Text(text!, style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),),),
      ),
    );
  }
}
