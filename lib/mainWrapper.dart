import 'package:flutter/material.dart';
import 'package:fruitbook/controller/authController.dart';
import 'package:fruitbook/model/user.dart';
import 'package:fruitbook/ui/auth/login.dart';
import 'package:fruitbook/ui/home.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({Key? key}) : super(key: key);

  final AuthController authController = AuthController();
  static late User? currentUser;
  @override
  Widget build(BuildContext context){
    return FutureBuilder<User?>(
        future: authController.getCurrentUser(),
        builder: (context, snapshot) {
          currentUser = snapshot.data;
          return currentUser!=null? const Home():const Login();
        }
    );
  }
}
