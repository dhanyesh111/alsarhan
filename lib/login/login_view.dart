import 'package:alsarhan/app_buttons/app_buttons.dart';
import 'package:alsarhan/app_colors/app_colors.dart';
import 'package:alsarhan/app_text_from_field/app_text_form_fields.dart';
import 'package:alsarhan/assets/icons.dart';
import 'package:alsarhan/login/login_controller.dart';
import 'package:alsarhan/routes/routes.dart';
import 'package:alsarhan/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../app_bar/app_bars.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Login",
      ),
      body: Form(
        key: LoginController.to.loginPageFormKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 35.sp),
          shrinkWrap: true,
          children: [
            AppTextFormField(
              controller: LoginController.to.controllerEmail,
              validator: (value) => Validators.isEMail(value: value),
              header: 'Email',
            ),
            SizedBox(
              height: 30.sp,
            ),
            AppTextFormField(
              obscureText: true,
              validator: (value) => Validators.isEmpty(
                  value: value, errorText: "Password is required"),
              controller: LoginController.to.controllerPassword,
              header: 'Password',
            ),
            SizedBox(
              height: 30.sp,
            ),
            AppButton(
              text: "Continue",
              onTap: () => LoginController.to.login(),
            ),
            SizedBox(
              height: 30.sp,
            ),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.createAccount),
              child: RichText(
                text: TextSpan(
                    text: "I don’t have an account ",
                    style: TextStyle(fontSize: 16.sp, color: AppColors.black),
                    children: [
                      TextSpan(
                        text: "Signup",
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
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.forgotPassword),
              child: Text("Forget Password",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.brown88,
                      decoration: TextDecoration.underline)),
            ),
            SizedBox(
              height: 40.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 1.sp,
                  width: 150.sp,
                  color: AppColors.black.withOpacity(.2),
                ),
                Text(
                  "or",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                ),
                Container(
                  height: 1.sp,
                  width: 150.sp,
                  color: AppColors.black.withOpacity(.2),
                ),
              ],
            ),
            SizedBox(height: 30.sp),
            OtherLoginMethods(
              icon: AppIcons.google,
              text: "Continue with Email",
            ),
            SizedBox(height: 50.sp),
          ],
        ),
      ),
    );
  }
}

class OtherLoginMethods extends StatelessWidget {
  String icon;
  String text;
  OtherLoginMethods({required this.text, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.black.withOpacity(.2)),
          borderRadius: BorderRadius.circular(10.sp)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(icon),
          Text(
            text,
            style: TextStyle(fontSize: 18.sp),
          ),
          SizedBox(
            width: 24.sp,
          )
        ],
      ),
    );
  }
}

//     OtherLoginMethods(
//               icon: AppIcons.continueWithPhone,
//               text: "Continue with Phone",
//             ),
//             SizedBox(height: 15.sp),
