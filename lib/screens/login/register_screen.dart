import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flora/components/custom_button.dart';
import 'package:flora/components/custom_text_field.dart';
import 'package:flora/constants.dart';
import 'package:flora/screens/home/home_screen.dart';
import 'package:flora/sql.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

check(String email, String user, String pass, c) async {
  await db(
      "INSERT INTO users(mail, password, username) VALUES('$email','$pass','$user')");
  var check = await db(
      "SELECT * FROM users WHERE username='$user' and password='$pass'");
  if (check.length == 1) {
    Navigator.pushNamed(c, HomeScreen.id);
  } else {
    showOkAlertDialog(
      context: c,
      okLabel: "Tamam",
      title: "Kayıt Sırasında Hata Oluştu!",
      style: AdaptiveStyle.iOS,
    );
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool remember = false;
  String user = '';
  String pass = '';
  String email = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: loginMainColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Kayıt',
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
                CustomTextField(
                  hintText: 'Email',
                  icon: Icons.mail_rounded,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    email = value != '' ? value : '';
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomButton(
                        label: 'Kayıt Ol',
                        btn: false,
                        onPressed: () {
                          if (user == '' || pass == '' || email == '') {
                            showOkAlertDialog(
                              context: context,
                              okLabel: "Tamam",
                              title:
                                  "Kullanıcı adı, şifre veya email boş geçilemez!",
                              style: AdaptiveStyle.iOS,
                            );
                          } else {
                            check(email, user, pass, context);
                          }
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
