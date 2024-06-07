import 'package:alsarhan/app_colors/app_colors.dart';
import 'package:alsarhan/app_network_image/app_network_image.dart';
import 'package:alsarhan/assets/icons.dart';
import 'package:alsarhan/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../app_bar/app_bars.dart';
import 'cart_model.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Cart",
      ),
      body: GetX<CartController>(builder: (controller) {
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 25.sp),
          children: CartController.to.cartItems
              .map((product) => CartItemContainer(product: product))
              .toList(),
        );
      }),
    );
  }
}

class CartItemContainer extends StatelessWidget {
  CartItemModel product;
  CartItemContainer({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      margin: EdgeInsets.only(bottom: 10.sp),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  AppNetworkImage(
                    imageUrl: product.image,
                    height: 80.sp,
                    width: 80.sp,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  CartDropDownFormField(
                    value: product.quantityInCart,
                    itemList: List.generate(10, (index) => index).toList(),
                    onChange: (int? count) =>
                        product.quantityInCart = count ?? 1,
                  )
                ],
              ),
              SizedBox(
                width: 20.sp,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 7.sp,
                  ),
                  Text(
                    product.shortDescription,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.black.withOpacity(.6)),
                  ),
                  SizedBox(
                    height: 7.sp,
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
                  ]))
                ],
              )
            ],
          ),
          SizedBox(
            height: 15.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery by ${DateFormat("EEE MMM dd").format(product.deliveryDate)}",
                style: TextStyle(fontSize: 16.sp),
              ),
              Container(
                height: 20.sp,
                width: 1.sp,
                color: AppColors.black.withOpacity(.3),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "₹${product.deliveryFee} ",
                    style: TextStyle(
                        color: AppColors.black.withOpacity(.4),
                        decoration: TextDecoration.lineThrough,
                        fontSize: 14.sp)),
                TextSpan(
                    text: " Free Delivery",
                    style: TextStyle(
                      color: AppColors.green7,
                      fontSize: 18.sp,
                    )),
              ]))
            ],
          ),
          SizedBox(
            height: 15.sp,
          ),
          Container(
            color: AppColors.black.withOpacity(.2),
            height: 1.sp,
            width: Get.width,
          ),
          SizedBox(
            height: 15.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CartItemContainerBottomItems(
                image: AppIcons.remove,
                onTap: () => CartController.to.cartItems.remove(product),
                text: "Remove",
              ),
              Container(
                width: 1,
                height: 25.sp,
                color: AppColors.black.withOpacity(.2),
              ),
              CartItemContainerBottomItems(
                image: AppIcons.share,
                onTap: () {},
                text: "Share",
              ),
              Container(
                width: 1,
                height: 25.sp,
                color: AppColors.black.withOpacity(.2),
              ),
              CartItemContainerBottomItems(
                image: AppIcons.buyNow,
                text: "Buy now",
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CartItemContainerBottomItems extends StatelessWidget {
  String image;
  String text;
  void Function()? onTap;
  CartItemContainerBottomItems(
      {required this.image, required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(image),
          SizedBox(
            width: 10.sp,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 14.sp, color: AppColors.black.withOpacity(.6)),
          ),
        ],
      ),
    );
  }
}

class CartDropDownFormField<T> extends StatelessWidget {
  T? value;
  void Function(T?)? onChange;
  final List<T> itemList;

  CartDropDownFormField({
    super.key,
    required this.onChange,
    required this.value,
    required this.itemList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.sp,
      child: DropdownButtonFormField<T>(
          iconSize: 0,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          itemHeight: null,
          isExpanded: true,
          hint: Text(
            "QTY",
            style: TextStyle(color: AppColors.grey122, fontSize: 14.sp),
          ),
          style: TextStyle(fontSize: 16.sp, color: AppColors.grey93),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(5.sp),
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: true,
            counterText: "",
            prefixIconConstraints:
                BoxConstraints(maxWidth: 50.sp, maxHeight: 18.sp),
            prefixIcon: Text(" QTY : ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14.sp,
                    textBaseline: TextBaseline.alphabetic,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black)),
            fillColor: AppColors.white,
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.black.withOpacity(.2),
                ),
                borderRadius: BorderRadius.circular(0)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.black.withOpacity(.2)),
                borderRadius: BorderRadius.circular(0)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.black.withOpacity(.2)),
                borderRadius: BorderRadius.circular(0)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.black.withOpacity(.2)),
                borderRadius: BorderRadius.circular(0)),
          ),
          isDense: true,
          iconEnabledColor: AppColors.grey122,
          iconDisabledColor: AppColors.grey122,
          items: itemList
              .map((e) => DropdownMenuItem(
                    value: e,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      (e).toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black),
                    ),
                  ))
              .toList(),
          value: value,
          onChanged: onChange),
    );
  }
}
