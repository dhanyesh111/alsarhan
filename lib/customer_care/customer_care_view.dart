import 'package:alsarhan/app_bar/app_bars.dart';
import 'package:alsarhan/app_buttons/app_buttons.dart';
import 'package:alsarhan/app_colors/app_colors.dart';
import 'package:alsarhan/assets/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerCareView extends StatelessWidget {
  const CustomerCareView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Customer care",
      ),
      body: ListView(
        children: [
          Text(
            "24 * 7 Support",
            style: TextStyle(
                fontSize: 35.sp,
                color: AppColors.black,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Which in turn leads to loyalty and positive word-of-mouth referrals. Effective customer care includes active listening,",
            style: TextStyle(
              fontSize: 18.sp,
              color: AppColors.black.withOpacity(.6),
            ),
          ),
          AppButton(
            text: "+965 9800 895 856",
            textColor: AppColors.black,
            color: Colors.transparent,
            borderColor: AppColors.black,
          ),
          Image.asset(AppImages.customerCareBackground)
        ],
      ),
    );
  }
}
