import 'package:flutter/material.dart';
import 'package:coffee_504/screens/signin_screen.dart';
import 'package:coffee_504/screens/pantalla_aboutus.dart';

class Bienvenida extends StatefulWidget {
  const Bienvenida({Key? key}) : super(key: key);

  @override
  _bienvenida createState() => _bienvenida();
}

class _bienvenida extends State<Bienvenida> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 225, 185, 159)),

      backgroundColor: Color.fromARGB(255, 225, 185, 159),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/logo.png'),
            Text(
              "Bienvenidos",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
            ),

            Padding(padding: EdgeInsets.all(20)),

            ElevatedButton(
              child: Text("Login", style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 96, 39, 29),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            Padding(padding: EdgeInsets.all(5.0)),

            ElevatedButton(
              child: Text("Acerca de", style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 96, 39, 29),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
