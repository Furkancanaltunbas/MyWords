import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sozluk_app/core/constants/colors/theme_colors.dart';

class SaveButton extends StatefulWidget {
  Function() function;
  SaveButton({Key? key, required this.function}) : super(key: key);

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.dynamicHeight(0.06),
        width: context.dynamicWidth(0.6),
        child: ElevatedButton(
          onPressed: widget.function,
          child: Text(
            "Kaydet",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: context.dynamicHeight(0.04),
                fontFamily: 'IndieFlower',
                color: whiteColor),
          ),
          style: ElevatedButton.styleFrom(primary: bacColor),
        ));
  }
}
