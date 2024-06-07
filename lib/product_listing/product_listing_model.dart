import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CategoryModelForProductListingModel {
  String image;
  String text;
  CategoryModelForProductListingModel({
    required this.image,
    required this.text,
  });
}

class ProductItemModel {
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
  RxBool isInCart;
  List<String> specifications;
  ProductItemModel({
    required this.image,
    required this.name,
    required this.discount,
    required this.shortDescription,
    required this.specifications,
    required this.isInCart,
    required this.rating,
    required this.ratingCount,
    required this.price,
    required this.deliveryFee,
    required this.offerPrice,
    required this.quantityInCart,
    required this.deliveryDate,
  });
}
