import 'package:get/get.dart';

import 'cart_model.dart';

class CartControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}

class CartController extends GetxController {
  static CartController get to => Get.find();
  RxList<CartItemModel> cartItems = [
    CartItemModel(
      name: "Motorola g14(Steel Gray,64Gb)",
      shortDescription: "Snap Dragon",
      rating: "4.9",
      ratingCount: "7,67,567",
      quantityInCart: 1,
      price: "5896",
      offerPrice: "999",
      discount: "86",
      deliveryDate: DateTime.now().add(Duration(days: 2)),
      deliveryFee: "40",
      freeDelivery: true,
      image:
          'https://rukminim2.flixcart.com/image/850/1000/xif0q/mobile/z/1/c/-original-imagt5uhcnfy66wa.jpeg?q=90&crop=false',
    ),
    CartItemModel(
      name: "Motorola g14(Steel Gray,64Gb)",
      shortDescription: "Snap Dragon",
      rating: "4.9",
      ratingCount: "7,67,567",
      quantityInCart: 1,
      price: "5896",
      offerPrice: "999",
      discount: "86",
      deliveryDate: DateTime.now().add(Duration(days: 2)),
      deliveryFee: "40",
      freeDelivery: true,
      image:
          'https://rukminim2.flixcart.com/image/850/1000/xif0q/mobile/z/1/c/-original-imagt5uhcnfy66wa.jpeg?q=90&crop=false',
    ),
    CartItemModel(
      name: "Motorola g14(Steel Gray,64Gb)",
      shortDescription: "Snap Dragon",
      rating: "4.9",
      ratingCount: "7,67,567",
      quantityInCart: 1,
      price: "5896",
      offerPrice: "999",
      discount: "86",
      deliveryDate: DateTime.now().add(Duration(days: 2)),
      deliveryFee: "40",
      freeDelivery: true,
      image:
          'https://rukminim2.flixcart.com/image/850/1000/xif0q/mobile/z/1/c/-original-imagt5uhcnfy66wa.jpeg?q=90&crop=false',
    ),
    CartItemModel(
      name: "Motorola g14(Steel Gray,64Gb)",
      shortDescription: "Snap Dragon",
      rating: "4.9",
      ratingCount: "7,67,567",
      quantityInCart: 1,
      price: "5896",
      offerPrice: "999",
      discount: "86",
      deliveryDate: DateTime.now().add(Duration(days: 2)),
      deliveryFee: "40",
      freeDelivery: true,
      image:
          'https://rukminim2.flixcart.com/image/850/1000/xif0q/mobile/z/1/c/-original-imagt5uhcnfy66wa.jpeg?q=90&crop=false',
    ),
  ].obs;
}
