import 'package:get/get.dart';

import 'catergory_model.dart';

class CategoryControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController());
  }
}

class CategoryController extends GetxController {
  static CategoryController get to => Get.find();
  void onInit() {
    categories = [
      CategoryListingModel(items: mainCategories, text: "Popular stores"),
      CategoryListingModel(items: mainCategories, text: "Today's Offers"),
      CategoryListingModel(items: mainCategories, text: "Top sellers"),
      CategoryListingModel(items: mainCategories, text: "Popular stores"),
    ];
  }

  List<CategoryListingModel> categories = [];
  Rx<CategoryItemModel?> selectedCategory = Rx<CategoryItemModel?>(null);

  List<CategoryItemModel> mainCategories = [
    CategoryItemModel(
        image:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/814px-Apple_logo_black.svg.png",
        text: 'I Phone'),
    CategoryItemModel(
        image:
            'https://cdn.logojoy.com/wp-content/uploads/20231013154327/Adidas-logo-1991-1-600x319.png',
        text: 'Adidas'),
    CategoryItemModel(
        image:
            'https://kreafolk.com/cdn/shop/articles/panasonic-logo-design-history-and-evolution-kreafolk.jpg?v=1707034412&width=2048',
        text: 'Panasonic'),
    CategoryItemModel(
        image:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Levi%27s_logo.svg/2560px-Levi%27s_logo.svg.png",
        text: 'Levi'),
    CategoryItemModel(
        image:
            "https://www.freepnglogos.com/uploads/original-samsung-logo-10.png",
        text: 'Samsung'),
    CategoryItemModel(
        image:
            "https://mir-s3-cdn-cf.behance.net/projects/404/8e911e182049259.Y3JvcCwxMDU3LDgyNywxNzAsMA.jpg",
        text: 'Van heusen'),
  ];
}
