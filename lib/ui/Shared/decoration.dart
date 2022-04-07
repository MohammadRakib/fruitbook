import 'package:flutter/material.dart';

InputDecoration textFieldDecoration = const InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2.0,color: Colors.white),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2.0,color: Color(0xFFA1887F)),
    borderRadius: BorderRadius.all(Radius.circular(20.0),),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2.0,color: Color(0xFFA1887F)),
    borderRadius: BorderRadius.all(Radius.circular(20.0),),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2.0,color: Color(0xFFA1887F)),
    borderRadius: BorderRadius.all(Radius.circular(20.0),),
  ),
  fillColor: Colors.white,
  filled: true,
  floatingLabelBehavior: FloatingLabelBehavior.auto,
  floatingLabelStyle: TextStyle(
    fontSize: 20.0,
    color: Color(0xFFA1887F),
  ),

);