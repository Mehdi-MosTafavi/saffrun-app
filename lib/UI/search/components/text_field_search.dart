import 'package:flutter/material.dart';

import '../../utils/text_field_auto.dart';

class TextFieldSearchWidget extends StatefulWidget {
  Function(String) onChanged;

  TextFieldSearchWidget({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<TextFieldSearchWidget> createState() => _TextFieldSearchWidgetState();
}

class _TextFieldSearchWidgetState extends State<TextFieldSearchWidget> {
  String value = "";

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.7,
      widthFactor: 0.7,
      child: AutoDirection(
        text: value,
        child: TextFormField(
          onChanged: (String text) {
            setState(() {
              value = text;
            });
            widget.onChanged(text);
          },
          cursorHeight: 20,
          autofocus: false,
          cursorColor: const Color(0xffea004e),
          decoration: const InputDecoration(
              alignLabelWithHint: true,
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xff5a5a5a),
              ),
              focusColor: Color(0xffea004e),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)))),
        ),
      ),
    );
  }
}
