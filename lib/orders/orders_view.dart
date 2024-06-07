import 'package:alsarhan/app_bar/app_bars.dart';
import 'package:alsarhan/assets/icons.dart';
import 'package:alsarhan/orders/orders_controller.dart';
import 'package:alsarhan/orders/orders_model.dart';
import 'package:alsarhan/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../app_buttons/app_buttons.dart';
import '../app_colors/app_colors.dart';
import '../app_network_image/app_network_image.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Orders",
        actions: [
          GestureDetector(
              onTap: () => Get.bottomSheet(OrderFilterBottomSheet(),
                  isScrollControlled: true),
              child: SvgPicture.asset(AppIcons.filter))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 25.sp),
        children: OrdersController.to.orderedItems
            .map((orderItem) => orderItem.orderType == OrderTypes.active
                ? OrderItemActive(orderItem: orderItem)
                : orderItem.orderType == OrderTypes.eligibleForReturn
                    ? OrderItemEligibleForReturn(orderItem: orderItem)
                    : orderItem.orderType == OrderTypes.completed
                        ? OrderItemCompleted(orderItem: orderItem)
                        : SizedBox())
            .toList(),
      ),
    );
  }
}

class OrderItemActive extends StatelessWidget {
  OrderedItemModel orderItem;
  OrderItemActive({required this.orderItem});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
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
                    imageUrl: orderItem.image,
                    height: 80.sp,
                    width: 80.sp,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.sp, vertical: 5.sp),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.black.withOpacity(.2))),
                    child: Text(
                      "QTY: ${orderItem.quantityInCart}",
                      style: TextStyle(fontSize: 18.sp),
                    ),
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
                    orderItem.name,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 7.sp,
                  ),
                  Text(
                    orderItem.shortDescription,
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
                        text: " ${orderItem.rating}/5   ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                            fontSize: 16.sp)),
                    TextSpan(
                        text: orderItem.ratingCount,
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
                        text: "₹${orderItem.offerPrice} ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                            fontSize: 20.sp)),
                    TextSpan(
                        text: " ₹${orderItem.price} ",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black.withOpacity(.2),
                            decoration: TextDecoration.lineThrough)),
                    TextSpan(
                        text: " ${orderItem.discount} % off ",
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
          Divider(
            color: AppColors.black.withOpacity(.2),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: OrdersController.to.activeOrderStatus
                  .map((item) => StepperItem(item: item))
                  .toList(),
            ),
          ),
          Divider(
            color: AppColors.black.withOpacity(.2),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width * .43,
                child: Text(
                  "Delivery by ${DateFormat("EEE MMM dd").format(orderItem.deliveryDate)}",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black.withOpacity(.6)),
                ),
              ),
              Container(
                height: 25.sp,
                width: 1.sp,
                color: AppColors.black.withOpacity(.3),
              ),
              Container(
                width: Get.width * .43,
                alignment: Alignment.center,
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: " Cancel ",
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                      )),
                  WidgetSpan(
                      child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20.sp,
                  ))
                ])),
              )
            ],
          ),
          SizedBox(
            height: 10.sp,
          ),
        ],
      ),
    );
  }
}

class StepperItem extends StatelessWidget {
  String item;
  StepperItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 12.sp,
          right: OrdersController.to.activeOrderStatus.last == item ? null : 0,
          left: OrdersController.to.activeOrderStatus.first == item ? null : 0,
          child: Container(
            height: 1.5.sp,
            color: AppColors.green7,
            width: OrdersController.to.activeOrderStatus.first == item ||
                    OrdersController.to.activeOrderStatus.last == item
                ? 40.sp
                : 75.sp,
          ),
        ),
        Column(
          children: [
            Container(
                padding: EdgeInsets.all(3.sp),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.green7),
                    color: AppColors.green211),
                child: Icon(
                  Icons.check,
                  color: AppColors.green7,
                  size: 18.sp,
                )),
            SizedBox(
              height: 10.sp,
            ),
            Container(
              width: 80.sp,
              alignment: Alignment.center,
              child: Text(
                item,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class OrderItemEligibleForReturn extends StatelessWidget {
  OrderedItemModel orderItem;
  OrderItemEligibleForReturn({required this.orderItem});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
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
                    imageUrl: orderItem.image,
                    height: 80.sp,
                    width: 80.sp,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.sp, vertical: 5.sp),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.black.withOpacity(.2))),
                    child: Text(
                      "QTY: ${orderItem.quantityInCart}",
                      style: TextStyle(fontSize: 18.sp),
                    ),
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
                    orderItem.name,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 7.sp,
                  ),
                  Text(
                    orderItem.shortDescription,
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
                        text: " ${orderItem.rating}/5   ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                            fontSize: 16.sp)),
                    TextSpan(
                        text: orderItem.ratingCount,
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
                        text: "₹${orderItem.offerPrice} ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                            fontSize: 20.sp)),
                    TextSpan(
                        text: " ₹${orderItem.price} ",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black.withOpacity(.2),
                            decoration: TextDecoration.lineThrough)),
                    TextSpan(
                        text: " ${orderItem.discount} % off ",
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
          Divider(
            color: AppColors.black.withOpacity(.2),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width * .43,
                child: Text(
                  "Delivery by ${DateFormat("EEE MMM dd").format(orderItem.deliveryDate)}",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black.withOpacity(.6)),
                ),
              ),
              Container(
                height: 25.sp,
                width: 1.sp,
                color: AppColors.black.withOpacity(.3),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.returns),
                child: Container(
                  width: Get.width * .43,
                  alignment: Alignment.center,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: " Return ",
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                        )),
                    WidgetSpan(
                        child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20.sp,
                    ))
                  ])),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.sp,
          ),
        ],
      ),
    );
  }
}

class OrderItemCompleted extends StatelessWidget {
  OrderedItemModel orderItem;
  OrderItemCompleted({required this.orderItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 30.sp),
      margin: EdgeInsets.only(bottom: 10.sp),
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AppNetworkImage(
                imageUrl: orderItem.image,
                height: 80.sp,
                width: 80.sp,
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: 10.sp,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderItem.name,
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Delivered on ${DateFormat("EEE MMM dd").format(orderItem.deliveryDate)}",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black.withOpacity(.6)),
                  )
                ],
              )
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16.sp,
          )
        ],
      ),
    );
  }
}

class OrderFilterBottomSheet extends StatelessWidget {
  const OrderFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            "Filter By",
            style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 25.sp),
          ),
          SizedBox(
            height: 20.sp,
          ),
          Column(
            children: OrdersController.to.orderFilters
                .map((filterItem) => OrderFilterListingItem(
                      filterItem: filterItem,
                    ))
                .toList(),
          ),
          SizedBox(
            height: 20.sp,
          ),
          AppButton(
            text: "Filter",
            width: 200.sp,
            height: 50.sp,
            onTap: () => Get.back(),
          )
        ],
      ),
    );
  }
}

class OrderFilterListingItem extends StatelessWidget {
  String filterItem;
  OrderFilterListingItem({required this.filterItem});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => OrdersController.to.selectedOrderFilters.value = filterItem,
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10.sp),
              padding: EdgeInsets.all(3.sp),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.black)),
              child: GetX<OrdersController>(builder: (controller) {
                return Icon(
                  Icons.lens,
                  size: 15.sp,
                  color: OrdersController.to.selectedOrderFilters.value ==
                          filterItem
                      ? AppColors.black
                      : Colors.transparent,
                );
              })),
          SizedBox(
            width: 10.sp,
          ),
          Text(
            filterItem,
            style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
