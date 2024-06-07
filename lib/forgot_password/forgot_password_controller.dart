import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordController());
  }
}

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get to => Get.find();
  TextEditingController controllerEmail = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();
  sendResetLink() {
    if (forgotPasswordFormKey.currentState?.validate() ?? false) {
      Get.back();
    }
  }
}
