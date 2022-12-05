class Category {
  final int id;
  final String category;

  Category({
    required this.id,
    required this.category,
  });

  factory Category.fromJSON(Map parsedJson) {
    return Category(
      id: parsedJson['id'], 
      category: parsedJson['category']
    );
  }
}
