import 'package:flutter/material.dart';

Image logoWidget(String imageName) {
  return Image.asset(imageName, fit: BoxFit.fitWidth, width: 500, height: 250);
}

TextField reusableTextField(
  String text,
  IconData icon,
  bool isPasswordType,
  TextEditingController controller,
) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: const Color.fromARGB(96, 39, 19, 0),
    style: TextStyle(
      color: const Color.fromARGB(96, 39, 19, 0).withOpacity(0.9),
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(icon, color: const Color.fromARGB(185, 39, 19, 4)),
      labelText: text,
      labelStyle: TextStyle(
        color: const Color.fromARGB(96, 39, 19, 1).withOpacity(0.9),
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType:
        isPasswordType
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
  );
}

Container signInSignUpButton(
  BuildContext context,
  bool isLogin,
  Function onTap,
) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? 'LOG IN' : 'SING UP',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return const Color.fromARGB(181, 255, 211, 150);
          }
          return const Color.fromARGB(255, 96, 39, 29);
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    ),
  );
}
