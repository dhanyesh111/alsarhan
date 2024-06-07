import 'package:alsarhan/app_bar/app_bars.dart';
import 'package:alsarhan/app_buttons/app_buttons.dart';
import 'package:alsarhan/app_network_image/app_network_image.dart';
import 'package:alsarhan/wishlist/wishlist_controller.dart';
import 'package:alsarhan/wishlist/wishlist_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors/app_colors.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "WishList",
      ),
      body: GridView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.sp,
            crossAxisSpacing: 10.sp,
            childAspectRatio: 200.sp / 410.sp),
        children: WishlistController.to.products
            .map((product) => WishListItem(
                  product: product,
                ))
            .toList(),
      ),
    );
  }
}

class WishListItem extends StatelessWidget {
  WishListItemModel product;
  WishListItem({required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AppNetworkImage(
                imageUrl: product.image,
                height: 220.sp,
                width: 200.sp,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 5.sp,
                right: 5.sp,
                child: CircleWithIcon(
                  color: AppColors.white.withOpacity(.5),
                  height: 30.sp,
                  child: Icon(
                    Icons.favorite,
                    size: 22.sp,
                    color: AppColors.red255,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.company.toUpperCase(),
                  style: TextStyle(fontSize: 14.sp),
                ),
                Text(
                  product.name,
                  maxLines: 2,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
                ),
                RichText(
                    text: TextSpan(children: [
                  WidgetSpan(
                      child: Icon(
                    Icons.star,
                    color: AppColors.green7,
                    size: 20.sp,
                  )),
                  TextSpan(
                      text: " ${product.rating}/5   ",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                          fontSize: 16.sp)),
                  TextSpan(
                      text: product.ratingCount,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.black,
                      ))
                ])),
                SizedBox(
                  height: 10.sp,
                ),
                AppButton(
                  text: "ADD TO CART",
                  color: Colors.transparent,
                  height: 54.sp,
                  width: 180.sp,
                  radius: 0,
                  textColor: AppColors.black.withOpacity(.6),
                  borderColor: AppColors.black.withOpacity(.2),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
