import 'package:get/get.dart';

import 'homepage_model.dart';

class HomePageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}

class HomePageController extends GetxController {
  static HomePageController get to => Get.find();
  List<String> topCategories = [
    "100% GENUINE BRAND",
    "LATEST TRENDS",
    "PREMIUM FINDS",
    "100% GENUINE BRAND",
    "LATEST TRENDS",
    "PREMIUM FINDS",
    "100% GENUINE BRAND",
    "LATEST TRENDS",
    "PREMIUM FINDS",
  ];
  String mainPoster =
      "https://i.pinimg.com/736x/eb/7e/c6/eb7ec6677c9e7f769787d781d26027fe.jpg";
  List<PopularStoresModel> popularStores = [
    PopularStoresModel(
        image:
            'https://img.global.news.samsung.com/in/wp-content/uploads/2022/09/feature.jpg',
        text: 'Samsung'),
    PopularStoresModel(
        image: 'https://static.india.com/wp-content/uploads/2022/08/Lulu.png',
        text: 'Lulu'),
    PopularStoresModel(
        image:
            "https://gumlet-images.assettype.com/afaqs/2024-03/767914b9-fdba-40cf-9cc2-66692c2fc711/DECATHLON_store_with_new_logo_1.jpg?auto=format,compress&fmt=webp&format=webp&w=1200&h=900&dpr=1.0",
        text: 'decathlon'),
    PopularStoresModel(
        image:
            "https://content.jdmagicbox.com/comp/ahmedabad/u8/079pxx79.xx79.181027144557.s8u8/catalogue/hp-world-bapunagar-ahmedabad-computer-dealers-0bnmw3i73l.jpg",
        text: 'HP'),
    PopularStoresModel(
        image:
            'https://img.global.news.samsung.com/in/wp-content/uploads/2022/09/feature.jpg',
        text: 'Samsung'),
    PopularStoresModel(
        image: 'https://static.india.com/wp-content/uploads/2022/08/Lulu.png',
        text: 'Lulu'),
    PopularStoresModel(
        image:
            "https://gumlet-images.assettype.com/afaqs/2024-03/767914b9-fdba-40cf-9cc2-66692c2fc711/DECATHLON_store_with_new_logo_1.jpg?auto=format,compress&fmt=webp&format=webp&w=1200&h=900&dpr=1.0",
        text: 'decathlon'),
    PopularStoresModel(
        image:
            "https://content.jdmagicbox.com/comp/ahmedabad/u8/079pxx79.xx79.181027144557.s8u8/catalogue/hp-world-bapunagar-ahmedabad-computer-dealers-0bnmw3i73l.jpg",
        text: 'HP'),
  ];

  List<ExclusiveDealsModel> exclusiveDeals = [
    ExclusiveDealsModel(
        image:
            'https://images.samsung.com/in/smartphones/galaxy-s23-ultra/images/galaxy-s23-ultra-highlights-kv.jpg',
        text: 'Smart Phone',
        discountPercent: '70'),
    ExclusiveDealsModel(
        image:
            'https://images.indianexpress.com/2024/01/Samsung-galaxy-watch-20240112.jpg',
        text: 'Smart Watches',
        discountPercent: '80'),
    ExclusiveDealsModel(
        image:
            'https://images.samsung.com/in/smartphones/galaxy-s23-ultra/images/galaxy-s23-ultra-highlights-kv.jpg',
        text: 'Smart Phone',
        discountPercent: '70'),
    ExclusiveDealsModel(
        image:
            'https://images.indianexpress.com/2024/01/Samsung-galaxy-watch-20240112.jpg',
        text: 'Smart Watches',
        discountPercent: '80'),
    ExclusiveDealsModel(
        image:
            'https://images.samsung.com/in/smartphones/galaxy-s23-ultra/images/galaxy-s23-ultra-highlights-kv.jpg',
        text: 'Smart Phone',
        discountPercent: '70'),
    ExclusiveDealsModel(
        image:
            'https://images.indianexpress.com/2024/01/Samsung-galaxy-watch-20240112.jpg',
        text: 'Smart Watches',
        discountPercent: '80'),
    ExclusiveDealsModel(
        image:
            'https://images.indianexpress.com/2024/01/Samsung-galaxy-watch-20240112.jpg',
        text: 'Smart Watches',
        discountPercent: '80'),
  ];
  List<SuggestedForYouModel> suggestedForYou = [
    SuggestedForYouModel(
        image:
            'https://medias.utsavfashion.com/media/catalog/product/cache/1/image/500x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-bandhej-saree-in-fuchsia-v1-sew10470.jpg',
        text: 'Bridal wear',
        discountPercent: '70'),
    SuggestedForYouModel(
        image:
            'https://i.pinimg.com/736x/39/ca/eb/39caeba1acd97bad8063d9421fefc628.jpg',
        text: 'Kids wear',
        discountPercent: '80'),
    SuggestedForYouModel(
        image:
            'https://medias.utsavfashion.com/media/catalog/product/cache/1/image/500x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-bandhej-saree-in-fuchsia-v1-sew10470.jpg',
        text: 'Bridal wear',
        discountPercent: '70'),
    SuggestedForYouModel(
        image:
            'https://i.pinimg.com/736x/39/ca/eb/39caeba1acd97bad8063d9421fefc628.jpg',
        text: 'Kids wear',
        discountPercent: '80'),
    SuggestedForYouModel(
        image:
            'https://medias.utsavfashion.com/media/catalog/product/cache/1/image/500x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-bandhej-saree-in-fuchsia-v1-sew10470.jpg',
        text: 'Bridal wear',
        discountPercent: '70'),
    SuggestedForYouModel(
        image:
            'https://i.pinimg.com/736x/39/ca/eb/39caeba1acd97bad8063d9421fefc628.jpg',
        text: 'Kids wear',
        discountPercent: '80'),
    SuggestedForYouModel(
        image:
            'https://medias.utsavfashion.com/media/catalog/product/cache/1/image/500x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-bandhej-saree-in-fuchsia-v1-sew10470.jpg',
        text: 'Bridal wear',
        discountPercent: '70'),
    SuggestedForYouModel(
        image:
            'https://i.pinimg.com/736x/39/ca/eb/39caeba1acd97bad8063d9421fefc628.jpg',
        text: 'Kids wear',
        discountPercent: '80'),
    SuggestedForYouModel(
        image:
            'https://medias.utsavfashion.com/media/catalog/product/cache/1/image/500x/040ec09b1e35df139433887a97daa66f/w/o/woven-art-silk-bandhej-saree-in-fuchsia-v1-sew10470.jpg',
        text: 'Bridal wear',
        discountPercent: '70'),
    SuggestedForYouModel(
        image:
            'https://i.pinimg.com/736x/39/ca/eb/39caeba1acd97bad8063d9421fefc628.jpg',
        text: 'Kids wear',
        discountPercent: '80'),
  ];
  List<ExploreTheBestModel> exploreTheBest = [
    ExploreTheBestModel(
        image:
            "https://c.static-nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/g1ljiszo4qhthfpluzbt/123-joyride-cdp-apla-xa-xp.jpg",
        text: 'Nike Shoes',
        price: '7000'),
    ExploreTheBestModel(
        image:
            'https://i.pinimg.com/736x/39/ca/eb/39caeba1acd97bad8063d9421fefc628.jpg',
        text: 'Wedding Saree',
        price: '800'),
    ExploreTheBestModel(
        image:
            "https://images-cdn.ubuy.co.in/64efc2266741d167cb7d431c-asus-tuf-gaming-a15-2023-gaming.jpg",
        text: 'ASUS TUF A15',
        price: '13300'),
    ExploreTheBestModel(
        image:
            "https://m.media-amazon.com/images/I/81xT3no1+6L._AC_UF1000,1000_QL80_.jpg",
        text: 'Smart TV',
        price: '56300'),
    ExploreTheBestModel(
        image:
            "https://m.media-amazon.com/images/I/710Tj2u6EpL._AC_UF894,1000_QL80_DpWeblab_.jpg",
        text: 'Dinner set',
        price: '2300'),
  ];

  String secondPoster =
      "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/washing-machine-ads-design-template-8aab874787f56c6625e48193f57bddbe_screen.jpg?ts=1652172739";
  String thirdPoster =
      "https://img.global.news.samsung.com/in/wp-content/uploads/2019/08/1942_Samsung_Smart-TV_25-7-2019_KV-Smart-ZEE5_03-7-23019.jpg";
}
