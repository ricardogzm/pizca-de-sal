import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizca_de_sal/src/classes/recipe.dart';
import 'package:pizca_de_sal/src/widgets/ui/titled_section.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({required this.recipe, Key? key}) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        leading: const OwnIconButton(),
        leadingWidth: 60,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          // Gets status bar height
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          _imageAndGeneralInfo(context),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitledSection(
                  title: "Ingredients",
                  child:
                      SizedBox(height: 180, child: _ingredientsList(context)),
                ),
                TitledSection(title: "Steps", child: _stepsList(context)),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
        ]),
      ),
    );
  }

  SizedBox _imageAndGeneralInfo(BuildContext context) {
    return SizedBox(
      height: 380,
      child: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              clipBehavior: Clip.antiAlias,
              height: 300,
              child: Image.network(
                recipe.imageUrl,
                fit: BoxFit.cover,
              )),
        ),
        Positioned(
          bottom: 0,
          left: 15,
          right: 15,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3,
            color: Colors.white,
            child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  Text(recipe.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3),
                  const SizedBox(height: 10),
                  Text(recipe.ingredientsNumber.toString() + ' ingredients',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.clock,
                        color: Color(0xFF34D399),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(recipe.readyInMinutes.toString() + ' min',
                          style: Theme.of(context).textTheme.headline6),
                      const SizedBox(width: 20),
                      const FaIcon(
                        FontAwesomeIcons.fire,
                        color: Color(0xFF34D399),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text('356 kcal',
                          style: Theme.of(context).textTheme.headline6),
                      const SizedBox(width: 20),
                      const FaIcon(
                        FontAwesomeIcons.bowlFood,
                        color: Color(0xFF34D399),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(recipe.servings.toString() + ' servings',
                          style: Theme.of(context).textTheme.headline6),
                    ],
                  )
                ])),
          ),
        ),
      ]),
    );
  }

  // Create a function that returns a ListView of the ingredients
  ListView _ingredientsList(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      itemCount: recipe.ingredientsNumber,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final ingredient = recipe.ingredientsList[index];

        return SizedBox(
          width: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                margin: const EdgeInsets.all(0),
                child: Container(
                  height: 90,
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Image.network(
                      "https://spoonacular.com/cdn/ingredients_100x100/" +
                          ingredient['image'],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(StringUtils.capitalize(ingredient['name'], allWords: true),
                  style: Theme.of(context).textTheme.headline5),
              Text(
                ingredient['amount'].toStringAsFixed(2) +
                    ' ' +
                    ingredient['unit'],
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        width: 16,
      ),
    );
  }

  // Implement _stepsList as a function that returns a Column of the steps
  Column _stepsList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: recipe.steps.map((step) {
        return Card(
            margin: EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
            clipBehavior: Clip.antiAlias,
            child: Container(
              width: double.infinity,
              // height: 100,
              color: Theme.of(context).primaryColorLight,
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Step ' + step['number'].toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: Theme.of(context).primaryColorDark),
                    ),
                    const SizedBox(height: 10),
                    Text(step['step'],
                        style: Theme.of(context).textTheme.bodyText1),
                  ]),
            ));
      }).toList(),
    );
  }
}

class OwnIconButton extends StatelessWidget {
  const OwnIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        type: MaterialType.button,
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        color: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            color: Colors.white.withOpacity(0.6),
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.chevronLeft),
              color: Colors.black,
              iconSize: 16,
              padding: const EdgeInsets.all(0),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ),
    );
  }
}
