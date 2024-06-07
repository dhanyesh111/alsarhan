class PopularStoresModel {
  String image;
  String text;
  PopularStoresModel({required this.image, required this.text});
}

class ExclusiveDealsModel {
  String image;
  String text;
  String discountPercent;
  ExclusiveDealsModel({
    required this.image,
    required this.text,
    required this.discountPercent,
  });
}

class SuggestedForYouModel {
  String image;
  String text;
  String discountPercent;
  SuggestedForYouModel({
    required this.image,
    required this.text,
    required this.discountPercent,
  });
}

class ExploreTheBestModel {
  String image;
  String text;
  String price;
  ExploreTheBestModel({
    required this.image,
    required this.text,
    required this.price,
  });
}
