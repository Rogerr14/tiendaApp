import 'package:comisariato/utils/constants/constants.dart';
import 'package:flutter/material.dart';

Widget textForm(String hintText,bool obscureText, Stream bloc, Function(String) change) {
  final outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(width: 5.0, color: fondoColor),
  );



  return StreamBuilder(
    stream: bloc,
    builder: (context,AsyncSnapshot snapshot) {
      return SizedBox(
      width: 300,
      height: 80,
      child: TextField(
        textAlign: TextAlign.center,
        
        obscureText: obscureText,
        decoration: InputDecoration(
        errorText: (snapshot.hasError) ? snapshot.error.toString() : null,
        hintText: hintText,
        
        
        enabledBorder: outlineInputBorder,
        border: outlineInputBorder,
      ),
      onChanged: change,
      ),
    );
  });
}
