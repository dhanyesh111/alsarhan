class CategoryItemModel {
  String image;
  String text;
  CategoryItemModel({
    required this.image,
    required this.text,
  });
}

class CategoryListingModel {
  String text;
  List<CategoryItemModel> items;
  CategoryListingModel({
    required this.items,
    required this.text,
  });
}
