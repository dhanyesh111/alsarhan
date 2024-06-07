import 'package:alsarhan/app_bar/app_bars.dart';
import 'package:alsarhan/app_colors/app_colors.dart';
import 'package:alsarhan/app_network_image/app_network_image.dart';
import 'package:alsarhan/assets/icons.dart';
import 'package:alsarhan/coupon/coupon_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'coupon_model.dart';

class CouponView extends StatelessWidget {
  const CouponView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Coupon",
      ),
      body: GridView(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 25.sp),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.sp,
            crossAxisSpacing: 10.sp,
            childAspectRatio: 185.sp / 330.sp),
        children: CouponController.to.couponList
            .map((coupon) => CouponListingItem(coupon: coupon))
            .toList(),
      ),
    );
  }
}

class CouponListingItem extends StatelessWidget {
  CouponModel coupon;
  CouponListingItem({super.key, required this.coupon});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.black.withOpacity(.1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15.sp),
                child: AppNetworkImage(
                  imageUrl: coupon.image,
                  height: 210.sp,
                  fit: BoxFit.cover,
                  width: 200.sp,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 10.sp,
                child: Container(
                  height: 40.sp,
                  width: 40.sp,
                  padding: EdgeInsets.all(11.sp),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: AppColors.black.withOpacity(.5))),
                  child: SvgPicture.asset(
                    AppIcons.arrowSlanding,
                    color: AppColors.black,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.sp,
          ),
          Text(
            coupon.company,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
          ),
          Text(
            coupon.title,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
