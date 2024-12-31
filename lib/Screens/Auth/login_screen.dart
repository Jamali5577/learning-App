import 'package:flutter/material.dart';
import 'package:lms_app/Screens/Auth/signup.dart';
import 'package:lms_app/Widgets/custom_rounded_btn.dart';
import 'package:lms_app/classes/screen_size.dart';

import '../../Widgets/textfield_with_icon.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF21BFFD), // Starting color
              Color(0xFF217BFE), // Ending color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             
              Container(
                padding:  EdgeInsets.only(top: screenHeight*.055, left: screenWidth*.05, right: screenWidth*.05),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                     SizedBox(height: screenHeight*.025),
                     Center(
                      child: Text(
                        "LMS Learnig",
                        style: TextStyle(
                          fontSize: screenWidth*0.09,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight*.10,)
                  ],
                ),
              ),

             
              Material(
               // elevation: 6,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                child: Container(
                  height: screenHeight/1.3,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                     
                      children: [
                        
                         Text(
                          "Welcome Back",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth*0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                         SizedBox(height: screenHeight*0.025),
                        const Text(
                          "Enter your details below",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                         SizedBox(height: screenHeight*0.018),
                      
                        textFieldContainer(),
                        SizedBox(height: screenHeight*0.035,),
                    
                        
                       customRoundedButton(title: "Login", loading: false, on_Tap: () {
                         
                       },),
                         SizedBox(height: screenHeight*0.022),
                    
                       
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> const SignUp()));
                            // Handle Forgot Password
                          },
                          child: const Text(
                            "Forgot your password?",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        
                    
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
  Widget textFieldContainer() {
    return Column(
      children: [
      textFieldWithIconWidget(fieldName: "Email",isPasswordField: false,widgetcontroller: email,widgeticon: Icons.email,),
        SizedBox(height: screenHeight*0.035,),
       textFieldWithIconWidget(widgetcontroller: password, fieldName: "password", isPasswordField: true, widgeticon: Icons.key,)
       
        
      
      ],
    );
  }

  

  
}
