import 'package:alsarhan/app_bar/app_bars.dart';
import 'package:alsarhan/app_buttons/app_buttons.dart';
import 'package:alsarhan/app_colors/app_colors.dart';
import 'package:alsarhan/app_text_from_field/app_text_form_fields.dart';
import 'package:alsarhan/assets/icons.dart';
import 'package:alsarhan/check_out/check_out_controller.dart';
import 'package:alsarhan/routes/routes.dart';
import 'package:alsarhan/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../app_network_image/app_network_image.dart';
import '../cart/cart_view.dart';
import 'check_out_model.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "ChechOut",
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        children: [
          SizedBox(
            height: 10.sp,
          ),
          StepperItemCheckOut(),
          SizedBox(
            height: 10.sp,
          ),
          AddressCheckOut(),
          SizedBox(
            height: 10.sp,
          ),
          CheckOutProductList(),
          SizedBox(
            height: 10.sp,
          ),
          PriceDetails(),
          SizedBox(
            height: 10.sp,
          ),
          ContactInfo(),
          SizedBox(
            height: 10.sp,
          ),
          PaymenyOptions(),
          SizedBox(
            height: 10.sp,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(AppIcons.safeAndSecure),
                SizedBox(
                  width: 30.sp,
                ),
                Container(
                  width: 300.sp,
                  child: Text(
                    "Safe and secure payments. Easy returns. 100% Authentic Products",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.sp,
          ),
        ],
      ),
    );
  }
}

class PaymenyOptions extends StatelessWidget {
  const PaymenyOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.all(15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("PAYMENT METHOD",
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              )),
          SizedBox(
            height: 20.sp,
          ),
          Column(
            children: CheckOutController.to.paymentMethod
                .map((method) => PaymentMethodListingItem(
                      method: method,
                    ))
                .toList(),
          ),
          SizedBox(
            height: 20.sp,
          ),
          AppButton(
              text: "Pay 10234",
              onTap: () => Get.offAllNamed(AppRoutes.landingPage)),
        ],
      ),
    );
  }
}

class PaymentMethodListingItem extends StatelessWidget {
  String method;
  PaymentMethodListingItem({required this.method});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CheckOutController.to.selectedPaymentMethod.value = method,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration:
                    BoxDecoration(border: Border.all(), shape: BoxShape.circle),
                padding: EdgeInsets.all(5.sp),
                child: GetX<CheckOutController>(builder: (controller) {
                  return Icon(
                    Icons.lens,
                    size: 13.sp,
                    color: controller.selectedPaymentMethod.value == method
                        ? AppColors.black
                        : Colors.transparent,
                  );
                }),
              ),
              SizedBox(
                width: 10.sp,
              ),
              Text(
                method,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 10.sp,
          ),
          GetX<CheckOutController>(builder: (controller) {
            return controller.selectedPaymentMethod.value ==
                        "Credit/Debit card" &&
                    method == "Credit/Debit card"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextFormField(
                        fillColor: AppColors.white,
                        controller: CheckOutController.to.controllerCardNumber,
                        header: "Card Number",
                        validator: (value) => Validators.isEmpty(value: value),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Text("Expiry Date"),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Get.width * .4,
                            child: AppDropDownFormField(
                                header: "Month",
                                onChange: (month) =>
                                    CheckOutController.to.expiryMonth = month,
                                value: CheckOutController.to.expiryMonth,
                                itemList:
                                    List.generate(12, (index) => index + 1)
                                        .toList(),
                                label: (month) => month.toString()),
                          ),
                          Container(
                            width: Get.width * .4,
                            child: AppDropDownFormField(
                                header: "Year",
                                onChange: (year) =>
                                    CheckOutController.to.expiryYear = year,
                                value: CheckOutController.to.expiryMonth,
                                itemList: List.generate(10,
                                        (index) => DateTime.now().year + index)
                                    .toList(),
                                label: (year) => year.toString()),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.sp,
                      )
                    ],
                  )
                : SizedBox();
          })
        ],
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.all(15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("EMAIL",
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              )),
          Text("Order confirmation email will be sent to",
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.black,
              )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 250.sp, child: CheckOutFormField()),
              AppButton(
                width: 100.sp,
                height: 45.sp,
                text: "Update",
                textColor: AppColors.black,
                color: Colors.transparent,
                borderColor: AppColors.black,
                radius: 0,
              )
            ],
          )
        ],
      ),
    );
  }
}

class PriceDetails extends StatelessWidget {
  const PriceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.all(15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("PRICE DETAILS",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              )),
          SizedBox(
            height: 20.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price (1 item)",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "₹10999",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 10.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Discount",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "₹10999",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.green7,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 10.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery Charges",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500),
              ),
              RichText(
                text: TextSpan(
                    text: "₹40 ",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.black.withOpacity(.5),
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough),
                    children: [
                      TextSpan(
                          text: "FREE Delivery",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.green7,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500))
                    ]),
              ),
            ],
          ),
          SizedBox(
            height: 10.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Installation Charges",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "₹40",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.green7,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 10.sp,
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Amount",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "₹42320",
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(),
          SizedBox(
            height: 10.sp,
          ),
          Text(
            "You will save ₹4999 on this order",
            style: TextStyle(
              fontSize: 18.sp,
              color: AppColors.green7,
            ),
          )
        ],
      ),
    );
  }
}

class CheckOutFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: CheckOutController.to.controllerEmail,
      style: TextStyle(fontSize: 18.sp, color: AppColors.black),
      validator: (value) => Validators.isEMail(value: value),
      keyboardType: TextInputType.emailAddress,
      smartDashesType: SmartDashesType.enabled,
      decoration: InputDecoration(
        isDense: false,
        labelText: "Email",
        floatingLabelStyle: TextStyle(
            fontSize: 18.sp,
            color: AppColors.grey122,
            fontWeight: FontWeight.w600),
        labelStyle: TextStyle(
          fontSize: 16.sp,
          color: AppColors.grey204,
        ),
        counterText: "",
        contentPadding:
            EdgeInsets.symmetric(horizontal: 18.sp, vertical: 10.sp),
        alignLabelWithHint: true,
        filled: true,
        fillColor: AppColors.white,
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey204)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey204)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey204)),
        disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey204)),
      ),
    );
  }
}

class AddressCheckOut extends StatelessWidget {
  const AddressCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ADDRESS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              SizedBox(
                height: 35.sp,
              ),
              AppButton(
                color: AppColors.blue40.withOpacity(.2),
                text: "Home",
                radius: 60.sp,
                textColor: AppColors.blue40,
                width: 60.sp,
                height: 30.sp,
              )
            ],
          ),
          RichText(
              text: TextSpan(
                  text: "Dhanyesh",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                TextSpan(
                  text:
                      "   Flat No : C6 b kozhikode Thazhecode, Kerala - 673602",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ]))
        ],
      ),
    );
  }
}

class CheckOutProductList extends StatelessWidget {
  const CheckOutProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<CheckOutController>(builder: (controller) {
      return Column(
        children: CheckOutController.to.products
            .map((product) => ProductListingContainerItemCheckOut(
                  product: product,
                ))
            .toList(),
      );
    });
  }
}

class ProductListingContainerItemCheckOut extends StatelessWidget {
  ProductItemCheckOutModel product;
  ProductListingContainerItemCheckOut({required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      margin: EdgeInsets.only(bottom: 10.sp),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckOutController.to.products.length != 1
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        CheckOutController.to.products.remove(product);
                      },
                      child: Text(
                        "REMOVE",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                )
              : SizedBox(),
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
        ],
      ),
    );
  }
}

class StepperItemCheckOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 24.sp,
              width: 24.sp,
              decoration: BoxDecoration(
                  color: AppColors.blue40.withOpacity(.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.blue40)),
              child: Icon(
                Icons.check,
                color: AppColors.blue40,
                size: 15.sp,
              ),
            ),
            Container(
              height: 2,
              width: 120.sp,
              color: AppColors.blue40,
            ),
            Container(
                height: 24.sp,
                width: 24.sp,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.blue40,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.blue40)),
                child: Text(
                  "2",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: AppColors.white),
                )),
            Container(
              height: 2,
              width: 120.sp,
              color: AppColors.black.withOpacity(.1),
            ),
            Container(
                height: 24.sp,
                width: 24.sp,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(.1),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.black.withOpacity(.2),
                    )),
                child: Text(
                  "3",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black.withOpacity(.2),
                  ),
                )),
          ],
        ),
        SizedBox(
          height: 20.sp,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ["Address", "Order Summary", "Payment"]
              .map((e) => Container(
                    width: 130.sp,
                    child: Text(
                      e,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black.withOpacity(.5)),
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }
}
