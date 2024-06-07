import 'package:alsarhan/assets/icons.dart';
import 'package:alsarhan/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'login_model.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  GlobalKey<FormState> loginPageFormKey = GlobalKey();
  List<CountryCodeModel> countryList = [
    CountryCodeModel(
        flag: AppIcons.flagKuwait, name: 'Kuwait', mobileCode: '+965')
  ];

  login() {
    if (loginPageFormKey.currentState?.validate() ?? false) {
      print(controllerEmail.text);
      print(controllerPassword.text);
      Get.offAllNamed(AppRoutes.landingPage);
    }
  }
}
