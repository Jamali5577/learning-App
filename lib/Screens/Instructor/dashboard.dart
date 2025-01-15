import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms_app/Screens/Instructor/instructor_home.dart';
import 'package:lms_app/Screens/StudentsScreen/profile.dart';
import '../Leaderboard/leaderboard_screen.dart';

class InstructorDashboard extends StatefulWidget {
  const InstructorDashboard({super.key});

  @override
  State<InstructorDashboard> createState() => _InstructorDashboardState();
}

class _InstructorDashboardState extends State<InstructorDashboard> {
  @override
 late PageController pageController;
  int current_screen = 0;

  List<Widget> screens = [
    const InstructorHomeScreen(),
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