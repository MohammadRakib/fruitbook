import 'package:flutter/material.dart';

import '../controller/authController.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController _auth = AuthController();
    return Container(
      child: ElevatedButton(
        onPressed: ()async{
          bool logout = await _auth.logout();
          if(logout){
            Navigator.pushReplacementNamed(context, '/');
          }
        }, child: Text('logout'),
      ),
    );
  }
}

