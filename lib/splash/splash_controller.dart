import 'package:alsarhan/routes/routes.dart';
import 'package:get/get.dart';

class SplashControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}

class SplashController extends GetxController {
  static SplashController get to => Get.find();
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () => splashConfig());
    super.onInit();
  }

  splashConfig() {
    Get.offAllNamed(AppRoutes.login);
  }
}
