import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../controller/authController.dart';
import '../Shared/Loading.dart';
import '../Shared/decoration.dart';


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
  String connectionStatus = 'Online';
  Color conColor = Colors.green.shade900;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroler = TextEditingController();
    TextEditingController passwordcontroler = TextEditingController();
    return loading? const Loading() : Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(connectionStatus,
                style: TextStyle(
                    color: conColor
                ),

              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 15.0,),
              TextFormField(
                decoration: textFieldDecoration.copyWith(label: const Text('Email')),
                validator: (val) => val!.isEmpty ? 'Please enter email':null,
                controller: emailcontroler,
              ),
              const SizedBox(height: 15.0,),
              TextFormField(
                decoration: textFieldDecoration.copyWith(label: const Text('Password')),
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                maxLength: 6,
                obscureText: true,
                validator: (val) => val!.length < 6 ? 'Password must be minimum 6 character':null ,
                controller: passwordcontroler,
              ),
              const SizedBox(height: 15.0,),
              OutlinedButton(
                onPressed: () async{
                  if(_formKey.currentState!.validate()) {
                    setState(() {
                      loading = true;
                    });
                    email = emailcontroler.value.text.trim();
                    password = passwordcontroler.value.text.trim();
                    bool isreg = await _auth.register(email, password);
                    if(!isreg){
                      setState(() {
                        errorMessage = 'Email already exist, please enter another email';
                        loading = false;
                      });
                    }else{
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, '/');
                    }
                  }
                },
                child: const Text('sign Up'),
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.brown.shade100),
                    foregroundColor: MaterialStateProperty.all(Colors.brown),
                    side: MaterialStateProperty.all(const BorderSide(
                      color: Colors.brown,
                      width: 1.0,
                    )),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ))
                ),
              ),
              const SizedBox(height: 15.0,),
              Text(
                errorMessage,
                style: TextStyle(
                  color: Colors.red[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}