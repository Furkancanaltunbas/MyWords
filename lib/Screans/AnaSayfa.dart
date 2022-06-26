import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sozluk_app/Model/Kelimeler.dart';
import 'package:sozluk_app/Screans/AddSayfa.dart';
import 'package:sozluk_app/Screans/DetaySayfa.dart';
import 'package:sozluk_app/Screans/HomeSayfa.dart';
import 'package:sozluk_app/Screans/StartsSayfa.dart';

class AnaSayfaWidget extends StatefulWidget {
  const AnaSayfaWidget({Key? key}) : super(key: key);

  @override
  _AnaSayfaWidgetState createState() => _AnaSayfaWidgetState();
}

class _AnaSayfaWidgetState extends State<AnaSayfaWidget> {
  int index = 1;

  final screens=[
    addSayfaWidget(),
    homeSayfaWidget(),
    StartSayfaWidget(),
  ];



  bool aramaYapliyorMu = false;
  String aramaKelimesi = "";

  var refKelimeler =FirebaseDatabase.instance.reference().child("kelimeler");


  @override
  Widget build(BuildContext context) {

    final items=[
      Icon(Icons.add_circle),
      Icon(Icons.home),
      Icon(Icons.star),
    ];

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: screens[index],
    bottomNavigationBar: CurvedNavigationBar(
    height: 60,
    index: index,
    items: items,
    onTap: (index) => setState(() => this.index = index),
    ),
    );
          }
        }


