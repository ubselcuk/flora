import 'package:flora/components/custom_button.dart';
import 'package:flora/components/custom_text_field.dart';
import 'package:flora/constants.dart';
import 'package:flora/screens/home/home_screen.dart';
import 'package:flora/screens/login/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool remember = false;
  String user = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: loginMainColor,
        child: Column(
          children: [
            SizedBox(height: 50),
            Text(
              'LOGIN',
              style: GoogleFonts.poppins(
                color: loginFontColor,
                fontWeight: FontWeight.w600,
                fontSize: 64.0,
              ),
            ),
            CustomTextField(
              hintText: 'Kullanıcı Adı',
              icon: Icons.person,
              keyboardType: TextInputType.name,
              onChanged: (value) {
                user = value != '' ? value : '';
              },
            ),
            CustomTextField(
              hintText: 'Şifre',
              icon: Icons.key,
              keyboardType: TextInputType.name,
              onChanged: (value) {
                user = value != '' ? value : '';
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomButton(
                    btn: false,
                    label: 'Log In',
                    onPressed: () {
                      Navigator.pushNamed(context, HomeScreen.id);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomButton(
                    label: 'Sign Up',
                    btn: false,
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterScreen.id);
                    },
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
