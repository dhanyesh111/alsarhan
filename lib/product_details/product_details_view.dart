import 'dart:math';

import 'package:alsarhan/app_bar/app_bars.dart';
import 'package:alsarhan/app_buttons/app_buttons.dart';
import 'package:alsarhan/app_colors/app_colors.dart';
import 'package:alsarhan/app_network_image/app_network_image.dart';
import 'package:alsarhan/assets/icons.dart';
import 'package:alsarhan/product_details/product_details_controller.dart';
import 'package:alsarhan/product_details/product_details_model.dart';
import 'package:alsarhan/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../product_listing/product_listing_view.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey247,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            color: AppColors.white,
            padding: EdgeInsets.all(10.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  width: 60.sp,
                  prefixIcon: SvgPicture.asset(
                    AppIcons.share,
                    color: AppColors.black,
                  ),
                  color: AppColors.white,
                  textColor: AppColors.black,
                  borderColor: AppColors.black,
                  onTap: () => Get.toNamed(AppRoutes.checkOutView),
                ),
                AppButton(
                  width: 150.sp,
                  prefixIcon: SvgPicture.asset(
                    AppIcons.cart,
                    color: AppColors.black,
                  ),
                  text: "Add to cart",
                  color: AppColors.white,
                  textColor: AppColors.black,
                  borderColor: AppColors.black,
                  onTap: () => Get.toNamed(AppRoutes.checkOutView),
                ),
                AppButton(
                  width: 150.sp,
                  text: "Buy Now",
                  color: AppColors.black,
                  textColor: AppColors.white,
                  onTap: () => Get.toNamed(AppRoutes.checkOutView),
                ),
              ],
            ),
          ),
        ],
      ),
      appBar: CustomAppBar(
        title: "Electronics",
      ),
      body: ListView(
        children: [
          Container(
            color: AppColors.white,
            child: AppNetworkImage(
                width: Get.width,
                height: 355.sp,
                fit: BoxFit.contain,
                imageUrl:
                    "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcT971ydlS6Tk1OpXKMVC4BPGJD1Ay9M3EFToAfZRxOWFin1O4cdsKInz_W5hiJz87UfX1oWiBU6fBrdSPZCMAYAPAqYYWowE_RwS03siwyqo8Dy47dFlkk4EXQ&usqp=CAE"),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectVarients(),
              SizedBox(
                height: 10.sp,
              ),
              ProductInfo(),
              SizedBox(
                height: 10.sp,
              ),
              BuyTogetherAndSaveMore(),
              SizedBox(
                height: 10.sp,
              ),
              AddressContainer(),
              SizedBox(
                height: 10.sp,
              ),
              AvalibleOffers(),
              SizedBox(
                height: 10.sp,
              ),
              Highlights(),
              SizedBox(
                height: 10.sp,
              ),
              Specifications(),
              SizedBox(
                height: 10.sp,
              ),
              ProductRating(),
              SizedBox(
                height: 10.sp,
              ),
              SellerDetails(),
              SizedBox(
                height: 90.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddressContainer extends StatelessWidget {
  const AddressContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        children: [
          SizedBox(
            height: 20.sp,
          ),
          Text(
            "Chakkalakkal H, Palakkam poyil, Kumaranellur PO, Mukkam, Kozhikode 673602",
            style: TextStyle(
                fontSize: 14.sp, color: AppColors.black.withOpacity(.5)),
          ),
        ],
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Bose Quiet comfort 45 Bluetooth Wireless Noise Cancelling Headphone",
              style: TextStyle(fontSize: 18.sp),
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          RichText(
              text: TextSpan(children: [
            WidgetSpan(child: StarBuilder()),
            TextSpan(
                text: " 4.9/5   ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                    fontSize: 16.sp)),
            TextSpan(
                text: "23,3464",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.black,
                ))
          ])),
          SizedBox(
            height: 10.sp,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
            child: Text(
              "Festive offer price",
              style: TextStyle(color: AppColors.white),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppIcons.tripzeam), fit: BoxFit.fill)),
          ),
          SizedBox(
            height: 10.sp,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "${10}% off  ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.green7,
                    fontSize: 20.sp)),
            TextSpan(
                text: "₹${25000} ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                    fontSize: 20.sp)),
            TextSpan(
                text: " ₹${27000} ",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black.withOpacity(.2),
                    decoration: TextDecoration.lineThrough)),
          ])),
          SizedBox(
            height: 10.sp,
          ),
          Text(
            "+ ₹29 installation charges",
            style: TextStyle(
                fontSize: 14.sp, color: AppColors.black.withOpacity(.6)),
          ),
        ],
      ),
    );
  }
}

class SelectVarients extends StatelessWidget {
  const SelectVarients({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.sp,
          ),
          Text(
            "SELECT VARIANT",
            style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 35.sp,
          ),
          Column(
              children: ProductDetailsController.to.variants
                  .map((e) => Container(
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: AppColors.black.withOpacity(.2)))),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.sp, vertical: 15.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  e.name,
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: AppColors.black.withOpacity(.6)),
                                ),
                                Text(
                                  " ${e.value}",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "${e.numberOfOptions} More ",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: AppColors.black.withOpacity(.6)),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: AppColors.black.withOpacity(.6),
                                ),
                              ],
                            )
                          ],
                        ),
                      ))
                  .toList()),
        ],
      ),
    );
  }
}

class SellerDetails extends StatelessWidget {
  const SellerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SELLER DETAILS",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.black.withOpacity(.5)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "SVPeripherals",
                style: TextStyle(
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blue40),
              ),
              SizedBox(
                width: 50.sp,
              ),
              AppButton(
                width: 80.sp,
                height: 35.sp,
                text: "4.9 ",
                textColor: AppColors.blue40,
                radius: 40.sp,
                color: Colors.transparent,
                borderColor: AppColors.blue40,
                suffixIcon: Icon(
                  Icons.star,
                  size: 18.sp,
                  color: AppColors.blue40,
                ),
              ),
            ],
          ),
          Text(
            "7 Days Service Center Replacement/Repair\nGST invoice available",
          )
        ],
      ),
    );
  }
}

class ProductRating extends StatelessWidget {
  const ProductRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ratings & Reviews",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              AppButton(
                width: 120.sp,
                height: 40.sp,
                text: "Rate Now",
                color: Colors.transparent,
                borderColor: AppColors.black.withOpacity(.5),
                radius: 50.sp,
                textColor: AppColors.black,
              ),
            ],
          ),
          SizedBox(
            height: 30.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.green7,
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        Text(
                          " 4.9/5",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text(
                      "7,67,567 Rating",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text(
                      "51,343 Reviews",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30.sp),
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                  color: AppColors.black,
                ))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(5, (index) => index + 1)
                      .reversed
                      .map((e) => Row(
                            children: [
                              Text(e.toString()),
                              SizedBox(
                                width: 10.sp,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.black.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                                width: 160.sp,
                                height: 3.sp,
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: e > 3
                                        ? AppColors.green7
                                        : AppColors.brown88,
                                    borderRadius: BorderRadius.circular(10.sp),
                                  ),
                                  width: Random().nextInt(140).sp,
                                ),
                              ),
                              SizedBox(
                                width: 20.sp,
                              ),
                              Text(Random().nextInt(1040).toString()),
                            ],
                          ))
                      .toList(),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30.sp,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.sp),
            child: GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 15.sp,
                crossAxisSpacing: 15.sp,
                childAspectRatio: 120.sp / 80.sp,
              ),
              children: List.generate(10, (index) => index)
                  .map((e) => AppNetworkImage(
                      imageUrl:
                          "https://cdn.mos.cms.futurecdn.net/46EU8v5PpUUojSxMkTr4XQ.jpg"))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class Highlights extends StatelessWidget {
  const Highlights({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Highlights",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ProductDetailsController.to.hightLights
                .map((hightLight) =>
                    HighlightsListingItem(hightLight: hightLight))
                .toList(),
          )
        ],
      ),
    );
  }
}

class Specifications extends StatelessWidget {
  const Specifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SPECIFICATIONS",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ProductDetailsController.to.specication
                .map((specification) =>
                    SpecificationsListingItem(specification: specification))
                .toList(),
          )
        ],
      ),
    );
  }
}

class HighlightsListingItem extends StatelessWidget {
  HightLightsModel hightLight;
  HighlightsListingItem({
    required this.hightLight,
  });
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: hightLight.text,
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.black),
            children: [
          TextSpan(
            text: " : ${hightLight.value}",
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black),
          )
        ]));
  }
}

class SpecificationsListingItem extends StatelessWidget {
  SpecificationModel specification;
  SpecificationsListingItem({
    required this.specification,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width * .45,
            child: Text(specification.text,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w300,
                    color: AppColors.black)),
          ),
          Container(
            width: Get.width * .45,
            child: Text("${specification.value}",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black)),
          ),
        ],
      ),
    );
  }
}

class AvalibleOffers extends StatelessWidget {
  const AvalibleOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Available offers",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black),
          ),
          Container(
            height: 100.sp,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: ProductDetailsController.to.offerCards
                  .map((e) => Container(
                        margin: EdgeInsets.only(right: 10.sp),
                        child: AppNetworkImage(
                            height: 100.sp, width: Get.width, imageUrl: e),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class BuyTogetherAndSaveMore extends StatelessWidget {
  const BuyTogetherAndSaveMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      width: Get.width,
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "BUY TOGETHER & SAVE MORE",
            style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w700),
          ),
          Container(
            height: 310.sp,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: ProductDetailsController.to.buyTogetherProducts
                  .map((product) => ButTogetherProductContainer(
                        product: product,
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class ButTogetherProductContainer extends StatelessWidget {
  BuyTogetherProductModel product;
  ButTogetherProductContainer({required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.sp,
      padding: EdgeInsets.symmetric(vertical: 15.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.sp),
          border: Border.all(color: AppColors.black.withOpacity(.2))),
      child: Column(
        children: [
          AppNetworkImage(
              height: 100.sp,
              width: 90.sp,
              fit: BoxFit.contain,
              imageUrl: product.image),
          SizedBox(
            height: 30.sp,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.sp,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 5.sp,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "₹${25000} ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                          fontSize: 18.sp)),
                  TextSpan(
                      text: " ₹${27000} ",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black.withOpacity(.2),
                          decoration: TextDecoration.lineThrough)),
                ])),
                Text("${10}% off  ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.green7,
                        fontSize: 20.sp)),
              ],
            ),
          ),
          Divider(),
          Text("+ ADD",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  fontSize: 18.sp)),
        ],
      ),
    );
  }
}
