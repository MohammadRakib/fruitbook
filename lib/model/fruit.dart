class Fruit{
  String fruitName;
  dynamic protein;
  dynamic carbohydrates;
  dynamic calories;
  dynamic fat;
  dynamic sugar;

  Fruit({required this.fruitName, required this.carbohydrates, required this.protein, required this.calories,
      required this.fat, required this.sugar});

  Map<String, dynamic> toMap() {
    return {
      'fruitName': fruitName,
      'carbohydrates': carbohydrates,
      'protein': protein,
      'calories': calories,
      'fat': fat,
      'sugar': sugar,
    };
  }

  @override
  String toString() {
    return 'Fruit{fruitName: $fruitName, protein: $protein, carbohydrates: $carbohydrates, calories: $calories, fat: $fat, sugar: $sugar}';
  }

}