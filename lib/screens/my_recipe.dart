import 'package:cookuy/constants.dart';
import 'package:cookuy/models/recipes.dart';
import 'package:cookuy/models/users.dart';
import 'package:cookuy/screens/update_recipe.dart';
import 'package:cookuy/services/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyRecipe extends StatefulWidget {
  final User user;
  const MyRecipe({super.key, required this.user});

  @override
  State<MyRecipe> createState() => _MyRecipeState();
}

class _MyRecipeState extends State<MyRecipe> {
  void delete(String id) async {
    try {
      var response =
          await Dio().delete('http://192.168.30.191:8000/api/recipe/' + id);
      if (response.data.length > 0) {
        print("Delete success");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Text(
          "My Recipe",
          style: TextStyle(
              fontFamily: 'OpenSans-Bold', color: semiBlack, fontSize: 18),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              Icons.keyboard_arrow_left,
              color: semiBlack,
              size: 30,
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: FutureBuilder<List<Recipe>>(
            future: Service.fetchRecipesBasedCreator(widget.user.name),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateRecipe(
                                      recipe: Recipe(
                                          id: int.parse(
                                              "${snapshot.data?[index].id}"),
                                          title:
                                              "${snapshot.data?[index].title}",
                                          description:
                                              "${snapshot.data?[index].description}",
                                          creator:
                                              "${snapshot.data?[index].creator}",
                                          thumb:
                                              "${snapshot.data?[index].thumb}",
                                          categoryId: int.parse(
                                              "${snapshot.data?[index].categoryId}"),
                                          times:
                                              "${snapshot.data?[index].times}",
                                          serving:
                                              "${snapshot.data?[index].serving}",
                                          ingredients:
                                              "${snapshot.data?[index].ingredients}",
                                          direction:
                                              "${snapshot.data?[index].direction}",
                                          isSaved:
                                              "${snapshot.data?[index].isSaved}"))));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Material(
                                borderRadius: BorderRadius.circular(8),
                                elevation: 3,
                                child: Container(
                                  height: 170,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "${snapshot.data?[index].thumb}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "${snapshot.data?[index].title}",
                                        style: TextStyle(
                                          fontFamily: 'OpenSans-SemiBold',
                                          fontSize: 16,
                                          color: semiBlack,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        "${snapshot.data?[index].times}",
                                        style: TextStyle(
                                          fontFamily: 'OpenSans-Regular',
                                          fontSize: 14,
                                          color: lightGreen,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => UpdateRecipe(
                                                      recipe: Recipe(
                                                          id: int.parse(
                                                              "${snapshot.data?[index].id}"),
                                                          title:
                                                              "${snapshot.data?[index].title}",
                                                          description:
                                                              "${snapshot.data?[index].description}",
                                                          creator:
                                                              "${snapshot.data?[index].creator}",
                                                          thumb:
                                                              "${snapshot.data?[index].thumb}",
                                                          categoryId: int.parse(
                                                              "${snapshot.data?[index].categoryId}"),
                                                          times:
                                                              "${snapshot.data?[index].times}",
                                                          serving:
                                                              "${snapshot.data?[index].serving}",
                                                          ingredients:
                                                              "${snapshot.data?[index].ingredients}",
                                                          direction:
                                                              "${snapshot.data?[index].direction}",
                                                          isSaved:
                                                              "${snapshot.data?[index].isSaved}"))));
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          color: lightGreen,
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      GestureDetector(
                                          onTap: () {
                                            delete(
                                                "${snapshot.data?[index].id}");
                                          },
                                          child: Icon(Icons.delete,
                                              color: lightGreen))
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }
            }),
      ),
    );
  }
}
