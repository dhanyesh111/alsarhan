import 'package:alsarhan/app_bar/app_bars.dart';
import 'package:alsarhan/app_colors/app_colors.dart';
import 'package:alsarhan/app_network_image/app_network_image.dart';
import 'package:alsarhan/assets/icons.dart';
import 'package:alsarhan/product_listing/product_listing_controller.dart';
import 'package:alsarhan/product_listing/product_listing_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class ProductListing extends StatelessWidget {
  const ProductListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Samsung"),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10.sp),
        children: [
          CategoryModelForProductListing(),
          SizedBox(
            height: 10.sp,
          ),
          Column(
            children: ProductListingController.to.products
                .map((product) => ProductListingContainerItem(
                      product: product,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}

class CategoryModelForProductListing extends StatelessWidget {
  CategoryModelForProductListing();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.sp,
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 28.sp),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: ProductListingController.to.categoryList
            .map((category) => Container(
                  margin: EdgeInsets.only(right: 30.sp),
                  child: Column(
                    children: [
                      AppNetworkImage(
                        imageUrl: category.image,
                        height: 80.sp,
                        width: 80.sp,
                        radius: 80.sp,
                      ),
                      SizedBox(
                        height: 25.sp,
                      ),
                      Text(
                        category.text.toUpperCase(),
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class ProductListingContainerItem extends StatelessWidget {
  ProductItemModel product;
  ProductListingContainerItem({required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.sp),
      margin: EdgeInsets.only(bottom: 5.sp),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppNetworkImage(
                imageUrl: product.image,
                height: 120.sp,
                width: 90.sp,
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: 20.sp,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 210.sp,
                    child: Text(
                      product.name,
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    WidgetSpan(child: StarBuilder()),
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
                    height: 5.sp,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "₹${product.offerPrice} ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                            fontSize: 20.sp)),
                    TextSpan(
                        text: " ₹${product.price} ",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black.withOpacity(.2),
                            decoration: TextDecoration.lineThrough)),
                    TextSpan(
                        text: " ${product.discount} % off ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.green7,
                            fontSize: 20.sp)),
                  ])),
                ],
              ),
              SizedBox(
                width: 10.sp,
              ),
              GestureDetector(
                onTap: () => product.isInCart.value = !product.isInCart.value,
                child: GetX<ProductListingController>(builder: (controller) {
                  return product.isInCart.value
                      ? SvgPicture.asset(
                          AppIcons.wishlist,
                          height: 24.sp,
                          width: 24.sp,
                          color: AppColors.red255,
                        )
                      : SvgPicture.asset(
                          AppIcons.wishlistOutline,
                          height: 24.sp,
                          width: 24.sp,
                        );
                }),
              )
            ],
          ),
          SizedBox(
            height: 30.sp,
          ),
          Wrap(
            spacing: 9.sp,
            runSpacing: 12.sp,
            children: product.specifications
                .map((specification) => Container(
                      padding: EdgeInsets.all(8.sp),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.black.withOpacity(.1))),
                      child: Text(
                        specification.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 16.sp),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}

class StarBuilder extends StatelessWidget {
  const StarBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.sp,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(5, (index) => index)
            .map((e) => Icon(
                  Icons.star,
                  size: 20.sp,
                  color: AppColors.green7,
                ))
            .toList(),
      ),
    );
  }
}
