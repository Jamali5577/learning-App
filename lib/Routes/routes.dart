import 'package:flutter/material.dart';
import 'package:lms_app/Screens/Auth/login_screen.dart';
import 'package:lms_app/Screens/StudentsScreen/student_dashboard.dart';

class AppRoutes{
  static const String loginPage ='/login';
  static const String studentDasboard ='/dashboard';


  static Map<String, WidgetBuilder> getRoutes(){
    return {
      loginPage:(context) =>   LoginPage(),
      studentDasboard:(context) => StudentDashboard(),

    };
  } 
}