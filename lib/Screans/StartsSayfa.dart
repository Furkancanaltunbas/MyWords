import 'package:flutter/material.dart';
import 'package:sozluk_app/core/constants/colors/theme_colors.dart';

class StartSayfaWidget extends StatefulWidget {
  const StartSayfaWidget({Key? key}) : super(key: key);

  @override
  _StartSayfaWidgetState createState() => _StartSayfaWidgetState();
}

class _StartSayfaWidgetState extends State<StartSayfaWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bacColor,
      body: Center(
        child: Container(
          child: Text("Start Sayfa"),
        ),
      ),
    );
  }
}
