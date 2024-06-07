import 'package:alsarhan/app_bar/app_bars.dart';
import 'package:alsarhan/app_buttons/app_buttons.dart';
import 'package:alsarhan/app_colors/app_colors.dart';
import 'package:alsarhan/return/return_controller.dart';
import 'package:alsarhan/return/return_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../app_network_image/app_network_image.dart';

class ReturnView extends StatelessWidget {
  const ReturnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Returns"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 25.sp),
        children: [
          Column(
            children: ReturnController.to.orderHistory
                .map((status) => ReturnOrderItem(status: status))
                .toList(),
          ),
          SizedBox(
            height: 50.sp,
          ),
          Row(
            children: [
              AppButton(
                text: "Start Return",
                width: 200.sp,
                onTap: () => Get.bottomSheet(SelectReasonForCancelBottomSheet(),
                    isScrollControlled: true),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SelectReasonForCancelBottomSheet extends StatelessWidget {
  const SelectReasonForCancelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.sp),
            topLeft: Radius.circular(30.sp),
          )),
      padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 20.sp,
          ),
          Text(
            "Why are you returning this product?",
            style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 25.sp),
          ),
          SizedBox(
            height: 30.sp,
          ),
          Column(
            children: ReturnController.to.reasonForReturn
                .map((reason) => SelectReasonForCancelListingItem(
                      reason: reason,
                    ))
                .toList(),
          ),
          SizedBox(
            height: 20.sp,
          ),
          AppButton(
            text: "Return",
            width: 200.sp,
            height: 60.sp,
            onTap: () => Get.back(),
          )
        ],
      ),
    );
  }
}

class SelectReasonForCancelListingItem extends StatelessWidget {
  String reason;
  SelectReasonForCancelListingItem({required this.reason});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ReturnController.to.selectedReasonForReturn.value = reason,
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10.sp),
              padding: EdgeInsets.all(3.sp),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.black)),
              child: GetX<ReturnController>(builder: (controller) {
                return Icon(
                  Icons.lens,
                  size: 15.sp,
                  color: ReturnController.to.selectedReasonForReturn.value ==
                          reason
                      ? AppColors.black
                      : Colors.transparent,
                );
              })),
          SizedBox(
            width: 10.sp,
          ),
          Text(
            reason,
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

class ReturnOrderItem extends StatelessWidget {
  OrderReturnStatusItemModel status;
  ReturnOrderItem({required this.status});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 0,
            bottom: 0,
            left: 10.sp,
            child: Container(
              color: AppColors.green7,
              width: 2,
            )),
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: ReturnController.to.orderHistory.first == status ? 0 : 20,
                bottom:
                    ReturnController.to.orderHistory.last == status ? 0 : 20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.all(3.sp),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grey247,
                          border: Border.all(color: AppColors.green7)),
                      child: Icon(
                        Icons.lens,
                        size: 15.sp,
                        color: AppColors.green7,
                      )),
                  SizedBox(
                    width: 20.sp,
                  ),
                  Container(
                    width: 170.sp,
                    child: Text(
                      status.status,
                      style: TextStyle(
                          fontSize: 18.sp,
                          height: 1,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: 20.sp,
                  ),
                  Icon(
                    Icons.lens,
                    size: 8.sp,
                    color: AppColors.black.withOpacity(.8),
                  ),
                  SizedBox(
                    width: 20.sp,
                  ),
                  Text(
                    DateFormat("dd/MM/yyyy").format(status.date),
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.black.withOpacity(.5)),
                  ),
                ],
              ),
            ),
            ReturnController.to.orderHistory.first == status
                ? Container(
                    width: 340.sp,
                    padding: EdgeInsets.all(15.sp),
                    margin: EdgeInsets.only(bottom: 10.sp, left: 20.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        border: Border.all(
                          color: AppColors.black.withOpacity(.1),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                AppNetworkImage(
                                  imageUrl: ReturnController.to.product.image,
                                  height: 75.sp,
                                  width: 75.sp,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.sp, vertical: 5.sp),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              AppColors.black.withOpacity(.2))),
                                  child: Text(
                                    "QTY: ${ReturnController.to.product.quantityInCart}",
                                    style: TextStyle(fontSize: 16.sp),
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
                                Container(
                                  width: 200.sp,
                                  child: Text(
                                    ReturnController.to.product.name,
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
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
                                      text:
                                          " ${ReturnController.to.product.rating}/5   ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.black,
                                          fontSize: 16.sp)),
                                  TextSpan(
                                      text: ReturnController
                                          .to.product.ratingCount,
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
                                      text:
                                          "₹${ReturnController.to.product.offerPrice} ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.black,
                                          fontSize: 20.sp)),
                                  TextSpan(
                                      text:
                                          " ₹${ReturnController.to.product.price} ",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              AppColors.black.withOpacity(.2),
                                          decoration:
                                              TextDecoration.lineThrough)),
                                  TextSpan(
                                      text:
                                          " ${ReturnController.to.product.discount} % off ",
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
                          height: 10.sp,
                        ),
                      ],
                    ),
                  )
                : SizedBox()
          ],
        ),
      ],
    );
  }
}
