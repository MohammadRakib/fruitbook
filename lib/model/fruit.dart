class Fruit{
  String fruitName;
  dynamic genus;
  dynamic family;
  dynamic protein;
  dynamic carbohydrates;
  dynamic calories;
  dynamic fat;
  dynamic sugar;
  dynamic order;

  Fruit({required this.fruitName, required this.genus,
      required this.family, required this.carbohydrates,
      required this.protein, required this.calories,
      required this.fat, required this.sugar, required this.order});

  Map<String, dynamic> toMap() {
    return {
      'fruitName': fruitName,
      'genus': genus,
      'family': family,
      'carbohydrates': carbohydrates,
      'protein': protein,
      'calories': calories,
      'fat': fat,
      'sugar': sugar,
      'ordering': order
    };
  }

  @override
  String toString() {
    return 'Fruit{fruitName: $fruitName, genus: $genus, family: $family, protein: $protein, carbohydrates: $carbohydrates, calories: $calories, fat: $fat, sugar: $sugar, order: $order}';
  }
}