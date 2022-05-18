class Ingredient {
  final String name;
  final String image;

  Ingredient({
    required this.name,
    required this.image,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      image: json['image'],
    );
  }
}
