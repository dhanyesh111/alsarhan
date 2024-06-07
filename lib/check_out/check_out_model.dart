class ProductItemCheckOutModel {
  String image;
  String name;
  String shortDescription;
  String rating;
  String ratingCount;
  String price;
  String offerPrice;
  String deliveryFee;

  int quantityInCart;
  DateTime deliveryDate;
  String discount;

  List<String> specifications;
  ProductItemCheckOutModel({
    required this.image,
    required this.name,
    required this.discount,
    required this.shortDescription,
    required this.specifications,
    required this.rating,
    required this.ratingCount,
    required this.price,
    required this.deliveryFee,
    required this.offerPrice,
    required this.quantityInCart,
    required this.deliveryDate,
  });
}
