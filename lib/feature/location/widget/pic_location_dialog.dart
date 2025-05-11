import 'package:cg_tourism/core/costant/dimension.dart';
import 'package:cg_tourism/core/costant/text_style.dart';
import 'package:cg_tourism/core/widget/custom_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> picLocationDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      child: CustomContainer(
        height: 200,
        width: 200,
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
              'Location', style: textStyle18(context),
            ),
            10.height,
            Text('This is your current location dialog.', style: textStyle12(context),)
          ],
        ),
      ),
    ),
  );
}
