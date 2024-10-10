import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryGreen = Color(0xFF1DBF73); // Main Fiverr Green
  static const Color darkGreen = Color(0xFF0D614C);    // Darker Green
  static const Color lightGreen = Color(0xFFC1F0DC);   // Light Green

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);        // White
  static const Color lightGray = Color(0xFFF7F7F7);    // Light Gray
  static const Color midGray = Color(0xFF7A7A7A);      // Mid Gray
  static const Color darkGray = Color(0xFF404145);     // Dark Gray
  static const Color black = Color(0xFF222325);        // Black
}



class AppTextStyles {
  static final TextStyle headingStyle = GoogleFonts.poppins(
    fontSize: 20,
    color:Colors.black,
    fontWeight: FontWeight.w500
  );
 static final TextStyle headingStyleBold = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color:Colors.black,
  );


  static final TextStyle subheadingStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
  );
static final TextStyle subheadingStyleLight = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.black54,
  );

  static final TextStyle bodyTextStyle = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black, // Default text color
  );

}
