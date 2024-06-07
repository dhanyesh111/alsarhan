import 'package:alsarhan/assets/icons.dart';
import 'package:get/get.dart';

import 'left_menu_model.dart';

class LeftMenuController extends GetxController {
  static LeftMenuController get to => Get.find();
  LeftMenuItemModel orders =
      LeftMenuItemModel(text: "Orders", image: AppIcons.orders);
  LeftMenuItemModel wishlist =
      LeftMenuItemModel(text: "Wishlist", image: AppIcons.wishlistOutline);
  LeftMenuItemModel coupon =
      LeftMenuItemModel(text: "Coupon", image: AppIcons.coupons);
  LeftMenuItemModel settings =
      LeftMenuItemModel(text: "Settings", image: AppIcons.setting);
  LeftMenuItemModel customerCare =
      LeftMenuItemModel(text: "Customer care", image: AppIcons.customerCare);
}
