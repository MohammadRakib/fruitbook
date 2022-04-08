import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../controller/authController.dart';
import '../controller/checkInternetConnection.dart';
import '../controller/fruitApiController.dart';
import '../model/fruit.dart';
import 'card/fruitCard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String connectionStatus = 'Online';
  Color conColor = Colors.green.shade900;
  FruitApiController fruitApiController = FruitApiController();

  bool hasConnection = true;
  late StreamSubscription _connectivitySubscription;
  CheckInternetConnection checkInternetConnection = CheckInternetConnection();

  List<Fruit> fruitListFromDatabase = [];
  String emptyListBodyText = 'Please press load button for loading fruits';

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
          emptyListBodyText = 'Please press load button for loading fruits';
        });
      }else{
        setState(() {
          connectionStatus = 'Offline';
          conColor = Colors.red.shade900;
          emptyListBodyText = 'No Internet Connection';
        });
      }
    });
  }

  // disposing the listener
  void disposeConnectivityListener(){
    _connectivitySubscription.cancel();
  }

  // this method will invoke when load button is pressed
  Future onLoad()async{
    bool isEmpty = await fruitApiController.checkFruitEmpty();
    hasConnection = await checkInternetConnection.checkInitialConnectivityState();
    if(isEmpty && hasConnection){
      List<Fruit> fruitList = await fruitApiController.getFruitData();
      if(fruitList.isNotEmpty){
        await fruitApiController.insertFruitData(fruitList);
      }
    }

    fruitListFromDatabase = await fruitApiController.getAllFruit();
    print(fruitListFromDatabase);
  }

  @override
  Widget build(BuildContext context) {
    final AuthController _auth = AuthController();
    return FutureBuilder<bool>(
        future: checkInternetConnection.checkInitialConnectivityState(),
        builder: (context, snapshot) {
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
          return Scaffold(
            backgroundColor: Colors.orange.shade50,
            appBar: AppBar(
              title: const Text('Home'),
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
            body: Column(
              children: [
                const SizedBox(height: 5.0,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: ()async{
                          await onLoad();
                          setState(() {

                          });
                        },
                        child: const Text('Load'),
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(const Size.fromWidth(80.0)),
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

                      OutlinedButton(
                        onPressed: ()async{
                            await fruitApiController.deleteAllFruit();
                            bool isEmpty = await fruitApiController.checkFruitEmpty();
                            hasConnection = await checkInternetConnection.checkInitialConnectivityState();

                            if(isEmpty){
                              setState(() {
                                fruitListFromDatabase = [];
                                if(!hasConnection){
                                  emptyListBodyText = 'No Internet Connection';
                                }else{
                                  emptyListBodyText = 'Please press load button for loading fruits';
                                }
                              });
                            }
                        },
                        child: const Text('Delete'),
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(const Size.fromWidth(80.0)),
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
                      
                      OutlinedButton(
                        onPressed: ()async{
                          bool logout = await _auth.logout();
                          if(logout){
                            Navigator.pushReplacementNamed(context, '/');
                          }
                        },
                        child: const Text('Log out'),
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(const Size.fromWidth(80.0)),
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

                Expanded(
                  child: fruitListFromDatabase.isEmpty? Center(child: Text(emptyListBodyText)) : ListView.builder(
                    itemCount: fruitListFromDatabase.length,
                    itemBuilder: (context,index) {
                      return FruitCard(fruit: fruitListFromDatabase[index],);
                    }
                  ),
                )
              ],
            ),
          );
        });
  }
}


