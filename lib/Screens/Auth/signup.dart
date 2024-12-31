import 'package:flutter/material.dart';
import 'package:lms_app/Widgets/custom_rounded_btn.dart';


import '../../Widgets/textfield_with_icon.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0), // Standard AppBar height
        child: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                   // Starting color (#21BFFD)
                  Color(0xFF217BFE), // Ending color (#217BFE)
                  Color(0xFF21BFFD),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          title: const Text("Registration", style: TextStyle(fontWeight: FontWeight.w700),),
          foregroundColor: Colors.white,
        ),
      ),
      body:  SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
             const SizedBox(
                height: 25,
              ),
              formTextContainer(),
             const SizedBox(height: 20,),
              customRoundedButton(title: "Register", loading: false, on_Tap: (){})
            ],),
          ),
        ),
      ),
    );

  }
  Widget formTextContainer() {
    return Form(
        child: Column(
      children: [
        textFieldWithIconWidget(
            widgetcontroller: _nameController,
            widgeticon: Icons.person_2,
            fieldName: "Student Name",
            isPasswordField: false),
        // TextFieldWidget(
        //     widgetcontroller: _companyNameController,
        //     fieldName: "Company name",
        //     widgeticon: CupertinoIcons.doc_plaintext,
        //     isPasswordField: false),
        const SizedBox(
          height: 30,
        ),
        //
        textFieldWithIconWidget(
          widgeticon: Icons.email,
            widgetcontroller: _emailController,
            fieldName: "Email",
            isPasswordField: false),

        const SizedBox(
          height: 30,
        ),
        //
        textFieldWithIconWidget(
          widgeticon: Icons.lock,
            widgetcontroller: _passwordController,
            fieldName: "Password",
            isPasswordField: true),
        const SizedBox(
          height: 30,
        ),
        //
        textFieldWithIconWidget(
          widgeticon: Icons.lock,
            widgetcontroller: _confirmPassController,
            fieldName: "Confirm Password",
            isPasswordField: true),
        const SizedBox(
          height: 30,
        ),
        //
        // TextFieldWidget(
        //     widgetcontroller: _companyAddressController,
        //     fieldName: "Address",
        //     widgeticon: CupertinoIcons.news_solid,
        //     isPasswordField: false),
      ],
    ));
  }
}