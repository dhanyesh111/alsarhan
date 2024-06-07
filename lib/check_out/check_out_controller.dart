import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'check_out_model.dart';

class CheckOutControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckOutController());
  }
}

class CheckOutController extends GetxController {
  static CheckOutController get to => Get.find();
  List checkOutStates = [1, 2, 3];
  int currentStage = 2;
  RxList<ProductItemCheckOutModel> products = [
    ProductItemCheckOutModel(
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
      image:
          'https://rukminim2.flixcart.com/image/850/1000/xif0q/mobile/z/1/c/-original-imagt5uhcnfy66wa.jpeg?q=90&crop=false',
      specifications: [
        " 4 GB RAM | 128 GB Storage",
        "160.51 cm(6.5 Inch)Full HD+ Display",
        "500 mAh",
        "50MP +MP",
        "8MP Camera",
      ],
    ),
    ProductItemCheckOutModel(
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
      image:
          'https://rukminim2.flixcart.com/image/850/1000/xif0q/mobile/z/1/c/-original-imagt5uhcnfy66wa.jpeg?q=90&crop=false',
      specifications: [
        " 4 GB RAM | 128 GB Storage",
        "160.51 cm(6.5 Inch)Full HD+ Display",
        "500 mAh",
        "50MP +MP",
        "8MP Camera",
      ],
    ),
    ProductItemCheckOutModel(
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
      image:
          'https://rukminim2.flixcart.com/image/850/1000/xif0q/mobile/z/1/c/-original-imagt5uhcnfy66wa.jpeg?q=90&crop=false',
      specifications: [
        " 4 GB RAM | 128 GB Storage",
        "160.51 cm(6.5 Inch)Full HD+ Display",
        "500 mAh",
        "50MP +MP",
        "8MP Camera",
      ],
    ),
    ProductItemCheckOutModel(
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
      image:
          'https://rukminim2.flixcart.com/image/850/1000/xif0q/mobile/z/1/c/-original-imagt5uhcnfy66wa.jpeg?q=90&crop=false',
      specifications: [
        " 4 GB RAM | 128 GB Storage",
        "160.51 cm(6.5 Inch)Full HD+ Display",
        "500 mAh",
        "50MP +MP",
        "8MP Camera",
      ],
    ),
    ProductItemCheckOutModel(
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
      image:
          'https://rukminim2.flixcart.com/image/850/1000/xif0q/mobile/z/1/c/-original-imagt5uhcnfy66wa.jpeg?q=90&crop=false',
      specifications: [
        " 4 GB RAM | 128 GB Storage",
        "160.51 cm(6.5 Inch)Full HD+ Display",
        "500 mAh",
        "50MP +MP",
        "8MP Camera",
      ],
    ),
    ProductItemCheckOutModel(
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
      image:
          'https://rukminim2.flixcart.com/image/850/1000/xif0q/mobile/z/1/c/-original-imagt5uhcnfy66wa.jpeg?q=90&crop=false',
      specifications: [
        " 4 GB RAM | 128 GB Storage",
        "160.51 cm(6.5 Inch)Full HD+ Display",
        "500 mAh",
        "50MP +MP",
        "8MP Camera",
      ],
    ),
  ].obs;
  TextEditingController controllerEmail = TextEditingController();
  List<String> paymentMethod = [
    "Credit/Debit card",
    "Bet Banking",
    "Cash on Delivery"
  ];
  int? expiryMonth;
  int? expiryYear;
  Rx<String?> selectedPaymentMethod = Rx<String?>(null);
  TextEditingController controllerCardNumber = TextEditingController();
}
