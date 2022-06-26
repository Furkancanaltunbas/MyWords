import 'package:flutter/material.dart';
import 'package:sozluk_app/Screans/AnaSayfa.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // These two lines
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: AnaSayfaWidget(),
    );
  }
}
