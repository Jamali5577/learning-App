import 'package:flutter/material.dart';

import '../../Widgets/custom_text_widget.dart';
import '../../Widgets/leaderboard_widget.dart';
import '../../classes/colors.dart';
import '../../classes/image_strings.dart';
import '../../classes/screen_size.dart';


class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.3,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            primaryColor,
                            secondaryColor
                          ],
                      ),
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(top: screenHeight * 0.04,right: screenWidth * 0.030),
                    child: const StackItem(
                      userImage: AppImages.userImage,
                      positionBgColor: Colors.yellow,
                      userPosition: "1",
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: screenWidth * 0.48,top: screenHeight * 0.16),
                    child: const StackItem(
                      userImage: AppImages.userImage,
                      positionBgColor: Colors.green,
                      userPosition: "2",
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: screenWidth * 0.45,top: screenHeight * 0.16) ,
                    child: const StackItem(
                      userImage: AppImages.userImage,
                      positionBgColor: Colors.red,
                      userPosition: "3",
                    ),
                  ),

                ],
              ),
            ),
              TabBar(
               indicatorColor: primaryColor,
                labelColor: primaryColor,

                tabs: const [
                  Tab(
                    text: "Running",

                  ),
                  Tab(
                    text: "All over",
                  )
                ],
            ),
            Expanded(
              child: TabBarView(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        
                      ),
                      child: ListView(
                        children: [
                          ListTile(
                            title: const TextWidget(title: "Student 1"),
                            subtitle: const TextWidget(title: "Score : 40"),
                            leading: CircleAvatar(
                              radius: screenWidth * 0.08,
                            backgroundImage: const AssetImage(AppImages.userImage),
                            ),
                          ),

                          ListTile(
                            title: const TextWidget(title: "Student"),
                            subtitle: const TextWidget(title: "Score : 35"),
                            leading: CircleAvatar(
                              radius: screenWidth * 0.08,
                              backgroundImage: const AssetImage("assets/profile.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                       
                      ),
                      child: const  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(title: "Over All"),
                          SizedBox(height: 20),
                          Text("This is the over all tab content."),
                        ],
                      ),
                    ),
                  ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}