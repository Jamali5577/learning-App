import 'package:flutter/material.dart';
import 'package:lms_app/Screens/Auth/Provider/user_details.dart';
import 'package:lms_app/Screens/StudentsScreen/student_list.dart';
import 'package:lms_app/Screens/TestScreens/view_test.dart';
import 'package:lms_app/Widgets/text1.dart';
import 'package:lms_app/classes/colors.dart';
import 'package:lms_app/classes/font_sizes.dart';
import 'package:lms_app/classes/screen_size.dart';
import 'package:provider/provider.dart';

class InstructorHomeScreen extends StatelessWidget {
  const InstructorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.025, vertical: screenHeight * 0.02),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/profile.png"),
              ),
             const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text1(
                      fontColor: blackColor, fontSize: header5, text: "Hello"),
                  Consumer<UserDetails>(
                    builder: (context, value, child) => 
                     Text1(
                        fontColor: blackColor,
                        fontSize: header6,
                        text: "${value.name}"),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
             height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CutomContainer(title: "Course",color1: const Color(0xFF21BFFD), color2: const Color(0xFF217BFE),imgurl: "assets/book.png", ontap: () {
                
              },),
             CutomContainer(title: "Tests", color1: Colors.red, color2: Colors.pink,imgurl: "assets/exam.png",ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const ViewTestListScreen()));
               
             },)
            ],
          ),
          SizedBox(height: screenHeight*0.025,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CutomContainer(title: "Students",color1:  Colors.pinkAccent, color2: Colors.purple,imgurl: "assets/student.png", ontap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentViewScreen()));
                
              },),
             CutomContainer(title: "Submissions", color1: Colors.lightGreen, color2: Colors.green,imgurl: "assets/submit.png",ontap: () {
             // Navigator.push(context, MaterialPageRoute(builder: (context)=> const ViewTestListScreen()));
               
             },)
            ],
          ),
        ],
      ),
    ));
  }
}

class CutomContainer extends StatelessWidget {
  String title;
  Color color1;
  Color color2;
  String imgurl;
  VoidCallback ontap;
   CutomContainer({

    super.key,
    required this.title,
    required this.color1,
    required this.color2,
    required this.imgurl,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    final containerHeight =screenHeight * 0.15;
    final containerWidth = screenWidth* 0.44;
    return GestureDetector(
      onTap: ontap,
      child: Container(
        
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(15),
      
      
            gradient:  LinearGradient(colors: [
          color1,
          color2,
        ],
         begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
        )),
        
        height: containerHeight,
        width: containerWidth,
      
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
           Image(image:  AssetImage(imgurl),width: containerWidth*0.6, height: containerHeight*0.6, 
           fit: BoxFit.fitWidth,),
            
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 5),
              child: Text1(fontColor: whiteColor, fontSize: header1, text: title),
            )          ],
        ),
      ),
    );
  }
}
