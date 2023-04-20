import 'package:flora/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.label,
    required this.onPressed,
    required this.btn,
    this.ico,
    Key? key,
  }) : super(key: key);

  final String? label;
  final bool btn;
  final IconData? ico;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 12.0),
        ),
        backgroundColor: MaterialStateProperty.all(loginAuthColor),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        )),
      ),
      onPressed: onPressed,
      child: btn == true
          ? Icon(
              ico,
              size: 38,
            )
          : Text(
              label ?? "LABEL ERROR",
              style: GoogleFonts.poppins(fontSize: 16.0),
            ),
    );
  }
}
