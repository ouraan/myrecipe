import 'package:cookuy/models/recipes.dart';
import 'package:cookuy/models/users.dart';
import 'package:cookuy/models/categories.dart';
import 'package:dio/dio.dart';

class Service {
  static Future<List<Recipe>> fetchRecipes() async {
    Response response =
        await Dio().get("http://192.168.30.191:8000/api/recipe");
    List<Recipe> recipes =
        (response.data as List).map((v) => Recipe.fromJSON(v)).toList();
    return recipes;
  }

  static Future<List<Recipe>> fetchRecipesBasedCategory(String category) async {
    Response response =
        await Dio().get("http://192.168.30.191:8000/api/join/" + category);
    List<Recipe> recipes =
        (response.data as List).map((v) => Recipe.fromJSON(v)).toList();
    return recipes;
  }

  static Future<List<User>> fetchUserBasedId(String id) async {
    Response response =
        await Dio().get("http://192.168.30.191:8000/api/user/" + id);
    List<User> users =
        (response.data as List).map((v) => User.fromJSON(v)).toList();
    return users;
  }

  static Future<List<Recipe>> fetchRecipesBasedBookmark() async {
    Response response =
        await Dio().get("http://192.168.30.191:8000/api/recipe/true");
    List<Recipe> recipes =
        (response.data as List).map((v) => Recipe.fromJSON(v)).toList();
    return recipes;
  }

  static Future<List<Recipe>> fetchRecipesBasedCreator(String creator) async {
    Response response = await Dio()
        .get("http://192.168.30.191:8000/api/recipe_creator/" + creator);
    List<Recipe> recipes =
        (response.data as List).map((v) => Recipe.fromJSON(v)).toList();
    return recipes;
  }

  // static Future<List<Category>> getCategory(String category) async {
  //   Response response =
  //       await Dio().get("http://192.168.30.191:8000/api/category/" + category);
  //   List<Category> categories =
  //       (response.data as List).map((v) => Category.fromJSON(v)).toList();
  //   return categories;
  // }
}
