import 'dart:collection';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class addSayfaWidget extends StatefulWidget {
  const addSayfaWidget({Key? key}) : super(key: key);

  @override
  _addSayfaWidgetState createState() => _addSayfaWidgetState();
}

class _addSayfaWidgetState extends State<addSayfaWidget> {
  TextEditingController turkceKelime= TextEditingController();
  TextEditingController ingilizceKelime= TextEditingController();

  var refKelimeler =FirebaseDatabase.instance.reference().child("kelimeler");

  Future<void> kelimeEkle() async {
    var bilgi = HashMap<String,dynamic>();
    bilgi["turkce"] = turkceKelime.text;
    bilgi["ingilizce"] = ingilizceKelime.text;
    refKelimeler.push().set(bilgi);
  }

  @override
  void initState() {
    super.initState();
    kelimeEkle();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text("Kelime Ekle",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body:Center(
      child: SizedBox(
        height: context.dynamicHeight(0.6),
        width: context.dynamicWidth(0.8),
       child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Türkçe Kelime",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(
              height: context.dynamicHeight(0.02),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20,left: 20),
            child: TextField(
              controller: ingilizceKelime,
              decoration: InputDecoration(
                border:  OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))
                )
              ),
            ),
            ),
            SizedBox(
              height: context.dynamicHeight(0.05),
            ),
            Text("İngilizce Kelime",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(
              height: context.dynamicHeight(0.02),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20,left: 20),
            child: TextField(
              controller: turkceKelime,
              decoration: InputDecoration(
                  border:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  )
              ),
            ),
            ),
            SizedBox(
              height: context.dynamicWidth(0.2),
            ),
            SizedBox(
                height: context.dynamicHeight(0.05),
                width: context.dynamicWidth(0.6),
             child: ElevatedButton(
                 onPressed: (){
                   print(ingilizceKelime);
                   print(turkceKelime);




            },
                child: Text("Kaydet")
            )
            ),
          ],
        ),
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.all(Radius.circular(20))
         ),
     ),
      ),
      ),
    );
  }
}
