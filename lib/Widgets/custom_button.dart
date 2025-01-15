import 'package:flutter/material.dart';
import 'package:lms_app/Widgets/text1.dart';
import 'package:lms_app/classes/colors.dart';
import 'package:lms_app/classes/font_sizes.dart';
import '../classes/screen_size.dart';

class CustomButton1 extends StatelessWidget {

  final String title;
  final Color secondaryColor1,primaryColor1;
  final VoidCallback onTab;


  const CustomButton1({
    super.key,
    required this.title,
    required this.secondaryColor1,
    required this.primaryColor1,
    required this.onTab});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: screenWidth * 0.40,
        height: screenHeight * 0.060,
        decoration:   BoxDecoration(
          gradient: LinearGradient(
              colors: [
                secondaryColor1,
                primaryColor1,
              ],
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        child: Center(
            child: Text1(fontColor: whiteColor, fontSize: header4,text: title,)
        ),
      ),
    );
  }
}