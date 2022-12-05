import 'package:cookuy/constants.dart';
import 'package:cookuy/models/recipes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final Recipe recipe;
  const Detail({super.key, required this.recipe});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  String isSaved = "false";

  @override
  void initState() {
    isSaved = widget.recipe.isSaved;
    super.initState();
  }

  void addBookmark(String title, description, creator, thumb, category, times,
      serving, ingredients, direction, isSaved, int categoryId) async {
    try {
      var response = await Dio().put(
          'http://192.168.30.191:8000/api/update_recipe/' +
              widget.recipe.id.toString(),
          data: {
            "title": title,
            "description": description,
            "creator": creator,
            "thumb": thumb,
            "category": category,
            "times": times,
            "serving": serving,
            "ingredients": ingredients,
            "direction": direction,
            "isSaved": isSaved,
            "category_id": categoryId
          });
      if (response.data.length > 0) {
        print("Bookmark added successfully");
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 360,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.recipe.thumb),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: white,
                      size: 45,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.recipe.title,
                              style: TextStyle(
                                fontFamily: 'OpenSans-Bold',
                                fontSize: 24,
                                color: semiBlack,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              widget.recipe.creator,
                              style: TextStyle(
                                fontFamily: 'OpenSans-Regular',
                                fontSize: 14,
                                color: lightGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: extraLightGreen,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            widget.recipe.times,
                            style: TextStyle(
                              fontFamily: 'OpenSans-Medium',
                              fontSize: 14,
                              color: semiBlack,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/images/plate_icon.png"),
                        )),
                      ),
                      SizedBox(width: 2),
                      Text(
                        widget.recipe.serving,
                        style: TextStyle(
                          fontFamily: 'OpenSans-SemiBold',
                          fontSize: 14,
                          color: semiBlack,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.recipe.description,
                    style: TextStyle(
                      fontFamily: 'OpenSans-Regular',
                      fontSize: 14,
                      color: lightGrey,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Ingredients",
                    style: TextStyle(
                      fontFamily: 'OpenSans-SemiBold',
                      fontSize: 14,
                      color: semiBlack,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.recipe.ingredients,
                    style: TextStyle(
                      fontFamily: 'OpenSans-Regular',
                      fontSize: 14,
                      color: lightGrey,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Direction",
                    style: TextStyle(
                      fontFamily: 'OpenSans-SemiBold',
                      fontSize: 14,
                      color: semiBlack,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.recipe.direction,
                    style: TextStyle(
                      fontFamily: 'OpenSans-Light',
                      fontSize: 14,
                      color: lightGrey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (isSaved == "true") {
              isSaved = "false";
            } else {
              isSaved = "true";
            }
            addBookmark(
                widget.recipe.title,
                widget.recipe.description,
                widget.recipe.creator,
                widget.recipe.thumb,
                widget.recipe.categoryId,
                widget.recipe.times,
                widget.recipe.serving,
                widget.recipe.ingredients,
                widget.recipe.direction,
                isSaved,
                widget.recipe.categoryId);
          });
        },
        child: Icon(Icons.bookmark,
            color: isSaved == "false" ? extraLightGrey : lightGreen),
        elevation: 2,
        backgroundColor: white,
      ),
    );
  }
}
