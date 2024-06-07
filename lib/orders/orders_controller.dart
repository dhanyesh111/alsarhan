import 'package:get/get.dart';

import 'orders_model.dart';

class OrderControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrdersController());
  }
}

class OrdersController extends GetxController {
  static OrdersController get to => Get.find();
  List<OrderedItemModel> orderedItems = [
    OrderedItemModel(
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
      orderType: OrderTypes.active,
      image:
          'https://rukminim2.flixcart.com/image/850/1000/xif0q/mobile/z/1/c/-original-imagt5uhcnfy66wa.jpeg?q=90&crop=false',
    ),
    OrderedItemModel(
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
      orderType: OrderTypes.eligibleForReturn,
      image:
          'https://rukminim2.flixcart.com/image/850/1000/xif0q/mobile/z/1/c/-original-imagt5uhcnfy66wa.jpeg?q=90&crop=false',
    ),
    OrderedItemModel(
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
      orderType: OrderTypes.completed,
      image:
          'https://rukminim2.flixcart.com/image/850/1000/xif0q/mobile/z/1/c/-original-imagt5uhcnfy66wa.jpeg?q=90&crop=false',
    ),
  ];

  List<String> activeOrderStatus = [
    "Ordered",
    "Picked from seller",
    "Inventory",
    "Picked from Inventory",
    "Delivered"
  ];
  List<String> orderFilters = [
    "Last 6 Months",
    "Last year",
    "2022",
    "2021",
    "2020",
  ];
  Rx<String?> selectedOrderFilters = Rx<String?>(null);
}
