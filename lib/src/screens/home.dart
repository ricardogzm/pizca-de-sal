import 'package:flutter/material.dart';
import 'package:pizca_de_sal/src/classes/recipe.dart';
import 'package:pizca_de_sal/src/api/spoonacular_api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizca_de_sal/src/widgets/home/recommended_recipe_card.dart';
import 'package:pizca_de_sal/src/widgets/ui/titled_section.dart';

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
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: const [
            TitledSection(
                title: "Recommended",
                child:
                    SizedBox(height: 320, child: RecommendedRecipesBuilder()))
          ]),
    );
  }
}

class RecommendedRecipesBuilder extends StatelessWidget {
  const RecommendedRecipesBuilder({
    Key? key,
  }) : super(key: key);

  // late final _futureRecipes = SpoonacularApi.localRecipes();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recipe>>(
        future: SpoonacularApi.localRecipes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Recipe> recipes = snapshot.data!;

            return ListView.separated(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
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
