class Recipe {
  final int id;
  final String title;
  final String imageUrl;
  final String description;
  final int servings;
  final int readyInMinutes;
  final int ingredientsNumber;
  final List<Map<String, dynamic>> ingredientsList;
  final List<Map<String, dynamic>> steps;

  Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.servings,
    required this.readyInMinutes,
    required this.ingredientsList,
    required this.ingredientsNumber,
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
      ingredientsList: json['extendedIngredients'].cast<Map<String, dynamic>>(),
      ingredientsNumber: json['extendedIngredients'].length,
      steps:
          json['analyzedInstructions'][0]['steps'].cast<Map<String, dynamic>>(),
    );
  }
}
