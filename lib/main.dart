import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sozluk_app/Screans/AnaSayfa.dart';
import 'package:sozluk_app/core/widgets/buttons/saveButton.dart';

import 'Screans/AddSayfa.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.yellow)),
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: AnaSayfaWidget(),
    );
  }
}
