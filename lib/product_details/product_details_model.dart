import 'package:get/get.dart';

class ProductVariantListingModel {
  String name;
  String value;
  String numberOfOptions;
  ProductVariantListingModel(
      {required this.name, required this.value, required this.numberOfOptions});
}

class HightLightsModel {
  String text;
  String value;
  HightLightsModel({required this.text, required this.value});
}

class SpecificationModel {
  String text;
  String value;
  SpecificationModel({required this.text, required this.value});
}

class BuyTogetherProductModel {
  String image;
  String name;
  String actualPrice;
  String offerPrice;
  String discount;
  RxBool isInCart;
  BuyTogetherProductModel({
    required this.image,
    required this.name,
    required this.actualPrice,
    required this.offerPrice,
    required this.discount,
    required this.isInCart,
  });
}
