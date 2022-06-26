import 'package:flutter/cupertino.dart';

class Kelimeler{
  String kelime_id;
  String turkce;
  String ingilizce;

  Kelimeler(this.kelime_id, this.ingilizce, this.turkce );

  factory Kelimeler.fromJson(String key,Map<dynamic,dynamic>json){
    return Kelimeler(key, json["ingilizce"] as String, json["turkce"] as String);
  }

}