import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lms_app/Screens/Quiz%20Screen/question_screen.dart';
import 'package:lms_app/Screens/TestScreens/test_details.dart';
import 'package:lms_app/Widgets/text1.dart';
import 'package:lms_app/classes/colors.dart';
import 'package:lms_app/classes/font_sizes.dart';
import 'package:lms_app/classes/screen_size.dart';

import '../../Widgets/app_bar_widget.dart';

class ViewTestListScreen extends StatefulWidget {
  const ViewTestListScreen({super.key});

  @override
  State<ViewTestListScreen> createState() => _ViewTestListScreenState();
}

class _ViewTestListScreenState extends State<ViewTestListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "View Test",
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> const TestDetailScreen()));
                      },
                      child: Container(
                        
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow:  [
                      BoxShadow(
                        color: Colors.blue.shade100,
                        blurRadius: 8,
                        offset: const Offset(2, 2),
                        spreadRadius: 1,
                      ),
                                        ],
                                        border: Border.all(
                      color: Colors.blue.shade300,
                      width: screenWidth * 0.001
                                        ),
                                        color: Colors.white,
                                        //borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ReuseRow(
                                text1: "Test Subject: ",
                                text2: "Maths",
                              ),
                              ReuseRow(text1: "Teacher: ", text2: "Mehboob Shar"),
                              ReuseRow(text1: "Start Time: ", text2: "2:00 PM"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReuseRow extends StatelessWidget {
  String text1;
  String text2;
  ReuseRow({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text1(fontColor: blackColor, fontSize: header5, text: text1),
        Text1(fontColor: blackColor, fontSize: header5, text: text2),
      ],
    );
  }
}
