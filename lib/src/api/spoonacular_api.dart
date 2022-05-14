import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pizca_de_sal/src/classes/recipe.dart';

class SpoonacularApi {
  static final String apiKey = dotenv.get("SPOONACULAR_API_KEY");
  static const String baseUrl = 'api.spoonacular.com';

  static Future<dynamic> get(String url, Map<String, dynamic>? params) async {
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

  static Future<List<Recipe>> fetchRandomRecipes(int number) async {
    final jsonResponse = await get('random', {
      'number': number.toString(),
      // 'tags': 'vegetarian',
    });

    final List recipes = jsonResponse['recipes'];

    return recipes.map<Recipe>((recipe) {
      print(recipe['id'].toString() + " | " + recipe['title']);
      return Recipe.fromJson(recipe);
    }).toList();
  }
}
