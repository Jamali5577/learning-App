import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/classes/screen_size.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../classes/colors.dart';
import '../../classes/font_sizes.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  double value = 1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "LMS",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: header1,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/profile.png"),
                      radius: 25,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
                child: Container(
                  height: screenHeight * .88,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(paragraph),
                    boxShadow: [
                      BoxShadow(
                        color: greyGreenColor,
                        blurRadius: 6,
                        spreadRadius: 3,
                        offset: const Offset(2, 0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      
                      children: [
                        rowHeader(),
                        SizedBox(
                          height: screenHeight * 0.024,
                        ),
                        Progress(value: value),
                        SizedBox(
                          height: screenHeight * 0.025,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Question 1 of 10",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.w700)),
                            ),
                            SizedBox(
                              height: screenHeight * 0.005,
                            ),
                            Text(
                              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w500)),
                            ),
                            SizedBox(
                              height: screenHeight * 0.025,
                            ),
                           Center(
                             child: Column(
                              children: [
                                 OptionContainer(
                                answer: "COBOL",
                                option: "A.",
                              ),
                              SizedBox(
                                height: screenHeight * 0.015,
                              ),
                              OptionContainer(
                                answer: "COBOL",
                                option: "B.",
                              ),
                              SizedBox(
                                height: screenHeight * 0.015,
                              ),
                              OptionContainer(
                                answer: "COBOL",
                                option: "C.",
                              ),
                              SizedBox(
                                height: screenHeight * 0.015,
                              ),
                              OptionContainer(
                                answer: "COBOL",
                                option: "D.",
                              ),
                              ],
                             ),
                           ),
                            SizedBox(height: screenHeight * 0.024),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomButton(
                                    outline: true,
                                    title: "Prev",
                                    height: screenHeight * 0.055,
                                    width: screenWidth * 0.35,
                                  ),
                                  CustomButton(
                                    outline: false,
                                    title: "Next",
                                    height: screenHeight * 0.055,
                                    width: screenWidth * 0.35,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.023,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowHeader() {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.watch_later_outlined,
                  size: 30,
                ),
                Column(
                  children: [
                    const Text(
                      "Time Remaining",
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                        "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}")
                  ],
                ),
              ],
            ),
            CustomButton(
              outline: false,
              height: screenHeight * 0.05,
              width: screenWidth * 0.25,
              title: "Submit",
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  String title;
  double height;
  double width;
  bool outline=false;

  CustomButton({
   required this.outline,
    required this.title,
    required this.height,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      // height: screenHeight * 0.05,
      // width: screenWidth * 0.25,
      decoration: outline?
      BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: Colors.blue,

        ),
        borderRadius: BorderRadius.circular(10),

      )
      
       :BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF21BFFD), // Starting color (#21BFFD)
            Color(0xFF217BFE), // Ending color (#217BFE)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        //color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: greyGreenColor,
            blurRadius: 6,
            spreadRadius: 3,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color:outline?Colors.black :Colors.white,
                fontSize: header6,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class OptionContainer extends StatelessWidget {
  String option;
  String answer;
  OptionContainer({
    required this.option,
    required this.answer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.06,
      width: screenWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.blue,
            width: 1.2,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // SizedBox(
            //   width: screenWidth * .25,
            // ),
            Text(answer,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )),
               const Text(""),
                
                
          ],
        ),
      ),
    );
  }
}

class Progress extends StatelessWidget {
  const Progress({
    super.key,
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return SimpleCircularProgressBar(
      valueNotifier: ValueNotifier(3),
      mergeMode: true,
      size: 120,
      maxValue: 10,
      
      backColor: Colors.grey,
      progressColors: const [Colors.yellow, Colors.orange, Colors.blue],
      onGetText: (double value) {
        return Text(
          '${value.toInt()}',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        );
      },
    );
  }
}
