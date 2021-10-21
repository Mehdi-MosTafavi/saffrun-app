import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:saffrun_app/constants/theme_color.dart';

var loginTheme = LoginTheme(
    primaryColor: colorBackgroundAuthMenu,
    accentColor: colorBackgroundAuthMenu,
    titleStyle: const TextStyle(
      color: colorPallet5,
      letterSpacing: 3,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 5,
      margin: const EdgeInsets.only(top: 15),
      shape:
          ContinuousRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
    ),
    buttonTheme: LoginButtonTheme(
      splashColor: Colors.purple,
      backgroundColor: colorLoginButton,
      highlightColor: colorLoginButtonClick,

      elevation: 9.0,
      highlightElevation: 6.0,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      // shape: CircleBorder(side: BorderSide(color: Colors.green)),
      // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
    ),
    inputTheme: const InputDecorationTheme(
        filled: true,
        focusColor: Colors.black,
        hoverColor: Colors.black,
        prefixStyle: TextStyle(color: Colors.black)));
