import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class Utility {
  static Widget uiSizeBox({double? width, double? height}) {
    return SizedBox(
      width: width,
      height: height,
    );
  }




  static TextStyle textStyleLogo = TextStyle(
      color: Colors.black.withOpacity(0.8),
      fontWeight: FontWeight.w400,
      fontSize: 40);
  static Positioned shadow(Size size, Color color, double redi) {
    return Positioned(
      bottom: -100,
      right: -100,
      top: -100,
      child: Container(
        width: size.width * redi,
        height: size.height * redi,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }

  static TextStyle buttonStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20);
  static TextStyle helloStyle =
      TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 25);
  static TextStyle userLable =
      TextStyle(fontWeight: FontWeight.w900, color: Colors.black, fontSize: 30);
  static TextStyle drwrbutnStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Colors.black.withOpacity(0.7));

  static TextStyle appbarStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20.0);
  static void printLog(String Tag, String string) {
  }

  static void showToast(String string) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: string,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.blue.shade100,
      fontSize: 16,
      textColor: Colors.black,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static TextStyle subtitleBlackStyle16 = GoogleFonts.poppins(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
  );

  static TextStyle subtitleBlackStyle18 = GoogleFonts.poppins(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 18.0,
  );

  static TextStyle subtitleWhiteStyle16 = GoogleFonts.poppins(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
  );

  static TextStyle subtitleWhiteStyle18 = GoogleFonts.poppins(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 18.0,
  );

  static String dateTimeFormatToString(DateTime dateValue){
    String formatDateTime = DateFormat('dd-MM-yyyy').format(dateValue);
    return formatDateTime;
  }

  static String stringDateTimetoString(String dateValue){
    DateTime inputDateTime = DateFormat('dd-MM-yyyy').parse(dateValue);
    String formatDateTime = DateFormat('yyyy-MM-dd').format(inputDateTime);
    return formatDateTime;
  }

  static String dateTimeToTimeFormat(String dateValue){
    DateTime inputDateTime = DateFormat('dd-MM-yyyy HH:mm:ss').parse(dateValue);
    String commentTime = DateFormat.jm().format(inputDateTime);
    return commentTime;
  }


}
