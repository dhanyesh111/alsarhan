import 'package:alsarhan/return/return_model.dart';
import 'package:get/get.dart';

import '../orders/orders_model.dart';

class ReturnControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReturnController());
  }
}

class ReturnController extends GetxController {
  static ReturnController get to => Get.find();
  List<OrderReturnStatusItemModel> orderHistory = [
    OrderReturnStatusItemModel(status: "Order Delivered", date: DateTime.now()),
    OrderReturnStatusItemModel(
        status: "Return initiated", date: DateTime.now()),
    OrderReturnStatusItemModel(
        status: "Return label generated", date: DateTime.now()),
    OrderReturnStatusItemModel(
        status: "Product shipped back", date: DateTime.now()),
    OrderReturnStatusItemModel(
        status: "Product received", date: DateTime.now()),
    OrderReturnStatusItemModel(
        status: "Refund processed", date: DateTime.now()),
    OrderReturnStatusItemModel(status: " Refund issued", date: DateTime.now()),
  ];
  List<OrderReturnStatusItemModel> orderHistoryBeforeCancel = [
    OrderReturnStatusItemModel(status: "Order Placed", date: DateTime.now()),
    OrderReturnStatusItemModel(status: "Order Delivered", date: DateTime.now()),
    OrderReturnStatusItemModel(status: "return", date: DateTime.now()),
  ];

  OrderedItemModel product = OrderedItemModel(
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
  );

  RxBool isOrderReturned = false.obs;

  List<String> reasonForReturn = [
    "Product arrived damaged or defective.",
    "Product is not as described.",
    "Product does not fit.",
    "Received the wrong item.",
    "No longer need the item.",
    "Changed my mind.",
    "Found a better price elsewhere",
    "Gift recipient does not like the item.",
    "other.",
  ];
  Rx<String?> selectedReasonForReturn = Rx<String?>(null);
}
