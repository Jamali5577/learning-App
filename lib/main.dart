import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/Routes/routes.dart';
import 'package:lms_app/Screens/Auth/Provider/auth_provider.dart';
import 'package:lms_app/Screens/Auth/Provider/user_details.dart';
import 'package:lms_app/Screens/Auth/login_screen.dart';
import 'package:lms_app/classes/screen_size.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => UserDetails())
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        
        
        title: 'Flutter Demo',
       theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme, 
          ),
       ),
        home: LoginPage(),
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
