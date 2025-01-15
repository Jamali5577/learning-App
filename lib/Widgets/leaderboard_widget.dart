import 'package:flutter/material.dart';
import 'package:lms_app/Widgets/custom_text_widget.dart';

import '../classes/screen_size.dart';


class StackItem extends StatelessWidget {

  final String userImage;
  final String userPosition;
  final Color positionBgColor;


  const StackItem({
    super.key,
    required this.userImage,
    required this.userPosition,
    required this.positionBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.26,
      height: screenHeight * 0.10,
      child: Stack(
        children: [
          CircleAvatar(
            radius: screenWidth * 0.26,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: screenWidth * 0.24,
              backgroundColor: Colors.white,
              backgroundImage:  AssetImage(userImage),
            ),
          ),
          Align(
            alignment: const Alignment(0.9, -0.9),
            child: Container(
              width: screenWidth * 0.065,
              height: screenHeight * 0.035,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: positionBgColor,
              ),
              child:  Center(
                  child:  TextWidget(title: userPosition,textColor: Colors.white,)),
            ),
          ),
        ],
      ),
    );
  }
}