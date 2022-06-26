import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:sozluk_app/Model/Kelimeler.dart';
import 'package:sozluk_app/Screans/DetaySayfa.dart';

class homeSayfaWidget extends StatefulWidget {
  const homeSayfaWidget({Key? key}) : super(key: key);

  @override
  _homeSayfaWidgetState createState() => _homeSayfaWidgetState();
}

class _homeSayfaWidgetState extends State<homeSayfaWidget> {

  bool aramaYapliyorMu = false;
  String aramaKelimesi = "";
  bool favoriKelime=false;


  var refKelimeler =FirebaseDatabase.instance.reference().child("kelimeler");


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: aramaYapliyorMu ? TextField(
          decoration: InputDecoration(hintText: "Arama kelimesini giriniz"),
          onChanged: (aramaSonucu){
            print("Arama sonucu : $aramaSonucu");
            setState(() {
              aramaKelimesi=aramaSonucu;
            });
          },
        ): Text("KELİMELERİM",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),), centerTitle: true,
        actions: [
          aramaYapliyorMu ?
          IconButton(
              onPressed: (){
                setState(() {
                  aramaYapliyorMu =  false;
                  aramaKelimesi = "";
                });
              },
              icon: Icon(Icons.cancel))
              : IconButton(
              onPressed: (){
                setState(() {
                  aramaYapliyorMu =  true;
                });
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: StreamBuilder<DatabaseEvent>(
        stream: refKelimeler.onValue,
        builder: (context, event) {
          if (event.hasData) {
            var kelimelerListesi = <Kelimeler>[];

            var gelenDegerler=event.data!.snapshot.value as dynamic;

            if(gelenDegerler !=null){
              gelenDegerler.forEach((key, nesne){
                var gelenKelime=Kelimeler.fromJson(key, nesne);

                if(aramaYapliyorMu){
                  if(gelenKelime.ingilizce.contains(aramaKelimesi)){
                    kelimelerListesi.add(gelenKelime);
                  }
                }
                else{
                  kelimelerListesi.add(gelenKelime);
                }


              }
              );
            }

            return ListView.builder(
              itemCount: kelimelerListesi.length,
              itemBuilder: (context, indeks) {
                var kelime = kelimelerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>detaySayfaWidget(kelime: kelime)));
                  },
                  child: SizedBox(
                    height: 50,
                    child:Card(
                      color: Colors.amberAccent,
                      elevation: 20.0,
                      child: Row(
                        children: [
                          Spacer(flex: 10,),
                          Text(kelime.ingilizce),
                          Spacer(flex: 10,),
                          Text(kelime.turkce),
                          Spacer(flex: 10,),
                          IconButton(
                              onPressed: (){
                            setState(() {
                              favoriKelime = true;
                            });
                          },
                              icon: Icon(Icons.star,color: favoriKelime ? Colors.white : Colors.red,)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          else {
            return Center(
              child: Text("hata"),
            );
          }
        },
      ),
    );
  }
}

