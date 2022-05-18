import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pizca_de_sal/src/classes/recipe.dart';
import 'package:pizca_de_sal/src/classes/ingredient.dart';

class SpoonacularApi {
  static final String apiKey = dotenv.get("SPOONACULAR_API_KEY");
  static const String baseUrl = 'api.spoonacular.com';

  static Future<dynamic> recipesGet(
      String url, Map<String, dynamic>? params) async {
    final uri = Uri.https(baseUrl, 'recipes/$url', params);

    final response = await http.get(
      uri,
      headers: {
        'Accept': 'application/json',
        'charset': 'utf-8',
        'x-api-key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }

    throw Exception('Failed to load data');
  }

  static Future<dynamic> ingredientsGet(
      String url, Map<String, dynamic>? params) async {
    final uri = Uri.https(baseUrl, 'food/ingredients/$url', params);

    final response = await http.get(
      uri,
      headers: {
        'Accept': 'application/json',
        'charset': 'utf-8',
        'x-api-key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }

    throw Exception('Failed to load data');
  }

  static Future<List<Recipe>> fetchRandomRecipes(int number) async {
    final jsonResponse = await recipesGet('random', {
      'number': number.toString(),
      // 'tags': 'vegetarian',
    });

    final List recipes = jsonResponse['recipes'];

    return recipes.map<Recipe>((recipe) {
      print(recipe['id'].toString() + " | " + recipe['title']);
      return Recipe.fromJson(recipe);
    }).toList();
  }

  static Future<List<Ingredient>> autocompleteIngredients(String query) async {
    final jsonResponse = await ingredientsGet('autocomplete', {
      'query': query,
      'number': "5",
    });

    final List ingredients = jsonResponse;

    return ingredients.map<Ingredient>((ingredient) {
      final ing = Ingredient.fromJson(ingredient);
      print(ing.name + " | " + ing.image);

      return ing;
    }).toList();
  }

  // This is for testing purposes
  // TODO: Remove this
  static Future<List<Recipe>> localRecipes() async {
    print("Fetching local recipes");
    final response = await rootBundle.loadString('assets/random_recipes.json');

    print("Decoding local recipes");
    final jsonResponse = await json.decode(response);

    final List recipes = jsonResponse['recipes'];

    return recipes.map<Recipe>((recipe) {
      print(recipe['id'].toString() + " | " + recipe['title']);
      return Recipe.fromJson(recipe);
    }).toList();
  }

  static String getIngredientImage(String ingredient) {
    return "https://spoonacular.com/cdn/ingredients_100x100/$ingredient";
  }
}
