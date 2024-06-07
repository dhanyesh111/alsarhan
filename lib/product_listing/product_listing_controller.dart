import 'package:alsarhan/product_listing/product_listing_model.dart';
import 'package:get/get.dart';

class ProductListingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductListingController());
  }
}

class ProductListingController extends GetxController {
  static ProductListingController get to => Get.find();
  List<CategoryModelForProductListingModel> categoryList = [
    CategoryModelForProductListingModel(
      image:
          'https://rukminim2.flixcart.com/image/850/1000/xif0q/mobile/z/1/c/-original-imagt5uhcnfy66wa.jpeg?q=90&crop=false',
      text: "Mobile",
    ),
    CategoryModelForProductListingModel(
      image:
          'https://rukminim2.flixcart.com/image/850/1000/xif0q/mobile/z/1/c/-original-imagt5uhcnfy66wa.jpeg?q=90&crop=false',
      text: "Head Phone",
    ),
    CategoryModelForProductListingModel(
      image:
          'https://rukminim2.flixcart.com/image/850/1000/xif0q/mobile/z/1/c/-original-imagt5uhcnfy66wa.jpeg?q=90&crop=false',
      text: "Home Appliance ",
    ),
    CategoryModelForProductListingModel(
      image:
          'https://rukminim2.flixcart.com/image/850/1000/xif0q/mobile/z/1/c/-original-imagt5uhcnfy66wa.jpeg?q=90&crop=false',
      text: "Laptop",
    ),
  ];

  List<ProductItemModel> products = [
    ProductItemModel(
      name: "Motorola g14(Steel Gray,64Gb)",
      shortDescription: "Snap Dragon",
      rating: "4.9",
      ratingCount: "7,67,567",
      quantityInCart: 1,
      price: "5896",
      isInCart: false.obs,
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
    ProductItemModel(
      name: "Motorola g14(Steel Gray,64Gb)",
      shortDescription: "Snap Dragon",
      rating: "4.9",
      ratingCount: "7,67,567",
      quantityInCart: 1,
      price: "5896",
      isInCart: false.obs,
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
    ProductItemModel(
      name: "Motorola g14(Steel Gray,64Gb)",
      shortDescription: "Snap Dragon",
      rating: "4.9",
      ratingCount: "7,67,567",
      quantityInCart: 1,
      price: "5896",
      isInCart: false.obs,
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
    ProductItemModel(
      name: "Motorola g14(Steel Gray,64Gb)",
      shortDescription: "Snap Dragon",
      rating: "4.9",
      ratingCount: "7,67,567",
      quantityInCart: 1,
      price: "5896",
      isInCart: false.obs,
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
    ProductItemModel(
      name: "Motorola g14(Steel Gray,64Gb)",
      shortDescription: "Snap Dragon",
      rating: "4.9",
      ratingCount: "7,67,567",
      quantityInCart: 1,
      price: "5896",
      isInCart: false.obs,
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
    ProductItemModel(
      name: "Motorola g14(Steel Gray,64Gb)",
      shortDescription: "Snap Dragon",
      rating: "4.9",
      ratingCount: "7,67,567",
      quantityInCart: 1,
      price: "5896",
      isInCart: false.obs,
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
  ];
}
