import 'dart:convert';
import 'package:food_recipe/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi{
  static Future<List<Recipe>> getRecipe() async {
    var url = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',{"limit": "18",
      "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(url, headers: {
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "x-rapidapi-key": "df3eeec069msh9ef1fad125e4b0ap199c07jsnd3ab80e415d1",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for(var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}