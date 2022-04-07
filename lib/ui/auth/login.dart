import 'package:flutter/material.dart';

import '../../controller/authController.dart';
import '../Shared/Loading.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

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
    //     title: const Text('Sign In'),
    //     backgroundColor: Colors.brown.shade300,
    //     actions: [
    //       ElevatedButton.icon(
    //         onPressed: (){
    //           Navigator.pushNamed(context, '/register');
    //         },
    //         icon: const Icon(Icons.person),
    //         label: const Text('Sign Up'),
    //         style: ButtonStyle(
    //           elevation: MaterialStateProperty.all(0.0),
    //           backgroundColor: MaterialStateProperty.all(Colors.brown.shade300),
    //         ),
    //       ),
    //     ],
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
    //                 dynamic user = await _auth.emailPasswordSignIn(email: email, password: password);
    //                 if(user is String){
    //                   setState(() {
    //                     errorMessage = user;
    //                     loading = false;
    //                   });
    //                 }else{
    //                   print(user.userId);
    //                 }
    //               }
    //             },
    //             child: const Text('sign in'),
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