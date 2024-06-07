import 'package:alsarhan/product_details/product_details_model.dart';
import 'package:get/get.dart';

class ProductDetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailsController());
  }
}

class ProductDetailsController extends GetxController {
  static ProductDetailsController get to => Get.find();
  List<ProductVariantListingModel> variants = [
    ProductVariantListingModel(
        name: 'Color', value: 'black', numberOfOptions: '3'),
    ProductVariantListingModel(
        name: 'Battery', value: '2000maH', numberOfOptions: '2')
  ];
  List<BuyTogetherProductModel> buyTogetherProducts = [
    BuyTogetherProductModel(
      image:
          "https://rukminim2.flixcart.com/image/612/612/xif0q/speaker/g/u/m/-original-imahygfgsrhvyq8r.jpeg?q=70",
      name: "Mivi Fort S160 With Sub woofer",
      actualPrice: '10,999',
      offerPrice: "9,0000",
      discount: '10',
      isInCart: false.obs,
    ),
  ];

  List<String> offerCards = [
    "https://www.neerus.com/cdn/shop/files/WhatsAppImage2023-10-25at5.07.06PM.jpg?v=1698234140",
    "https://www.neerus.com/cdn/shop/files/WhatsAppImage2023-10-25at5.07.06PM.jpg?v=1698234140",
    "https://www.neerus.com/cdn/shop/files/WhatsAppImage2023-10-25at5.07.06PM.jpg?v=1698234140",
    "https://www.neerus.com/cdn/shop/files/WhatsAppImage2023-10-25at5.07.06PM.jpg?v=1698234140",
    "https://www.neerus.com/cdn/shop/files/WhatsAppImage2023-10-25at5.07.06PM.jpg?v=1698234140",
  ];
  List<HightLightsModel> hightLights = [
    HightLightsModel(text: "With Mic", value: "Yes"),
    HightLightsModel(text: "Connector type", value: "No"),
    HightLightsModel(text: "Bluetooth version", value: "5.1"),
    HightLightsModel(text: "Wireless range", value: "10 m"),
    HightLightsModel(
        text: "Battery life", value: "60 hr | Charging time: 40-60m"),
    HightLightsModel(
        text: "Flatwire", value: "Stays tangle free even in your pocket"),
  ];
  List<SpecificationModel> specication = [
    SpecificationModel(text: "Model Name", value: "Bullets Wireless Z2"),
    SpecificationModel(text: "Color", value: "Magico Black"),
    SpecificationModel(text: "Headphone Type", value: "In the Ear"),
    SpecificationModel(text: " Inline Remote", value: "Yes"),
    SpecificationModel(
        text: "Sales Package",
        value:
            "  Neckband, Type C Cable, Additional Pair of Eartips, User Guide, Warranty Card"),
    SpecificationModel(text: "Connectivity", value: "Bluetooth"),
    SpecificationModel(text: "Headphone Design", value: "Behind the Neck"),
    SpecificationModel(
        text: "  Compatible Devices", value: "Laptop, Mobile, Tablet"),
  ];
}
