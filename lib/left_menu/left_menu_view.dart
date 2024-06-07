import 'package:alsarhan/app_colors/app_colors.dart';
import 'package:alsarhan/app_network_image/app_network_image.dart';
import 'package:alsarhan/left_menu/left_menu_controller.dart';
import 'package:alsarhan/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'left_menu_model.dart';

class LeftMenu extends StatelessWidget {
  const LeftMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.sp,
      color: AppColors.white,
      child: ListView(
        children: [
          SizedBox(
            height: 20.sp,
          ),
          CustomerDetails(),
          Divider(
            color: AppColors.black.withOpacity(.1),
          ),
          LeftMenuItem(
            leftMenuItem: LeftMenuController.to.orders,
            onTap: () => Get.toNamed(AppRoutes.orders),
          ),
          Divider(
            color: AppColors.black.withOpacity(.1),
          ),
          LeftMenuItem(
            leftMenuItem: LeftMenuController.to.wishlist,
          ),
          Divider(
            color: AppColors.black.withOpacity(.1),
          ),
          LeftMenuItem(
            leftMenuItem: LeftMenuController.to.coupon,
            onTap: () => Get.toNamed(AppRoutes.coupons),
          ),
          Divider(
            color: AppColors.black.withOpacity(.1),
          ),
          LeftMenuItem(
            leftMenuItem: LeftMenuController.to.settings,
          ),
          Divider(
            color: AppColors.black.withOpacity(.1),
          ),
          LeftMenuItem(
            leftMenuItem: LeftMenuController.to.customerCare,
          ),
          Divider(
            color: AppColors.black.withOpacity(.1),
          ),
          IconButton(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(25.sp),
            onPressed: () => Get.offAllNamed(AppRoutes.login),
            icon: Text(
              "Logout",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppNetworkImage(
                imageUrl:
                    "https://goldenglobes.com/wp-content/uploads/2023/10/Emma-Stone-Photo-2.png?w=500?w=600",
                height: 50.sp,
                width: 50.sp,
                radius: 50.sp,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 15.sp,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Emma Stone",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "+91 8089163033",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18.sp,
          )
        ],
      ),
    );
  }
}

class LeftMenuItem extends StatelessWidget {
  LeftMenuItemModel leftMenuItem;
  void Function()? onTap;
  LeftMenuItem({required this.leftMenuItem, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 10.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 25.sp,
                  width: 25.sp,
                  child: SvgPicture.asset(
                    leftMenuItem.image,
                  ),
                ),
                SizedBox(
                  width: 15.sp,
                ),
                Text(
                  leftMenuItem.text,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20.sp,
            )
          ],
        ),
      ),
    );
  }
}
