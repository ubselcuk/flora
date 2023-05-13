import 'package:flora/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    required this.keyboardType,
    required this.onChanged,
    Key? key,
    this.onTap,
    this.onTapOutside,
  }) : super(key: key);

  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final Function()? onTap;
  final Function(PointerDownEvent)? onTapOutside;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: TextField(
        cursorColor: ctfCursorColor,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: GoogleFonts.poppins(
          color: ctfTextColor,
          fontWeight: FontWeight.w600,
          fontSize: 15.0,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16.0),
          filled: true,
          fillColor: ctfBackgroundColor,
          prefixIcon: Icon(
            icon,
            size: 24.0,
            color: ctfIconColor,
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            color: ctfTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 15.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: BorderSide(color: ctfBorderColor, width: 4),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: BorderSide(color: ctfBorderFocusedColor, width: 4),
          ),
        ),
        onChanged: onChanged,
        onTap: onTap,
        onTapOutside: onTapOutside,
      ),
    );
  }
}
