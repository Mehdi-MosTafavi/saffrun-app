import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:saffrun_app/constants/theme_color.dart';

class T2EditTextField extends StatefulWidget {
  var isPassword;
  var isSecure;
  var fontSize;
  var textColor;
  var fontFamily;
  var text;
  var maxLine;
  bool number;
  TextEditingController? mController;

  VoidCallback? onPressed;

  var maxLength;

  Function(String)? onChanged;

  T2EditTextField(
      {var this.fontSize = 20.0,
      var this.textColor = black,
      var this.isPassword = true,
      var this.isSecure = false,
      var this.text = "",
      var this.mController,
      this.number = false,
      this.maxLength = null,
      this.onChanged,
      var this.maxLine = 1});

  @override
  State<StatefulWidget> createState() {
    return T2EditTextFieldState();
  }
}

class T2EditTextFieldState extends State<T2EditTextField> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isSecure) {
      return TextField(
        controller: widget.mController,
        obscureText: widget.isPassword,
        cursorColor: black,
        maxLines: widget.maxLine,
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        style: TextStyle(
            fontSize: widget.fontSize,
            color: Colors.black,
            fontFamily: widget.fontFamily),
        keyboardType: widget.number ? TextInputType.number : TextInputType.text,
        inputFormatters:
            widget.number ? [FilteringTextInputFormatter.digitsOnly] : null,
        decoration: InputDecoration(
            enabledBorder: widget.maxLine == 1
                ? const UnderlineInputBorder(
                    borderSide: BorderSide(color: colorPallet2),
                  )
                : const OutlineInputBorder(
                    borderSide: BorderSide(color: colorPallet2)),
            focusedBorder: widget.maxLine == 1
                ? const UnderlineInputBorder(
                    borderSide: BorderSide(color: colorPallet2),
                  )
                : const OutlineInputBorder(
                    borderSide: BorderSide(color: colorPallet2))),
      );
    } else {
      return TextField(
          controller: widget.mController,
          obscureText: widget.isPassword,
          cursorColor: black,
          style: TextStyle(
              fontSize: widget.fontSize,
              color: colorPallet3,
              fontFamily: widget.fontFamily),
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  widget.isPassword = !widget.isPassword;
                });
              },
              child: Icon(
                  widget.isPassword ? Icons.visibility : Icons.visibility_off,
                  color: colorPallet3),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: colorPallet3),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: colorPallet3),
            ),
          ));
    }
  }

  @override
  State<StatefulWidget>? createState() {
    return null;
  }
}
