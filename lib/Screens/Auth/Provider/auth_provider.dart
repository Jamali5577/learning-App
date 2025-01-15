import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms_app/API/global_api.dart';
import 'package:http/http.dart' as http;
import 'package:lms_app/Screens/Auth/Provider/user_details.dart';
import 'package:lms_app/Screens/Instructor/dashboard.dart';
import 'package:lms_app/Screens/StudentsScreen/student_dashboard.dart';
import 'package:provider/provider.dart';
import 'package:simple_toast_message/simple_toast.dart';

class AuthProvider extends ChangeNotifier{
  bool _isLoading =false;
  get isLoading => _isLoading;




                        //// SignUp User Function////

    Future<void> sigupUser(BuildContext contxt,String name, String email, String password)async{
      _isLoading = true;
      notifyListeners();
      final url = Uri.parse("${GlobalApi.baseUrl}${GlobalApi.signUpUrl}");

      try{
        final body ={
          "name": name,
          "email": email,
          "role": "User",
          "password": password
        };

        final response = await http.post(url, body:body);
        final jsonResponse = jsonDecode(response.body);

        print(jsonResponse.toString());

        if(jsonResponse['success']==true){
          SimpleToast.showSuccessToast(contxt, "Success ", jsonResponse['message']);
          _isLoading =false;
          notifyListeners();
         
        }



      }catch(error){
        _isLoading = false;
        notifyListeners();
        SimpleToast.showErrorToast(contxt, "Error", error.toString());

       

      }

    }



                //// Login User Function////

  Future<void> loginUser(BuildContext contxt,String email, String password)async{
    _isLoading =true;
    notifyListeners();
    String url =  "${GlobalApi.baseUrl}${GlobalApi.loginUrl}";
   
    

    try{

      Map<String, dynamic> body ={
        "email":email.toString(),
        "password":password.toString(),

      };
     

      final response = await http.post(Uri.parse(url),  body: body);
      final userJson = jsonDecode(response.body);
      
      if(response.statusCode == 200){

         final userJson = jsonDecode(response.body);
         String role = userJson['user']['role'];
         print(role);

         Provider.of<UserDetails>(contxt, listen: false).setUserDetails(userJson);
         

         if(role =="admin"){
         // Navigator.pushNamed(contxt, '/dashboard');
        // Navigator.pushReplacement(contxt, MaterialPageRoute(builder: (_)=> const InstructorDashboard()));
         }
         else{
          Navigator.pushReplacement(contxt, MaterialPageRoute(builder: (_)=> const StudentDashboard()));
         }


         _isLoading =false;
    notifyListeners();
       SimpleToast.showSuccessToast(contxt, "Success", userJson['message']);
        
      }else{
        SimpleToast.showErrorToast(contxt, "Error", userJson['message']);
         _isLoading =false;
    notifyListeners();

      }

    } catch(error){
      SimpleToast.showErrorToast(contxt, "Error", error.toString());
       _isLoading =false;
    notifyListeners();
     

    }
  }
}