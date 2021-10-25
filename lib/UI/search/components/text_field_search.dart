import 'package:flutter/material.dart';

class TextFieldSearchWidget extends StatelessWidget {
  Function(String) onChanged;

  TextFieldSearchWidget({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.7,
      widthFactor: 0.7,
      child: TextFormField(
        onChanged: onChanged,
        cursorHeight: 20,
        autofocus: false,
        cursorColor: const Color(0xffea004e),
        decoration: const InputDecoration(
            alignLabelWithHint: true,
            filled: true,
            fillColor: Colors.white,
            hintText: 'جستجو کنید...',
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
    );
  }
}
