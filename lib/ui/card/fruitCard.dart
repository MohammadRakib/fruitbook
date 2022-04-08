import 'package:flutter/material.dart';
import 'package:fruitbook/model/fruit.dart';

class FruitCard extends StatelessWidget {

  Fruit fruit;

  FruitCard({Key? key, required this.fruit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(fruit.fruitName,
              style: const TextStyle(
                color: Colors.brown,
              ),
            ),
          ),
          title: Text('carbohydrates: ${fruit.carbohydrates}, calories: ${fruit.calories}'),
          subtitle: Text('protein: ${fruit.protein}, sugar: ${fruit.sugar}, fat: ${fruit.fat}'),
        ),
      ),
    );
  }
}
