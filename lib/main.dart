import 'package:flutter/services.dart';

import 'src/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/providers/theme_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pizca_de_sal/src/routes_generator.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemStatusBarContrastEnforced: true,
    systemNavigationBarColor: Colors.white.withOpacity(0.8),
    systemNavigationBarContrastEnforced: true,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeManager()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: context.watch<ThemeManager>().currentTheme,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
