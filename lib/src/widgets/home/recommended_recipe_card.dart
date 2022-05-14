import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizca_de_sal/src/classes/recipe.dart';

class RecommendedRecipeCard extends StatelessWidget {
  const RecommendedRecipeCard({
    required this.recipe,
    this.recipeRating,
    Key? key,
  }) : super(key: key);

  final Recipe recipe;
  final String? recipeRating;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(0),
      semanticContainer: false,
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        splashColor: Colors.black54.withOpacity(0.3),
        child: Ink(
            width: 220,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                recipe.imageUrl,
              ),
              fit: BoxFit.cover,
            )),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(100, 0, 0, 0),
                  backgroundBlendMode: BlendMode.multiply),
              child: Stack(children: [
                _starRating(context),
                _likeButton(),
                _recipeInfo(context),
              ]),
            )),
      ),
    );
  }

  Positioned _starRating(BuildContext context) {
    return Positioned(
      top: 12,
      left: 12,
      child: Row(children: [
        const FaIcon(
          FontAwesomeIcons.star,
          color: Colors.white,
          size: 14,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(recipeRating ?? '4.${Random().nextInt(10)}',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w500)),
      ]),
    );
  }

  Positioned _likeButton() {
    return Positioned(
        child: Material(
          type: MaterialType.circle,
          color: Colors.transparent,
          child: IconButton(
              onPressed: () {
                print('Like');
              },
              iconSize: 14,
              splashRadius: 14,
              constraints: const BoxConstraints(minHeight: 38, minWidth: 38),
              padding: const EdgeInsets.all(4),
              icon: const FaIcon(FontAwesomeIcons.heart, color: Colors.white)),
        ),
        top: 0,
        right: 0);
  }

  Positioned _recipeInfo(BuildContext context) {
    return Positioned(
        bottom: 12,
        left: 12,
        right: 12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(recipe.title,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.clock,
                  color: Colors.white,
                  size: 14,
                ),
                const SizedBox(width: 8),
                Text(recipe.readyInMinutes.toString() + ' min',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ));
  }
}
