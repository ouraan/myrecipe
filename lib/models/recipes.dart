class Recipe {
  final int id, categoryId;
  final String title, 
      description,
      creator,
      thumb,
      times,
      serving,
      ingredients,
      direction,
      isSaved;

  Recipe(
      {required this.id,
      required this.title,
      required this.description,
      required this.creator,
      required this.thumb,
      required this.categoryId,
      required this.times,
      required this.serving,
      required this.ingredients,
      required this.direction,
      required this.isSaved});

  factory Recipe.fromJSON(Map parsedJson) {
    return Recipe(
        id: parsedJson['id'],
        title: parsedJson['title'],
        description: parsedJson['description'],
        creator: parsedJson['creator'],
        thumb: parsedJson['thumb'],
        categoryId: parsedJson['category_id'],
        times: parsedJson['times'],
        serving: parsedJson['serving'],
        ingredients: parsedJson['ingredients'],
        direction: parsedJson['direction'],
        isSaved: parsedJson['isSaved']);
  }
}
