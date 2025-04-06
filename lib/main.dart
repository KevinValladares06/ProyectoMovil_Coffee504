import 'package:firebase_core/firebase_core.dart';
//import 'package:coffee_504/screens/signin_screen.dart';
import 'package:coffee_504/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // this widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee 504',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: const Bienvenida(),
    );
  }
}
