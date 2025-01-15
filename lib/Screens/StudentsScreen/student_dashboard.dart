import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms_app/Screens/StudentsScreen/profile.dart';
import 'package:lms_app/Screens/StudentsScreen/student_home.dart';

import '../Leaderboard/leaderboard_screen.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  @override
 late PageController pageController;
  int current_screen = 0;

  List<Widget> screens = [
    const StudentHomeScreen(),
    const LeaderboardScreen(),
    const AccountScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController(
      initialPage: current_screen,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: current_screen,
        indicatorColor: Colors.transparent,
        height: kBottomNavigationBarHeight,
        onDestinationSelected: (value){
          setState(() {
            current_screen = value;
          });
          pageController.jumpToPage(current_screen);
        },
        destinations: const  [
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.home,color: Colors.blue,),
            icon: Icon(CupertinoIcons.home),
            label: "Home",

          ),
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.group,color: Colors.blue,),
            icon: Icon(CupertinoIcons.group),
            label: "Leaderboard",
          ),
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.profile_circled,color: Colors.blue,),
            icon: Icon(CupertinoIcons.profile_circled),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}