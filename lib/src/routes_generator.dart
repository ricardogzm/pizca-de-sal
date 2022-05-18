import 'classes/recipe.dart';
import 'screens/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:pizca_de_sal/src/screens/auth/login.dart';
import 'package:pizca_de_sal/src/screens/recipe_details.dart';
import 'package:pizca_de_sal/src/widgets/layout/main_layout.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MainLayout());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/recipeDetails':
        if (args is Recipe) {
          return MaterialPageRoute(
            builder: (_) => RecipeDetailsScreen(recipe: args),
          );
        }
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
