import 'package:flutter/material.dart';
import 'package:lms_app/classes/colors.dart';
import 'package:lms_app/classes/font_sizes.dart';

import 'text1.dart';

Widget customTextFormField(
  
  String text,
) {
  return Wrap(
    alignment: WrapAlignment.start,
    runAlignment: WrapAlignment.center,
    crossAxisAlignment: WrapCrossAlignment.start,
    children: [
      //Icon(customIcon, color: darkGreenColor),
      Text1(fontColor: blackColor, fontSize: paragraph, text: text),
    ],
  );
}