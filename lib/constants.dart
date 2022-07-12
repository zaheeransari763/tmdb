import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

const String onBoardingOneString =
    "Millions of movies, TV shows and many more to discover and what's the Fab point, all is controlled at your FingerTips. Explore now";
const String onBoardingTwoString =
    "Trusted platform. Every single day with serve you with latest contents and our service is used by millions of people while we process over 3 billion requests.";
const String onBoardingThreeString =
    "Along with extensive metadata for movies, TV shows and people, we also offer one of the best selections of high resolution posters and fanart. On average, over 1,000 images are added every single day.";

const LinearGradient buttoncolor =
LinearGradient(colors: [Color(0xFF1E3C72), Color(0xFF365AA5)]);


class Constants {
  static Widget textField(String hint, Icon prefixIconW,
      {bool isPassword = false,
        bool isNumber = false,
        int? length,
        TextEditingController? textController,
        int lines = 1,
        InkWell? suffixIconW,
        String? pwdText,
        TextInputType? type}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 2, color: Colors.black)),
        child: TextField(
            controller: textController,
            obscureText: isPassword,
            keyboardType: type,
            inputFormatters: [
              LengthLimitingTextInputFormatter(length),
            ],
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 14),
                border: InputBorder.none,
                hintText: hint,
                prefixIcon: prefixIconW,
                suffixIcon: suffixIconW)),
      ),
    );
  }

  static Widget SearchtextField(String hint, Icon prefixIconW,
      {bool isPassword = false,
        bool isNumber = false,
        int? length,
        TextEditingController? textController,
        int lines = 1,
        InkWell? suffixIconW,
        String? pwdText,
        TextInputType? type}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 2, color: Colors.white)),
        child: TextField(
            controller: textController,
            obscureText: isPassword,
            keyboardType: type,
            inputFormatters: [
              LengthLimitingTextInputFormatter(length),
            ],
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 14),
                border: InputBorder.none,
                hintText: hint,
                prefixIcon: prefixIconW,
                suffixIcon: suffixIconW)),
      ),
    );
  }

  static Widget btnContainer(String text, double width,
      {double? height, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        width: width,
        height: height,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ], gradient: buttoncolor, borderRadius: BorderRadius.circular(4)),

        /*decoration: BoxDecoration(
            gradient: buttoncolor,
            borderRadius: BorderRadius.circular(4)),*/
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.rowdies(fontSize: 23, color: Colors.white),
          ),
        ),
      ),
    );
  }

  static SnackBar mySnackBar(String text) {
    return SnackBar(
      content: Text(text),
      elevation: 10,
      backgroundColor: Colors.blue,
      duration: const Duration(milliseconds: 2000),
    );
  }


  static GlobalKey<ScaffoldMessengerState> messengerKey =
GlobalKey<ScaffoldMessengerState>();
}

