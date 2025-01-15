import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetails extends ChangeNotifier{
  String? id;
  String? name;
  String? email;
  String? role;
  String? token;


  void setUserDetails(final userData){
    id = userData['user']['_id'].toString();
    name = userData['user']['name'].toString();
    email = userData['user']['email'].toString();
    role = userData['user']['role'].toString();
    token = userData['token'].toString();

    setUserPerefernce();
  }

  void setUserDetailsByPreference() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
     
     id = prefs.getString("_id");
     name = prefs.getString("name");
     email = prefs.getString("email");
     role = prefs.getString("role");
     token = prefs.getString("token");

  }

  Future setUserPerefernce() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("userId", id.toString());
    await prefs.setString("name", name.toString());
    await prefs.setString("email", email.toString());
    await prefs.setString("role", role.toString());
    await prefs.setString("token", token.toString());
  }


  Future clearUserPreference()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("UserId", "");
    await prefs.setString("name", "");
    await prefs.setString("email", "");
    await prefs.setString("role", "");
    await prefs.setString("token", "");
  }



}