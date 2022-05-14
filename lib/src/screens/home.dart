import 'package:flutter/material.dart';
import 'package:pizca_de_sal/src/classes/recipe.dart';
import 'package:pizca_de_sal/src/api/spoonacular_api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizca_de_sal/src/widgets/home/recommended_recipe_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Hello, Ricardo'),
          leading: IconButton(
            iconSize: 20,
            splashRadius: 20,
            icon: const FaIcon(FontAwesomeIcons.bars),
            onPressed: () => {},
          )),
      body: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(16),
          children: [
            _recommendedRecipesSection(context),
          ]),
    );
  }

  Column _recommendedRecipesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recommended", style: Theme.of(context).textTheme.headline3),
        const SizedBox(height: 16),
        // ListView container
        const SizedBox(
          height: 320,
          child: RecommendedRecipesBuilder(),
        ),
      ],
    );
  }
}

class RecommendedRecipesBuilder extends StatelessWidget {
  const RecommendedRecipesBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recipe>>(
        future: SpoonacularApi.fetchRandomRecipes(10),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Recipe> recipes = snapshot.data!;

            return ListView.separated(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];

                return RecommendedRecipeCard(
                  recipe: recipe,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 16,
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return const Center(
            child: SizedBox(
                height: 50, width: 50, child: CircularProgressIndicator()),
          );
        });
  }
}
