import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateAccountControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAccountController());
  }
}

class CreateAccountController extends GetxController {
  static CreateAccountController get to => Get.find();
  RxBool isTermsAndConditionsAgreed = false.obs;
  GlobalKey<FormState> createAccountPageFormKey = GlobalKey();

  RxString errorMessageForTermsAndConditions = "".obs;
  TextEditingController controllerFirstName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();
  toggleIsTermsAndConditionsAgreed({required bool value}) {
    isTermsAndConditionsAgreed.value = value;
    if ((value)) {
      errorMessageForTermsAndConditions.value = "";
    }
  }

  RxBool isPasswordObscure = true.obs;
  RxBool isPasswordConfirmObscure = true.obs;

  register() {
    if (!isTermsAndConditionsAgreed.value) {
      errorMessageForTermsAndConditions.value =
          " Please agree to our terms and conditions";
    }
    if (createAccountPageFormKey.currentState?.validate() ?? false) {}
  }
}
