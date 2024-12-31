import 'package:flutter/material.dart';
import 'package:lms_app/Screens/Auth/signup.dart';


import '../../Widgets/custom_rounded_btn.dart';

import '../../Widgets/textfield_with_icon.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            //key: _SignInformKey,
            child: Column(
              children: [
                // Logo container
                pageHeaderContaienr(),
                const SizedBox(height: 30),
          
                //Text field container
                textFieldContainer(),
          
                //round button
               customRoundedButton(title: "Login", loading: false, on_Tap: (){}),
          
                SizedBox(
                  height: 24,
                ),
          
                //Registration
                regDecptContainer()
              ],
            ),
          ),
        ),
      );
  }

  Widget pageHeaderContaienr() {
    return Material(
      elevation: 6,
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        decoration : const BoxDecoration(
            borderRadius:  BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
           gradient: LinearGradient(
            colors: [
              Color(0xFF21BFFD), // Starting color (#21BFFD)
              Color(0xFF217BFE), // Ending color (#217BFE)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),),
        child: Center(
          child: Container(
              width: 150,
              height: 150,
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40)),
              child: const Image(
                  image: AssetImage("assets/logo.png"))),
        ),
      ),
    );
  }

  Widget textFieldContainer() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
        textFieldWithIconWidget(fieldName: "Email",isPasswordField: false,widgetcontroller: email,widgeticon: Icons.email,),
        const SizedBox(height: 25,),
         textFieldWithIconWidget(widgetcontroller: password, fieldName: "password", isPasswordField: true, widgeticon: Icons.key,)
         
    
        
        ],
      ),
    );
  }

  Widget regDecptContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Want to register your Academy? ",
          style: TextStyle(
              fontSize: 16, color: Colors.grey.shade400),
        ),
        GestureDetector(
          onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
          },
          child: Text(
            "Register",
            style: TextStyle(
                color: Colors.red.shade800, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}