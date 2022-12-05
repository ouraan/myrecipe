import 'package:cookuy/constants.dart';
import 'package:cookuy/models/recipes.dart';
import 'package:cookuy/screens/components/home_body.dart';
import 'package:cookuy/screens/detail.dart';
import 'package:cookuy/services/services.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  final String category;
  const Category({super.key, required this.category});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Text(
          widget.category,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: FutureBuilder<List<Recipe>>(
            future: Service.fetchRecipesBasedCategory(widget.category),
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
                                  builder: (context) => Detail(
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
                        child: RecipeCard(
                            imageUrl: "${snapshot.data?[index].thumb}",
                            title: "${snapshot.data?[index].title}",
                            est: "${snapshot.data?[index].times}"),
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
