import 'package:flutter/material.dart';
import 'package:lms_app/Widgets/custom_text_widget.dart';

import '../classes/screen_size.dart';


class StudentViewList extends StatelessWidget {
  const StudentViewList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
          title: "Abdul Waheed wighio",
          fontSize: screenWidth * 0.037,
          textColor: Colors.black,
          
        ),
        SizedBox(height: screenHeight * 0.003,),
        const TextWidget(
          title: "Bechlor OF IT",
          fontSize: 15,
          textColor: Colors.black,

        ),
      ],
    );
  }
}