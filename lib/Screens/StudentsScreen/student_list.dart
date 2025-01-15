import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/app_bar_widget.dart';
import '../../Widgets/student_list_widget.dart';
import '../../classes/image_strings.dart';
import '../../classes/screen_size.dart';


class StudentViewScreen extends StatefulWidget {
  const StudentViewScreen({super.key});

  @override
  State<StudentViewScreen> createState() => _StudentViewScreenState();
}

class _StudentViewScreenState extends State<StudentViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Student List",
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (index,context){
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05,vertical: screenHeight * 0.01),
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.12,
                decoration: BoxDecoration(
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.blue.shade100,
                      blurRadius: 8,
                      offset: const Offset(2, 4),
                      spreadRadius: 0,
                    ),
                  ],
                  border: Border.all(
                    color: Colors.blue.shade300,
                    width: screenWidth * 0.001
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: screenWidth * 0.20,
                        height: screenHeight * 0.10,
                        decoration: const BoxDecoration(
                          // shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                            child: Image.asset(AppImages.userImage)),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.001,),
                    const StudentViewList(),
                    IconButton(
                        onPressed: (){
                          showDialog(
                              context: index,
                              builder: (context){
                                return AlertDialog(
                                  content:  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        onTap : (){},
                                        leading: const Icon(Icons.edit,color: Colors.blue,),
                                        title: const  Text("Edit"),
                                      ),
                                      ListTile(
                                        onTap : (){},
                                        leading: const Icon(Icons.delete_outline,color: Colors.red,),
                                        title:  Text("Delete",),
                                      ),
                                      TextButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        child: Text("Close",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold, fontSize: screenWidth * 0.040),),),
                                    ],
                                  ),
                                );
                              }
                          );
                        },
                        icon: const Icon(Icons.more_vert_rounded,)
                    ),
                  ],
                ),
              ),
            );
          },
      ),
    );
  }
}