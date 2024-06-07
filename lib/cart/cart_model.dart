class CartItemModel {
  String image;
  String name;
  String shortDescription;
  String rating;
  String ratingCount;
  String price;
  String offerPrice;
  String deliveryFee;
  bool freeDelivery;
  int quantityInCart;
  DateTime deliveryDate;
  String discount;
  CartItemModel({
    required this.image,
    required this.name,
    required this.discount,
    required this.shortDescription,
    required this.rating,
    required this.ratingCount,
    required this.price,
    required this.deliveryFee,
    required this.offerPrice,
    required this.freeDelivery,
    required this.quantityInCart,
    required this.deliveryDate,
  });
}
