import 'dart:collection';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:sozluk_app/Screans/DetaySayfa.dart';
import 'package:kartal/kartal.dart';
import 'package:sozluk_app/core/constants/colors/theme_colors.dart';

import '../init/Model/Kelimeler.dart';

class homeSayfaWidget extends StatefulWidget {
  const homeSayfaWidget({Key? key}) : super(key: key);

  @override
  _homeSayfaWidgetState createState() => _homeSayfaWidgetState();
}

class _homeSayfaWidgetState extends State<homeSayfaWidget> {
  bool aramaYapliyorMu = false;
  String aramaKelimesi = "";
  bool favoriKelime = true;

  var refKelimeler = FirebaseDatabase.instance.reference().child("kelimeler");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bacColor,
      appBar: AppBar(
        title: aramaYapliyorMu
            ? TextField(
                decoration: InputDecoration(
                    hintText: "  Ara",
                    hintStyle: TextStyle(
                        fontFamily: 'IndieFlower',
                        fontSize: context.dynamicHeight(0.03),
                        fontWeight: FontWeight.w100,
                        color: whiteColor)),
                onChanged: (aramaSonucu) {
                  print("Arama sonucu : $aramaSonucu");
                  setState(() {
                    aramaKelimesi = aramaSonucu;
                  });
                },
              )
            : Text(
                "KELİMELERİM",
                style: TextStyle(
                    fontSize: context.dynamicHeight(0.05),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'IndieFlower'),
              ),
        centerTitle: true,
        actions: [
          aramaYapliyorMu
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapliyorMu = false;
                      aramaKelimesi = "";
                    });
                  },
                  icon: Icon(Icons.cancel))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapliyorMu = true;
                    });
                  },
                  icon: Icon(Icons.search))
        ],
        backgroundColor: containerColor,
      ),
      body: StreamBuilder<DatabaseEvent>(
        stream: refKelimeler.onValue,
        builder: (context, event) {
          if (event.hasData) {
            var kelimelerListesi = <Kelimeler>[];

            var gelenDegerler = event.data!.snapshot.value as dynamic;

            if (gelenDegerler != null) {
              gelenDegerler.forEach((key, nesne) {
                var gelenKelime = Kelimeler.fromJson(key, nesne);

                if (aramaYapliyorMu) {
                  if (gelenKelime.ingilizce.contains(aramaKelimesi)) {
                    kelimelerListesi.add(gelenKelime);
                  }
                } else {
                  kelimelerListesi.add(gelenKelime);
                }
              });
            }

            return ListView.builder(
              itemCount: kelimelerListesi.length,
              itemBuilder: (context, indeks) {
                var kelime = kelimelerListesi[indeks];
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  key: UniqueKey(),
                  background: Container(
                    color: redColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.delete,
                          color: whiteColor,
                        ),
                        SizedBox(
                          width: context.dynamicWidth(0.03),
                        ),
                        Text(
                          "DELETE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'IndieFlower',
                              color: whiteColor,
                              fontSize: context.dynamicHeight(0.03)),
                        ),
                        SizedBox(
                          width: context.dynamicWidth(0.03),
                        )
                      ],
                    ),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      Future<void> kelimeSil() async {
                        refKelimeler.child(kelime.kelime_id).remove();
                      }

                      kelimeSil();
                    });
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  detaySayfaWidget(kelime: kelime)));
                    },
                    child: SizedBox(
                      height: context.dynamicHeight(0.07),
                      child: Card(
                        color: openColor,
                        elevation: 20.0,
                        child: Row(
                          children: [
                            Spacer(
                              flex: 10,
                            ),
                            Text(
                              kelime.ingilizce,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: context.dynamicHeight(0.025),
                                color: whiteColor,
                              ),
                            ),
                            Spacer(
                              flex: 10,
                            ),
                            Text(
                              kelime.turkce,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: context.dynamicHeight(0.025),
                                  color: whiteColor),
                            ),
                            Spacer(
                              flex: 10,
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    favoriKelime = !favoriKelime;

                                    if(favoriKelime){
                                      
                                    }

                                  });
                                },
                                icon: Icon(
                                  Icons.star,
                                  color:
                                      favoriKelime ? Colors.white : Colors.red,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(""),
            );
          }
        },
      ),
    );
  }
}
