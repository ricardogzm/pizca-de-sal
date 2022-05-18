import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizca_de_sal/src/api/spoonacular_api.dart';
import 'package:pizca_de_sal/src/classes/ingredient.dart';
import 'package:pizca_de_sal/src/widgets/text_between_lines.dart';
import 'package:pizca_de_sal/src/widgets/ui/titled_section.dart';

class FindRecipesScreen extends StatefulWidget {
  const FindRecipesScreen({Key? key}) : super(key: key);

  @override
  State<FindRecipesScreen> createState() => _FindRecipesScreenState();
}

class _FindRecipesScreenState extends State<FindRecipesScreen> {
  final List<Ingredient> _ingredients = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Find recipes'),
          leading: IconButton(
            iconSize: 20,
            splashRadius: 20,
            icon: const FaIcon(FontAwesomeIcons.bars),
            onPressed: () => {},
          ),
        ),
        body: ListView(padding: const EdgeInsets.all(16), children: [
          TitledSection(
              title: "Enter an ingredient manually",
              child: _ingredientSearchInput()),
          const SizedBox(height: 16),
          TextBetweenLines(
            label: "or",
            indent: 10,
            textStyle: Theme.of(context).textTheme.bodyText1,
            lineColor: Colors.black,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: () {}, child: const Text('Upload an image')),
          const SizedBox(height: 32),
          _selectedIngredientsSection(context)
        ]));
  }

  TitledSection _selectedIngredientsSection(BuildContext context) {
    return TitledSection(
      title: 'Selected ingredients',
      child: Wrap(
          spacing: 16,
          children: _ingredients
              .map((ingredient) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        constraints: const BoxConstraints(
                            minWidth: 20,
                            minHeight: 20,
                            maxWidth: 20,
                            maxHeight: 20),
                        padding: const EdgeInsets.all(0),
                        iconSize: 18,
                        splashRadius: 20,
                        icon: const FaIcon(FontAwesomeIcons.xmark),
                        onPressed: () {
                          setState(() {
                            _ingredients.remove(ingredient);
                          });
                        },
                      ),
                      const SizedBox(width: 4),
                      Text(ingredient.name,
                          style: Theme.of(context).textTheme.headline5),
                    ],
                  )))
              .toList()),
    );
  }

  TypeAheadField<Ingredient> _ingredientSearchInput() {
    return TypeAheadField(
        suggestionsCallback: SpoonacularApi.autocompleteIngredients,
        debounceDuration: const Duration(milliseconds: 500),
        minCharsForSuggestions: 3,
        textFieldConfiguration: const TextFieldConfiguration(
            decoration: InputDecoration(
                labelText: "Type an ingredient...",
                suffixIcon: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 16,
                ))),
        suggestionsBoxDecoration: SuggestionsBoxDecoration(
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.antiAlias,
            elevation: 3),
        itemBuilder: (context, Ingredient? ingredient) {
          return ListTile(
            tileColor: Colors.white,
            title: Text(ingredient!.name),
            leading: Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(5),
              child: Center(
                child: Image.network(
                  SpoonacularApi.getIngredientImage(ingredient.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        onSuggestionSelected: (Ingredient ingredient) {
          for (var ing in _ingredients) {
            if (ing.name == ingredient.name) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ingredient already selected')));

              return;
            }
          }

          setState(() {
            _ingredients.add(ingredient);
          });
        });
  }
}
