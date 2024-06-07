import 'package:alsarhan/app_bar/app_bars.dart';
import 'package:alsarhan/app_buttons/app_buttons.dart';
import 'package:alsarhan/assets/icons.dart';
import 'package:alsarhan/create_account/create_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../app_colors/app_colors.dart';
import '../app_text_from_field/app_text_form_fields.dart';
import '../validators/validators.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Create a account",
      ),
      body: Form(
        key: CreateAccountController.to.createAccountPageFormKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
          children: [
            AppTextFormField(
              controller: CreateAccountController.to.controllerFirstName,
              validator: (value) => Validators.isEmpty(
                  value: value, errorText: "First name is required"),
              header: 'First Name',
            ),
            SizedBox(
              height: 15.sp,
            ),
            AppTextFormField(
              controller: CreateAccountController.to.controllerLastName,
              validator: (value) => Validators.isEmpty(
                  value: value, errorText: "Last name is required"),
              header: 'Last Name',
            ),
            SizedBox(
              height: 15.sp,
            ),
            AppTextFormField(
              controller: CreateAccountController.to.controllerEmail,
              validator: (value) => Validators.isEMail(value: value),
              header: 'Email',
            ),
            SizedBox(
              height: 15.sp,
            ),
            GetX<CreateAccountController>(builder: (controller) {
              return AppTextFormField(
                controller: CreateAccountController.to.controllerPassword,
                validator: (value) => Validators.validatePassword(value: value),
                header: 'Password',
                icon: GestureDetector(
                  onTap: () => controller.isPasswordObscure.value =
                      !controller.isPasswordObscure.value,
                  child: SvgPicture.asset(controller.isPasswordObscure.value
                      ? AppIcons.eyeClosed
                      : AppIcons.eyeOpen),
                ),
                obscureText: controller.isPasswordObscure.value,
              );
            }),
            SizedBox(
              height: 15.sp,
            ),
            GetX<CreateAccountController>(builder: (controller) {
              return AppTextFormField(
                controller:
                    CreateAccountController.to.controllerConfirmPassword,
                validator: (value) => Validators.isSameAs(
                    value: value,
                    confirmText:
                        CreateAccountController.to.controllerPassword.text),
                header: 'Confirm password',
                icon: GestureDetector(
                  onTap: () => controller.isPasswordConfirmObscure.value =
                      !controller.isPasswordConfirmObscure.value,
                  child: SvgPicture.asset(
                      controller.isPasswordConfirmObscure.value
                          ? AppIcons.eyeClosed
                          : AppIcons.eyeOpen),
                ),
                obscureText: controller.isPasswordConfirmObscure.value,
              );
            }),
            SizedBox(
              height: 15.sp,
            ),
            TermsAndConditions(),
            SizedBox(
              height: 40.sp,
            ),
            AppButton(
              text: "Continue",
              onTap: () => CreateAccountController.to.register(),
            ),
            SizedBox(
              height: 20.sp,
            ),
            GestureDetector(
              onTap: () => Get.back(),
              child: RichText(
                text: TextSpan(
                    text: "I  have an account ",
                    style: TextStyle(fontSize: 16.sp, color: AppColors.black),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.brown88,
                            decoration: TextDecoration.underline),
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GetX<CreateAccountController>(builder: (controller) {
              return Checkbox(
                  value: controller.isTermsAndConditionsAgreed.value,
                  onChanged: (value) => controller
                      .toggleIsTermsAndConditionsAgreed(value: value ?? false));
            }),
            Container(
              width: 320.sp,
              child: RichText(
                text: TextSpan(
                    text: "By registering in, you agree to ",
                    style: TextStyle(fontSize: 16.sp, color: AppColors.black),
                    children: [
                      TextSpan(
                        text:
                            "Al Ihasan Inc’s term of service and Privacy policy",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.brown88,
                            decoration: TextDecoration.underline),
                      )
                    ]),
              ),
            ),
          ],
        ),
        GetX<CreateAccountController>(builder: (controller) {
          return Text(
            controller.errorMessageForTermsAndConditions.value,
            style: TextStyle(color: AppColors.red255),
          );
        }),
      ],
    );
  }
}
