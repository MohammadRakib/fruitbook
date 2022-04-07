import 'package:flutter/material.dart';

import '../../controller/authController.dart';
import '../Shared/Loading.dart';


class Register extends StatefulWidget {

  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthController _auth = AuthController();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String errorMessage = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Container();
    // return loading? const Loading() : Scaffold(
    //   backgroundColor: Colors.brown.shade50,
    //   appBar: AppBar(
    //     title: const Text('Sign Up'),
    //     centerTitle: true,
    //     backgroundColor: Colors.brown.shade300,
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(10.0),
    //     child: Form(
    //       key: _formKey,
    //       child: Column(
    //         children: [
    //           const SizedBox(height: 15.0,),
    //           TextFormField(
    //             decoration: textFieldDecoration.copyWith(label: const Text('Email')),
    //             validator: (val) => val!.isEmpty ? 'Please enter email':null,
    //             onChanged: (val){email = val.trim();},
    //           ),
    //           const SizedBox(height: 15.0,),
    //           TextFormField(
    //             decoration: textFieldDecoration.copyWith(label: const Text('Password')),
    //             maxLengthEnforcement: MaxLengthEnforcement.enforced,
    //             maxLength: 6,
    //             obscureText: true,
    //             validator: (val) => val!.length < 6 ? 'Password must be minimum 6 character':null ,
    //             onChanged: (val){password = val.trim();},
    //           ),
    //           const SizedBox(height: 15.0,),
    //           OutlinedButton(
    //             onPressed: () async{
    //               if(_formKey.currentState!.validate()) {
    //                 setState(() {
    //                   loading = true;
    //                 });
    //                 dynamic user = await _auth.emailPasswordRegister(email: email, password: password);
    //                 if(user is String){
    //                   setState(() {
    //                     errorMessage = user;
    //                     loading = false;
    //                   });
    //                 }else{
    //                   await _databaseController.updateUser(user);
    //                   Navigator.pop(context);
    //                 }
    //               }
    //             },
    //             child: const Text('sign Up'),
    //             style: ButtonStyle(
    //                 overlayColor: MaterialStateProperty.all(Colors.brown.shade100),
    //                 foregroundColor: MaterialStateProperty.all(Colors.brown),
    //                 side: MaterialStateProperty.all(const BorderSide(
    //                   color: Colors.brown,
    //                   width: 1.0,
    //                 )),
    //                 shape: MaterialStateProperty.all(RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(16.0),
    //                 ))
    //             ),
    //           ),
    //           const SizedBox(height: 15.0,),
    //           Text(
    //             errorMessage,
    //             style: TextStyle(
    //               color: Colors.red[900],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}