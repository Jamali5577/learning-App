import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lms_app/Screens/Auth/Provider/auth_provider.dart';
import 'package:lms_app/Widgets/custom_rounded_btn.dart';
import 'package:provider/provider.dart';


import '../../Widgets/textfield_with_icon.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _farm = GlobalKey<FormState>();
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
              Consumer<AuthProvider>(
                builder: (context, auth, child) => 
                 customRoundedButton(title: "Register", loading: auth.isLoading, on_Tap: ()async{
                   if(_farm.currentState!.validate()){
                    await Provider.of<AuthProvider>(context, listen: false).sigupUser(
                      context,
                      _nameController.text.toString(),
                      _emailController.text.toString(),
                      _passwordController.text.toString(),
                    );
                     
                    }
                 // Navigator.push(context, MaterialPageRoute(builder: (_)=> const QuestionScreen()));
                }),
              )
            ],),
          ),
        ),
      ),
    );

  }
  Widget formTextContainer() {
    return Form(
      key: _farm,
        child: Column(
      children: [
        textFieldWithIconWidget(
            widgetcontroller: _nameController,
            widgeticon: Icons.person_2,
            fieldName: "Student Name",
            validatorCallback: ValidationBuilder().minLength(2).maxLength(15).build(),
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
            validatorCallback: ValidationBuilder().email().build(),
            fieldName: "Email",
            isPasswordField: false),

        const SizedBox(
          height: 30,
        ),
        //
        textFieldWithIconWidget(
          widgeticon: Icons.lock,
            widgetcontroller: _passwordController,
            validatorCallback: ValidationBuilder().minLength(6).maxLength(20).build(),
            fieldName: "Password",
            isPasswordField: true),
        const SizedBox(
          height: 30,
        ),
        //
        textFieldWithIconWidget(
          widgeticon: Icons.lock,
            widgetcontroller: _confirmPassController,
            validatorCallback: (val) {
              if(_passwordController.text==val){
                ValidationBuilder().build();
              }
              return null;
              
            },
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