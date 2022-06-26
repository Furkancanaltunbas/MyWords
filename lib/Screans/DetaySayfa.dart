import 'package:flutter/material.dart';
import 'package:sozluk_app/Model/Kelimeler.dart';

class detaySayfaWidget extends StatelessWidget {
  Kelimeler kelime;


  detaySayfaWidget({required  this.kelime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text(kelime.ingilizce),
             Text(kelime.turkce),
           ],
         ),
      ),
    );
  }
}
