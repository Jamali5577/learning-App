import 'package:flutter/material.dart';
import 'package:lms_app/Widgets/custom_button.dart';
import 'package:lms_app/Widgets/text1.dart';
import 'package:lms_app/classes/colors.dart';
import 'package:lms_app/classes/font_sizes.dart';
import '../../Widgets/app_bar_widget.dart';
import '../../Widgets/custom_text_widget.dart';
import '../../classes/screen_size.dart';
import '../Quiz Screen/question_screen.dart';


class TestDetailScreen extends StatefulWidget {
  const TestDetailScreen({super.key});

  @override
  State<TestDetailScreen> createState() => _TestDetailScreenState();
}

class _TestDetailScreenState extends State<TestDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Test Detail",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.06,vertical: screenHeight * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text1(fontColor: blackColor, fontSize: screenWidth * 0.070, text: "Maths Test"),
              SizedBox(height: screenHeight * 0.02,),
             Text1(fontColor: blackColor, fontSize: paragraph, text: "If a car travels 60 miles in 1.5 hours, what is its average speed in miles per hour? Round your answer to the nearest whole number."),
              SizedBox(height: screenWidth * 0.07,),
              Padding(
                padding:  const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text1(fontColor: blackColor, fontSize: paragraph, text: "02:00PM"),
                      SizedBox(width: screenWidth * 0.02,),
                      Text1(fontColor: blackColor, fontSize: paragraph, text: "End : 04:00PM"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.02,),
                  Text1(fontColor: blackColor, fontSize: paragraph, text: "Test by: Sir Mehboob Shar"),
                  Text1(fontColor: blackColor, fontSize: paragraph, text: "Course ID : 405"),
                  SizedBox(height: screenHeight * 0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: CustomButton1(
                          title: 'Total Marks : 40',
                          secondaryColor1: secondaryColor,
                          primaryColor1: primaryColor,
                          onTab: (){},
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02,),
                      Expanded(
                        child: CustomButton1(
                          title: 'Passing : 30',
                          secondaryColor1: redColor2,
                          primaryColor1: redColor1,
                          onTab: (){},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.050,),
                  const TextWidget(
                    title: "Total Question : 20",
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: screenHeight * 0.20,),
                  Align(
                    alignment: Alignment.center,
                    child: CustomButton1(
                        title: "Start Test",
                        secondaryColor1: secondaryColor,
                        primaryColor1: primaryColor,
                        onTab: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const QuestionScreen()));

                        }
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}