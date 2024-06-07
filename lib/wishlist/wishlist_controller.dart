import 'package:alsarhan/wishlist/wishlist_model.dart';
import 'package:get/get.dart';

class WishlistControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WishlistController());
  }
}

class WishlistController extends GetxController {
  static WishlistController get to => Get.find();
  List<WishListItemModel> products = [
    WishListItemModel(
        image:
            "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/n/z/4/-original-imagz5g9gyhmgusp.jpeg?q=70",
        name: 'POCO X6 Neo 5G (Astral Black, 256 GB)  (12 GB RAM)',
        company: 'POCO',
        rating: '4',
        ratingCount: '34522'),
    WishListItemModel(
        image:
            "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/n/z/4/-original-imagz5g9gyhmgusp.jpeg?q=70",
        name: 'POCO X6 Neo 5G (Astral Black, 256 GB)  (12 GB RAM)',
        company: 'POCO',
        rating: '4.0',
        ratingCount: '34522'),
    WishListItemModel(
        image:
            "https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/n/z/4/-original-imagz5g9gyhmgusp.jpeg?q=70",
        name: 'POCO X6 Neo 5G (Astral Black, 256 GB)  (12 GB RAM)',
        company: 'POCO',
        rating: '4',
        ratingCount: '34522'),
  ];
}
