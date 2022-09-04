import 'dart:collection';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sozluk_app/core/widgets/buttons/saveButton.dart';

import '../core/constants/colors/theme_colors.dart';

class addSayfaWidget extends StatefulWidget {
  const addSayfaWidget({Key? key}) : super(key: key);

  @override
  _addSayfaWidgetState createState() => _addSayfaWidgetState();
}

class _addSayfaWidgetState extends State<addSayfaWidget> {
  TextEditingController turkceKelime = TextEditingController();
  TextEditingController ingilizceKelime = TextEditingController();

  var refKelimeler = FirebaseDatabase.instance.reference().child("kelimeler");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bacColor,
      appBar: AppBar(
        title: Text("Kelime Ekle",
            style: TextStyle(
                fontSize: context.dynamicHeight(0.06),
                fontWeight: FontWeight.bold,
                fontFamily: 'IndieFlower')),
        centerTitle: true,
        backgroundColor: containerColor,
      ),
      body: Center(
        child: SizedBox(
          height: context.dynamicHeight(0.6),
          width: context.dynamicWidth(0.8),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "İngilizce Kelime",
                  style: TextStyle(
                      fontSize: context.dynamicHeight(0.04),
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IndieFlower'),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.02),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: TextField(
                    controller: ingilizceKelime,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        hintText: "...",
                        filled: true,
                        fillColor: bacColor),
                  ),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.05),
                ),
                Text(
                  "Türkçe Kelime",
                  style: TextStyle(
                      fontSize: context.dynamicHeight(0.04),
                      color: whiteColor,
                      fontFamily: 'IndieFlower',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.02),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: TextField(
                    controller: turkceKelime,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        hintText: "...",
                        filled: true,
                        fillColor: bacColor),
                  ),
                ),
                SizedBox(
                  height: context.dynamicWidth(0.2),
                ),
                SaveButton(
                  function: () {
                    print(ingilizceKelime);
                    print(turkceKelime);
                    Map<String, dynamic> wordData = {
                      'turkce': turkceKelime,
                      'ingilizce': ingilizceKelime
                    };
                    Future<void> kelimeEkle() async {
                      var bilgi = HashMap<String, dynamic>();
                      bilgi["turkce"] = turkceKelime.text;
                      bilgi["ingilizce"] = ingilizceKelime.text;
                      refKelimeler.push().set(bilgi);
                    }

                    kelimeEkle();
                  },
                )
              ],
            ),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 7.0,
                      offset: Offset(10, 15),
                      color: Colors.black)
                ],
                color: openColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
        ),
      ),
    );
  }
}
