import 'package:alsarhan/app_bar/app_bars.dart';
import 'package:alsarhan/app_buttons/app_buttons.dart';
import 'package:alsarhan/app_colors/app_colors.dart';
import 'package:alsarhan/app_text_from_field/app_text_form_fields.dart';
import 'package:alsarhan/forgot_password/forgot_password_controller.dart';
import 'package:alsarhan/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Forgot password",
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 25.sp),
        children: [
          Form(
            key: ForgotPasswordController.to.forgotPasswordFormKey,
            child: AppTextFormField(
                controller: ForgotPasswordController.to.controllerEmail,
                validator: (value) => Validators.isEMail(value: value),
                header: "Email"),
          ),
          SizedBox(
            height: 25.sp,
          ),
          Text(
            "We will send an email with a password reset link.",
            style: TextStyle(
                fontSize: 16.sp, color: AppColors.black.withOpacity(.7)),
          ),
          SizedBox(
            height: 25.sp,
          ),
          AppButton(
            text: "Continue",
            onTap: () => ForgotPasswordController.to.sendResetLink(),
          )
        ],
      ),
    );
  }
}
