class OrderedItemModel {
  String image;
  String name;
  String shortDescription;
  String rating;
  String ratingCount;
  String price;
  String offerPrice;
  String deliveryFee;
  String orderType;
  int quantityInCart;
  DateTime deliveryDate;
  String discount;
  OrderedItemModel({
    required this.image,
    required this.name,
    required this.discount,
    required this.shortDescription,
    required this.rating,
    required this.ratingCount,
    required this.price,
    required this.deliveryFee,
    required this.offerPrice,
    required this.orderType,
    required this.quantityInCart,
    required this.deliveryDate,
  });
}

class OrderTypes {
  static String active = "active";
  static String eligibleForReturn = "eligibleForReturn";
  static String completed = "completed";
}
