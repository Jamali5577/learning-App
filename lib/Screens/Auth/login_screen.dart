import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lms_app/Screens/Auth/Provider/auth_provider.dart';
import 'package:lms_app/Screens/Auth/Provider/user_details.dart';
import 'package:lms_app/Screens/Auth/signup.dart';
import 'package:lms_app/Screens/Instructor/dashboard.dart';
import 'package:lms_app/Screens/StudentsScreen/student_dashboard.dart';
import 'package:lms_app/Widgets/custom_rounded_btn.dart';
import 'package:lms_app/classes/screen_size.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/textfield_with_icon.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _farm = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  @override

  checkUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final chk = prefs.getString('userId');
    final role = prefs.getString('role');

    print("User Id = $chk");
    //checking if the user detail is available then
    if (chk != '' && chk != null) {
      //get user data from the preference and store it in userdetail class
      Provider.of<UserDetails>(context, listen: false)
          .setUserDetailsByPreference();
      if (role == 'admin') {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const InstructorDashboard()));

        
      } else {
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const StudentDashboard()));
       
      }

      //after initializing the user detail class move the user to homepage
    } else {
      if (kDebugMode) {
        print("User not found!");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    checkUserData();
  }

  


  
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
                    
                        
                       Consumer<AuthProvider>(
                        builder: (context, auth, child) => 
                          customRoundedButton(title: "Login", loading: auth.isLoading, on_Tap: () async{
                            if(_farm.currentState!.validate()){
                             await Provider.of<AuthProvider>(context, listen: false).loginUser(context,email.text, password.text);
                                            
                                           }
                           
                         },),
                       ),
                         SizedBox(height: screenHeight*0.022),
                    
                       
                        TextButton(
                          onPressed: () async{
                          final name=  await Provider.of<UserDetails>(context, listen: false).name;
                          print("name of user ${name}");

                           
                           // Navigator.push(context, MaterialPageRoute(builder: (_)=> const SignUp()));

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
    return Form(
      key: _farm,
      child: Column(
        children: [
        textFieldWithIconWidget(fieldName: "Email",isPasswordField: false,widgetcontroller: email,widgeticon: Icons.email,validatorCallback: ValidationBuilder().email().maxLength(50).build(),),
          SizedBox(height: screenHeight*0.035,),
         textFieldWithIconWidget(widgetcontroller: password, fieldName: "password", isPasswordField: true, widgeticon: Icons.key, validatorCallback:  ValidationBuilder().minLength(6).maxLength(20).build(),)
         
          
        
        ],
      ),
    );
  }
}
