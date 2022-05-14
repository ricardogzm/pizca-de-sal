class Recipe {
  final int id;
  final String title;
  final String imageUrl;
  final String description;
  final int servings;
  final int readyInMinutes;
  final List<dynamic> ingredients;
  final List<dynamic> steps;

  Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.servings,
    required this.readyInMinutes,
    required this.ingredients,
    required this.steps,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      imageUrl:
          'https://spoonacular.com/recipeImages/${json['id']}-636x393.jpg',
      description: json['summary'],
      servings: json['servings'],
      readyInMinutes: json['readyInMinutes'],
      ingredients: json['extendedIngredients'],
      steps: json['analyzedInstructions'][0]['steps'],
    );
  }
}
