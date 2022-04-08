import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../controller/authController.dart';
import '../../controller/checkInternetConnection.dart';
import '../Shared/Loading.dart';
import '../Shared/decoration.dart';
import 'package:email_validator/email_validator.dart';

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

  bool hasConnection = false;
  late StreamSubscription _connectivitySubscription;
  CheckInternetConnection checkInternetConnection = CheckInternetConnection();

  @override
  void initState() {
    super.initState();
    listenToConnectivity();
  }

  @override
  void dispose() {
    super.dispose();
    disposeConnectivityListener();
  }

  // listening if mobile is connected to wifi or mobile network
  void listenToConnectivity(){
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async{
      bool hasConnection = await checkInternetConnection.checkConnectivityState(result);
      if(hasConnection){
        setState(() {
          connectionStatus = 'Online';
          conColor = Colors.green.shade900;
        });
      }else{
        setState(() {
          connectionStatus = 'Offline';
          conColor = Colors.red.shade900;
        });
      }
    });
  }

  // disposing the listener
  void disposeConnectivityListener(){
    _connectivitySubscription.cancel();
  }

  // check if email format is correct
  bool emailValidate(){
    return EmailValidator.validate(email);
  }

  //registering user and validation
  Future register() async{
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

  // this method is called when sign up button is pressed
  Future onSignUp(TextEditingController emailController, TextEditingController passwordController)async{
    if(_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      email = emailController.value.text.trim();
      password = passwordController.value.text.trim();

      if(emailValidate()){
        register();
      }else{
        setState(() {
          loading = false;
          errorMessage = 'Please enter email in correct format';
        });
      }

    }else{
      setState(() {
        errorMessage = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return FutureBuilder<bool>(
        future: checkInternetConnection.checkInitialConnectivityState(),
        builder: (context,snapshot) {
          if(snapshot.hasData){
            hasConnection = snapshot.data!;
          }
          if(hasConnection){
            connectionStatus = 'Online';
            conColor = Colors.green.shade900;
          }else{
            connectionStatus = 'Offline';
            conColor = Colors.red.shade900;
          }
          return loading? const Loading() : Scaffold(
            backgroundColor: Colors.orange.shade50,
            appBar: AppBar(
              title: const Text('Sign Up'),
              centerTitle: true,
              backgroundColor: Colors.orangeAccent,
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
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 15.0,),
                      TextFormField(
                        decoration: textFieldDecoration.copyWith(label: const Text('Email')),
                        validator: (val) => val!.isEmpty ? 'Please enter email':null,
                        controller: emailController,
                      ),
                      const SizedBox(height: 15.0,),
                      TextFormField(
                        decoration: textFieldDecoration.copyWith(label: const Text('Password')),
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        maxLength: 6,
                        obscureText: true,
                        validator: (val) => val!.length < 6 ? 'Password must be minimum 6 character':null ,
                        controller: passwordController,
                      ),

                      Text(
                        errorMessage,
                        style: TextStyle(
                          color: Colors.red[900],
                        ),
                      ),

                      const SizedBox(height: 15.0,),

                      OutlinedButton(
                        onPressed: () async{
                           await onSignUp(emailController, passwordController);
                        },
                        child: const Text('sign Up'),
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(const Size.fromWidth(200.0)),
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
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}