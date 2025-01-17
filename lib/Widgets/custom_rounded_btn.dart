

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/classes/colors.dart';
import 'package:lms_app/classes/font_sizes.dart';

class customRoundedButton extends StatelessWidget {
  customRoundedButton(
      {super.key,
      required this.title,
      required this.loading,
      required this.on_Tap});
  bool loading = false;
  String title;
  VoidCallback on_Tap;

  @override
  Widget build(BuildContext context) {
    // bool isLoading = false;
    // final animalProvider = Provider.of<AnimalRegistratinProvider>(context);
    // final authProvider = Provider.of<AuthProvider>(context);
    // isLoading = authProvider.isLoading;
    // isLoading = animalProvider.isLoading;

    return InkWell(
      onTap: on_Tap,
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 17,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
            colors: [
              Color(0xFF21BFFD), // Starting color (#21BFFD)
              Color(0xFF217BFE), // Ending color (#217BFE)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: loading
                ? Center(
                    child: CircularProgressIndicator(
                      color: whiteColor,
                    ),
                  )
                : Text(
                    title,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: header4,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
      ),
    );
  }
}
