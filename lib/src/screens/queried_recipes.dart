import 'package:flutter/material.dart';
import 'package:pizca_de_sal/src/api/spoonacular_api.dart';
import 'package:pizca_de_sal/src/classes/recipe.dart';

class QueriedRecipesScreen extends StatelessWidget {
  const QueriedRecipesScreen({required this.queriedRecipes, Key? key})
      : super(key: key);

  final Future<List<QueriedRecipe>> queriedRecipes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Queried recipes'),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<QueriedRecipe>>(
        future: queriedRecipes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<QueriedRecipe> recipes = snapshot.data!;

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              clipBehavior: Clip.none,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];

                return QueriedRecipeCard(queriedRecipe: recipe);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 16),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class QueriedRecipeCard extends StatelessWidget {
  const QueriedRecipeCard({
    required this.queriedRecipe,
    Key? key,
  }) : super(key: key);

  final QueriedRecipe queriedRecipe;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () async {
            final recipe =
                await SpoonacularApi.fetchRecipeById(queriedRecipe.id);

            Navigator.pushNamed(context, '/recipeDetails', arguments: recipe);
          },
          child: SizedBox(
            height: 150,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 100,
                  child: Image.network(
                    queriedRecipe.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          queriedRecipe.title,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const SizedBox(height: 4),
                        Text(
                            "${queriedRecipe.usedIngredientsNumber} matching ingredients: ${_ingredientsList(queriedRecipe)}",
                            style: Theme.of(context).textTheme.headline6),
                        const SizedBox(height: 4),
                        Text(
                            "${queriedRecipe.missedIngredientsNumber} missing ingredients: ${_missingIngredientsList(queriedRecipe)}",
                            style: Theme.of(context).textTheme.headline6),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  // Implement a function that receives a recipe and returns a comma separated list of ingredients
  String _ingredientsList(QueriedRecipe recipe) {
    return recipe.usedIngredientsList.map((ingredient) {
      return ingredient['name'];
    }).join(', ');
  }

  // Implement a function that receives a recipe and returns a comma separated list of missing ingredients
  String _missingIngredientsList(QueriedRecipe recipe) {
    return recipe.missedIngredientsList.map((ingredient) {
      return ingredient['name'];
    }).join(', ');
  }
}
