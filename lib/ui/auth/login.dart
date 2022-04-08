import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruitbook/model/user.dart';

import '../../controller/authController.dart';
import '../Shared/Loading.dart';
import '../Shared/decoration.dart';

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
  String connectionStatus = 'Online';
  Color conColor = Colors.green.shade900;

  // sign in user
  Future signIn()async{
    bool islog = await _auth.login(email, password);
    if(!islog){
      setState(() {
        errorMessage = 'Incorrect email or password';
        loading = false;
      });
    }else{
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  // this method will be invoked when sign in button is pressed
  Future onSignIn(TextEditingController emailController,TextEditingController passwordController)async{
    if(_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      email = emailController.value.text.trim();
      password = passwordController.value.text.trim();

      await signIn();

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
    return loading? const Loading() : Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        title: const Text('Sign In'),
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
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
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

                const SizedBox(height: 10.0,),
                OutlinedButton(
                  onPressed: () async{
                    await onSignIn(emailController, passwordController);
                  },
                  child: const Text('Sign In'),
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.green.shade100),
                      foregroundColor: MaterialStateProperty.all(Colors.green),
                      side: MaterialStateProperty.all(const BorderSide(
                        color: Colors.green,
                        width: 1.0,
                      )),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ))
                  ),
                ),

                const SizedBox(height: 10.0,),
                const Text('OR',),

                const SizedBox(height: 10.0,),
                OutlinedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('Sign Up'),
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

                // OutlinedButton(
                //   onPressed: () async{
                //     List<User> li = await _auth.getAllUser();
                //   },
                //   child: const Text('check'),
                //   style: ButtonStyle(
                //       overlayColor: MaterialStateProperty.all(Colors.red.shade100),
                //       foregroundColor: MaterialStateProperty.all(Colors.red),
                //       side: MaterialStateProperty.all(const BorderSide(
                //         color: Colors.red,
                //         width: 1.0,
                //       )),
                //       shape: MaterialStateProperty.all(RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(16.0),
                //       ))
                //   ),
                // ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}