import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fruitbook/ui/auth/register.dart';

import 'controller/checkInternetConnection.dart';
import 'mainWrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context)=> MainWrapper(),
        '/register': (context) => const Register(),
      },
    );
  }
}


