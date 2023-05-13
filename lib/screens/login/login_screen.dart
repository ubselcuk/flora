import 'package:flora/components/custom_button.dart';
import 'package:flora/components/custom_text_field.dart';
import 'package:flora/constants.dart';
import 'package:flora/screens/home/home_screen.dart';
import 'package:flora/screens/login/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Giriş',
              style: GoogleFonts.poppins(
                color: loginFontColor,
                fontWeight: FontWeight.w600,
                fontSize: 64.0,
              ),
            ),
            Column(
              children: [
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
                    pass = value != '' ? value : '';
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomButton(
                        btn: false,
                        label: 'Giriş Yap',
                        onPressed: () {
                          if (user == '' || pass == '') {
                            showOkAlertDialog(
                              context: context,
                              okLabel: "Tamam",
                              title: "Kullanıcı adı veya şifre boş geçilemez!",
                              style: AdaptiveStyle.iOS,
                            );
                          } else {
                            Navigator.pushNamed(context, HomeScreen.id);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomButton(
                        label: 'Kayıt Ol',
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
          ],
        ),
      ),
    );
  }
}
