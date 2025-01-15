import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/Widgets/text1.dart';
import 'package:lms_app/classes/colors.dart';
import 'package:lms_app/classes/font_sizes.dart';
import 'package:lms_app/classes/image_strings.dart';
import 'package:lms_app/classes/screen_size.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Material(
            elevation: 5.0,
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            child: Container(
              
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                
              ),
              child: Column(
                children: [
                  Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
              ),
              child:  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const CircleAvatar(
            
                      radius: 60,
                      backgroundImage: AssetImage(AppImages.userImage),
                    ),
                   Text("Rashid", style: GoogleFonts.abyssinicaSil(textStyle: TextStyle(fontSize: screenWidth*0.09, color: Colors.black87, fontWeight: FontWeight.bold)),),
                    Text1(fontColor: darkGreenColor, fontSize: header1, text: "Department")
                
                  ],),
              ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HeaderColumnWidget(digits: "200", title: "Score"),
                       HeaderColumnWidget(digits: "150", title: "Obtain Score"),
                        HeaderColumnWidget(digits: "20",title: "Tests",)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
         const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:  pageHeaderContainer()
          ),

        ],
      )
    );
  }
}

class HeaderColumnWidget extends StatelessWidget {
  String digits;
  String title;
   HeaderColumnWidget({
    required this.digits,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text1(fontColor: whiteColor, fontSize: header1, text: digits, weight: FontWeight.bold,),
        Text1(fontColor: whiteColor, fontSize: header5, text: title)
      ],
    );
  }
}



Widget pageHeaderContainer() {
  return Material(
      elevation: 6.0,
      borderRadius:  BorderRadius.circular(20),
      child: Container(
         // height: screenHeight / 3,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: greyGreenColor,
                    blurRadius: 6,
                    offset: const Offset(3, 3))
              ]),
          child: Padding(
            padding: EdgeInsets.only(
                top: screenHeight * .02,
                left: screenWidth * .02,
                right: screenWidth * .02,
                bottom: screenHeight*.02),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * .02,
                ),

                Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    
                   IconWigetWithText(icon: Icons.notifications_none,text:"Notification",),
                    IconWigetWithText(icon: Icons.help_center, text: "Help",),
                    IconWigetWithText(icon: Icons.settings , text: "Settings",),

                 
                ],),
                SizedBox(
                  height: screenHeight * .02,
                ),
               const Divider(),
                SizedBox(
                  height: screenHeight * .02,
                ),
                 Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    
                    IconWigetWithText(icon: Icons.assessment,text:"assessment",),
                    IconWigetWithText(icon: Icons.logout, text: "logout",),
                    IconWigetWithText(icon: Icons.message, text: "messages",),
                
                 
                ],),


               ],
            ),
          )));
}

class IconWigetWithText extends StatelessWidget {
  String text;
  IconData icon;
   IconWigetWithText({
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    
        Icon(icon, size: 30,),
        const SizedBox(height: 10,),
        Text(text)
      ],
    );
  }
}


