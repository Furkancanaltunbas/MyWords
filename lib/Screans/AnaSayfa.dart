import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sozluk_app/Screans/AddSayfa.dart';
import 'package:sozluk_app/Screans/DetaySayfa.dart';
import 'package:sozluk_app/Screans/HomeSayfa.dart';
import 'package:sozluk_app/Screans/StartsSayfa.dart';
import 'package:sozluk_app/core/constants/colors/theme_colors.dart';

class AnaSayfaWidget extends StatefulWidget {
  const AnaSayfaWidget({Key? key}) : super(key: key);

  @override
  _AnaSayfaWidgetState createState() => _AnaSayfaWidgetState();
}

class _AnaSayfaWidgetState extends State<AnaSayfaWidget> {
  int index = 1;

  final screens = [
    addSayfaWidget(),
    homeSayfaWidget(),
    StartSayfaWidget(),
  ];

  bool aramaYapliyorMu = false;
  String aramaKelimesi = "";

  //var refKelimeler = FirebaseDatabase.instance.reference().child("kelimeler");

  @override
  Widget build(BuildContext context) {
    final items = [
      Icon(
        Icons.add_circle,
        color: whiteColor,
      ),
      Icon(
        Icons.home,
        color: whiteColor,
      ),
      Icon(
        Icons.star,
        color: whiteColor,
      ),
    ];

    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: bacColor,
        color: containerColor,
        height: context.dynamicHeight(0.07),
        index: index,
        items: items,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
