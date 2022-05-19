import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:pizca_de_sal/src/classes/ingredient.dart';

class ImageDetectorApi {
  static Future<List<Ingredient>> processImage(File imageFile) async {
    // return Future.delayed(Duration(seconds: 1), () {
    //   return ['apple', 'banana', 'orange']
    //       .map((ing) => Ingredient(name: ing, image: ""))
    //       .toList();
    // });

    final uri = Uri.parse("http://10.0.2.2:4000/processing");

    final request = http.MultipartRequest("POST", uri);

    final multipartFile = http.MultipartFile.fromBytes(
        "image", imageFile.readAsBytesSync(),
        filename: "image.jpg");

    request.files.add(multipartFile);

    var response = await request.send();
    print(response.statusCode);

    final body = jsonDecode(await response.stream.bytesToString());

    final List<String> recipes = body['ingredients'];

    return recipes.map<Ingredient>((recipe) {
      return Ingredient(name: recipe, image: "");
    }).toList();
  }
}
