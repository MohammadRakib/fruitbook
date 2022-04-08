import 'package:fruitbook/controller/dbController.dart';
import 'package:fruitbook/model/user.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'package:sqflite/sqflite.dart';
class AuthController{

  //Register
  Future<bool> register(String email, String password) async{
    final db = await DbController.instance.database;

    //check if email already exist
    bool userExist = await checkIfUserexist(db, email);
    if(!userExist){
      final bytes = utf8.encode(password);
      final encryptedPassword = sha1.convert(bytes);

      final user = User(email: email, password: encryptedPassword.toString(), loginStatus: true);

      await db.insert('users', user.toMap());
      return true;

    }else{
      return false;
    }
  }

  Future<bool> checkIfUserexist(Database db, String email) async{
    String sqluser = 'users WHERE email = \'$email\'';
    final List<Map<String, dynamic>> maps = await db.query(sqluser);
    return maps.isNotEmpty? true:false;
  }

  // Login
  Future<bool> login(String email, String password) async{
    final db = await DbController.instance.database;

    //search user in the database
    User? userExist = await searchUser(db, email);
    if(userExist != null){
      final bytes = utf8.encode(password);
      final encryptedPassword = sha1.convert(bytes);
      if(userExist.password == encryptedPassword.toString()){
        updateUserLoginStatus(db, userExist);
        return true;

      }else{
        return false;
      }
    }
    return false;
  }
  
  Future updateUserLoginStatus(Database db,User user) async{

    User updatedUser = User(email: user.email,
                            password: user.password,
                            loginStatus: !user.loginStatus);
    
    await db.update('users', updatedUser.toMap(),
        where: 'email = ?',
        whereArgs: [user.email],
    );
  }

  Future<User?> searchUser(Database db, String email) async{
    String sqluser = 'users WHERE email = \'$email\'';
    final List<Map<String, dynamic>> maps = await db.query(sqluser);
    if(maps.isNotEmpty){
      final userList = List.generate(maps.length, (i) {
        return User(
            email: maps[i]['email'],
            password: maps[i]['password'],
            loginStatus: maps[i]['loginStatus'] == 1? true:false
        );
      });
      return userList[0];
    }
    return null;
  }

  //get current user
  Future<User?> getCurrentUser() async{
    final db = await DbController.instance.database;
    String sqluser = 'users WHERE loginStatus = 1';
    final List<Map<String, dynamic>> maps = await db.query(sqluser);
    if(maps.isNotEmpty){
      final userList = List.generate(maps.length, (i) {
        return User(
            email: maps[i]['email'],
            password: maps[i]['password'],
            loginStatus: maps[i]['loginStatus'] == 1? true:false
        );
      });
      return userList[0];
    }
    return null;
  }

  //logout
  Future<bool> logout() async{
    final db = await DbController.instance.database;
    User? user = await getCurrentUser();
    if(user != null){
      updateUserLoginStatus(db, user);
      return true;
    }
    return false;
  }

  Future<List<User>> getAllUser()async{
    final db = await DbController.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    final userList = List.generate(maps.length, (i) {
      return User(
          email: maps[i]['email'],
          password: maps[i]['password'],
          loginStatus: maps[i]['loginStatus'] == 1? true:false
      );
    });
    print('map: $maps');
    return userList;
  }

}