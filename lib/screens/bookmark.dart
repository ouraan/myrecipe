import 'package:cookuy/constants.dart';
import 'package:cookuy/models/recipes.dart';
import 'package:cookuy/screens/detail.dart';
import 'package:cookuy/services/services.dart';
import 'package:flutter/material.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Text(
          "Saved Recipe",
          style: TextStyle(
              fontFamily: 'OpenSans-Bold', color: semiBlack, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: FutureBuilder<List<Recipe>>(
          future: Service.fetchRecipesBasedBookmark(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return GridView.builder(
                  itemCount: snapshot.data?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 15,
                  ),
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
                                        title: "${snapshot.data?[index].title}",
                                        description:
                                            "${snapshot.data?[index].description}",
                                        creator:
                                            "${snapshot.data?[index].creator}",
                                        thumb: "${snapshot.data?[index].thumb}",
                                        categoryId: int.parse(
                                            "${snapshot.data?[index].categoryId}"),
                                        times: "${snapshot.data?[index].times}",
                                        serving:
                                            "${snapshot.data?[index].serving}",
                                        ingredients:
                                            "${snapshot.data?[index].ingredients}",
                                        direction:
                                            "${snapshot.data?[index].direction}",
                                        isSaved:
                                            "${snapshot.data?[index].isSaved}"))));
                      },
                      child: SavedCard(
                        imgUrl: "${snapshot.data?[index].thumb}",
                        title: "${snapshot.data?[index].title}",
                        times: "${snapshot.data?[index].times}",
                      ),
                    );
                  },
                );
              }
            }
          },
        ),
      ),
    );
  }
}

class SavedCard extends StatelessWidget {
  final String imgUrl, title, times;
  const SavedCard(
      {Key? key,
      required this.imgUrl,
      required this.title,
      required this.times})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(imgUrl), fit: BoxFit.cover)),
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
          times,
          style: TextStyle(
            fontFamily: 'OpenSans-Regular',
            fontSize: 14,
            color: lightGreen,
          ),
        ),
      ],
    );
  }
}
