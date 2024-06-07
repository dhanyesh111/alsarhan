import 'package:alsarhan/assets/icons.dart';
import 'package:alsarhan/cart/cart_controller.dart';
import 'package:alsarhan/homepage/homepage_controller.dart';
import 'package:alsarhan/left_menu/left_menu_controller.dart';
import 'package:alsarhan/wishlist/wishlist_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../category/catergory_controller.dart';
import 'landing_page_model.dart';

class LandingPageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LandingPageController());
    Get.put(HomePageController());
    Get.put(CategoryController());
    Get.put(WishlistController());
    Get.put(CartController());
    Get.put(LeftMenuController());
  }
}

class LandingPageController extends GetxController {
  PageController pageController = PageController();
  static LandingPageController get to => Get.find();
  RxInt currentIndex = 0.obs;
  changeCurrentPage({required int index}) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  List<BottomNavigationBarItemModel> bottomNavigationBarItem = [
    BottomNavigationBarItemModel(icon: AppIcons.home, text: "Home"),
    BottomNavigationBarItemModel(icon: AppIcons.categories, text: "Categories"),
    BottomNavigationBarItemModel(icon: AppIcons.wishlist, text: "Wishlist"),
    BottomNavigationBarItemModel(icon: AppIcons.cart, text: "Cart"),
  ];
}
