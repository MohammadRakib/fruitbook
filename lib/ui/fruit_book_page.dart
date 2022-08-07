import 'package:flutter/material.dart';
import 'package:fruitbook/model/fruit.dart';

class FruitBookPage extends StatelessWidget {

  Fruit fruit;

  FruitBookPage({Key? key, required this.fruit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize1 = 35.0;
    double fontSize2 = 30.0;
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('Fruit Information'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
              child: Text(fruit.fruitName,
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              )
            ),

            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                    Text('Genus:',
                    style: TextStyle(
                      fontSize: fontSize1,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown
                    ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(fruit.genus,
                      style: TextStyle(
                          fontSize: fontSize2,
                          color: Colors.brown,
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text('Family:',
                    style: TextStyle(
                        fontSize: fontSize1,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(fruit.family,
                      style: TextStyle(
                        fontSize: fontSize2,
                        color: Colors.brown,
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text('Order:',
                    style: TextStyle(
                        fontSize: fontSize1,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(fruit.order,
                      style: TextStyle(
                        fontSize: fontSize2,
                        color: Colors.brown,
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text('Carbohydrates:',
                    style: TextStyle(
                        fontSize: fontSize1,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(fruit.carbohydrates.toString(),
                      style: TextStyle(
                        fontSize: fontSize2,
                        color: Colors.brown,
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text('Protein:',
                    style: TextStyle(
                        fontSize: fontSize1,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(fruit.protein.toString(),
                      style: TextStyle(
                        fontSize: fontSize2,
                        color: Colors.brown,
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text('Fat:',
                    style: TextStyle(
                        fontSize: fontSize1,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(fruit.fat.toString(),
                      style: TextStyle(
                        fontSize: fontSize2,
                        color: Colors.brown,
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text('Calories:',
                    style: TextStyle(
                        fontSize: fontSize1,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(fruit.calories.toString(),
                      style: TextStyle(
                        fontSize: fontSize2,
                        color: Colors.brown,
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text('Sugar:',
                    style: TextStyle(
                        fontSize: fontSize1,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(fruit.sugar.toString(),
                      style: TextStyle(
                        fontSize: fontSize2,
                        color: Colors.brown,
                      ),
                    ),
                  )
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
