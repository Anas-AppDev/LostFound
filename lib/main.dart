import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lostfound/Authentication/SplashPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: SplashPage(),
  ));
}