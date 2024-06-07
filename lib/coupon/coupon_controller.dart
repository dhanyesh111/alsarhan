import 'package:get/get.dart';

import 'coupon_model.dart';

class CouponControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CouponController());
  }
}

class CouponController extends GetxController {
  static CouponController get to => Get.find();
  List<CouponModel> couponList = [
    CouponModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeH_5kxOtfmvTT6aZzqS68koaVZgYDQ93Q6_Ig0ddIew&s',
        title: 'Shoe upgrade with 10% cashback',
        company: 'Fast track'),
    CouponModel(
        image:
            "https://cdn.grabon.in/gograbon/images/web-images/uploads/1618492485004/fastrack-offers.jpg",
        title: 'Shoe upgrade with 10% cashback',
        company: 'Fast track'),
    CouponModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeH_5kxOtfmvTT6aZzqS68koaVZgYDQ93Q6_Ig0ddIew&s',
        title: 'Shoe upgrade with 10% cashback',
        company: 'Fast track'),
    CouponModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeH_5kxOtfmvTT6aZzqS68koaVZgYDQ93Q6_Ig0ddIew&s',
        title: 'Shoe upgrade with 10% cashback',
        company: 'Fast track'),
    CouponModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeH_5kxOtfmvTT6aZzqS68koaVZgYDQ93Q6_Ig0ddIew&s',
        title: 'Shoe upgrade with 10% cashback',
        company: 'Fast track'),
    CouponModel(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeH_5kxOtfmvTT6aZzqS68koaVZgYDQ93Q6_Ig0ddIew&s',
        title: 'Shoe upgrade with 10% cashback',
        company: 'Fast track'),
  ];
}
