import 'dart:convert';

import 'package:fruitbook/model/fruit.dart';
import 'package:http/http.dart';

import 'dbController.dart';
class FruitApiController{

// get fruit data from Api
Future<List<Fruit>> getFruitData()async{

  try{
    Response response = await get(Uri.parse('https://fruityvice.com/api/fruit/all'));
    List data = jsonDecode(response.body);
    return convertData(data);
  }
  catch(e){
    return [];
  }
}

// converting list of map data to list of fruit data
List<Fruit> convertData(List data){
  List<Fruit> fruitList = [];
  for(dynamic x in data){

    dynamic nutritions = x['nutritions'];

    Fruit fruit = Fruit(fruitName: x['name'],
        genus: x['genus'],
        family: x['family'],
        carbohydrates: nutritions['carbohydrates'],
        protein: nutritions['protein'],
        calories: nutritions['calories'],
        fat: nutritions['fat'],
        sugar: nutritions['sugar'],
        order: x['order']);

    fruitList.add(fruit);
  }
  return fruitList;
}

//insert fruit to the database
Future insertFruitData(List<Fruit> fruitList)async{
  final db = await DbController.instance.database;

  for(Fruit x in fruitList){
    await db.insert('fruits', x.toMap());
  }
}

//delete all fruit data
Future deleteAllFruit() async{
  final db = await DbController.instance.database;
  await db.execute('delete from fruits');
}

//query all fruitData
Future<List<Fruit>> getAllFruit()async{
  final db = await DbController.instance.database;
  final List<Map<String, dynamic>> maps = await db.query('fruits');
  final fruitList = List.generate(maps.length, (i) {
    return Fruit(fruitName: maps[i]['fruitName'],
        genus: maps[i]['genus'],
        family: maps[i]['family'],
        carbohydrates: maps[i]['carbohydrates'],
        protein: maps[i]['protein'],
        calories: maps[i]['calories'],
        fat: maps[i]['fat'],
        sugar: maps[i]['sugar'],
        order: maps[i]['ordering']);
  });
  return fruitList;
}

// check if fruit table is empy
Future<bool> checkFruitEmpty()async{
  final db = await DbController.instance.database;
  final List<Map<String, dynamic>> maps = await db.query('fruits');
  return maps.isEmpty;
}

}