import 'package:cookuy/constants.dart';
import 'package:cookuy/models/recipes.dart';
import 'package:cookuy/models/users.dart';
import 'package:cookuy/screens/add_recipe.dart';
import 'package:cookuy/screens/category.dart';
import 'package:cookuy/screens/detail.dart';
import 'package:cookuy/services/services.dart';
import 'package:flutter/material.dart';

class BodyHome extends StatefulWidget {
  final User user;
  const BodyHome({super.key, required this.user});

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              "Good Food",
              style: TextStyle(
                fontFamily: 'OpenSans-Medium',
                fontSize: 16,
                color: lightGrey,
              ),
            ),
            SizedBox(height: 3),
            Text(
              "Special For You",
              style: TextStyle(
                fontFamily: 'OpenSans-Bold',
                fontSize: 24,
                color: lightGreen,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddRecipe(
                                    user: widget.user,
                                  )));
                    },
                    child: RecipeCat(
                        imgUrl: "assets/images/plus.png",
                        category: "Add recipe"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Category(category: "Fried")));
                    },
                    child: RecipeCat(
                        imgUrl: "assets/images/tempura.png", category: "Fried"),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Category(category: "Soup")));
                      },
                      child: RecipeCat(
                          imgUrl: "assets/images/soup.png", category: "Soup")),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Category(category: "Drink")));
                    },
                    child: RecipeCat(
                        imgUrl: "assets/images/juice.png", category: "Drink"),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Category(category: "Cake")));
                      },
                      child: RecipeCat(
                          imgUrl: "assets/images/cake.png", category: "Cake"))
                ],
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 220,
              child: FutureBuilder<List<Recipe>>(
                  future: Service.fetchRecipes(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        return ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
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
                              child: RecommendCard(
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
            SizedBox(height: 20),
            Text(
              "All Recipes",
              style: TextStyle(
                fontFamily: 'OpenSans-Bold',
                fontSize: 19,
                color: semiBlack,
              ),
            ),
            FutureBuilder<List<Recipe>>(
                future: Service.fetchRecipes(),
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
          ],
        ),
      ),
    );
  }
}

class RecipeCat extends StatelessWidget {
  final String imgUrl, category;
  const RecipeCat({Key? key, required this.imgUrl, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: extraLightGreen,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Image.asset(imgUrl),
        ),
        SizedBox(height: 4),
        Text(
          category,
          style: TextStyle(
            fontFamily: 'OpenSans-Regular',
            fontSize: 12,
            color: darkGrey,
          ),
        ),
      ],
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String imageUrl, title, est;
  const RecipeCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.est})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'OpenSans-SemiBold',
              fontSize: 16,
              color: semiBlack,
            ),
          ),
          SizedBox(height: 2),
          Text(
            est,
            style: TextStyle(
              fontFamily: 'OpenSans-Regular',
              fontSize: 14,
              color: lightGreen,
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendCard extends StatelessWidget {
  final String imageUrl, title, est;
  const RecommendCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.est})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: BorderRadius.circular(8),
            elevation: 3,
            child: Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'OpenSans-SemiBold',
              fontSize: 16,
              color: semiBlack,
            ),
          ),
          SizedBox(height: 2),
          Text(
            est,
            style: TextStyle(
              fontFamily: 'OpenSans-Regular',
              fontSize: 14,
              color: lightGreen,
            ),
          ),
        ],
      ),
    );
  }
}
