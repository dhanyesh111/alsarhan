import 'package:alsarhan/app_colors/app_colors.dart';
import 'package:alsarhan/app_network_image/app_network_image.dart';
import 'package:alsarhan/assets/icons.dart';
import 'package:alsarhan/count_down/count_down_view.dart';
import 'package:alsarhan/homepage/homepage_controller.dart';
import 'package:alsarhan/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../app_bar/app_bars.dart';
import '../left_menu/left_menu_view.dart';
import 'homepage_model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LeftMenu(),
      appBar: HomePageAppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25.sp),
          child: Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
            alignment: Alignment.center,
            color: AppColors.white.withOpacity(.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                      child: SvgPicture.asset(
                        AppIcons.location,
                        height: 18.sp,
                      ),
                    ),
                    TextSpan(
                        text: "  Deliver to Muhammed ",
                        style:
                            TextStyle(color: AppColors.white, fontSize: 16.sp)),
                    TextSpan(
                        text: "Thazhekode 673602",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700)),
                  ]),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.white,
                )
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 20.sp),
        children: [
          TopCategoriesContainer(),
          SizedBox(
            height: 40.sp,
          ),
          PopularStores(),
          SizedBox(
            height: 10.sp,
          ),
          AppNetworkImage(
            imageUrl: HomePageController.to.mainPoster,
            height: 150.sp,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 25.sp,
          ),
          ExclusiveDeals(),
          SizedBox(
            height: 20.sp,
          ),
          SuggestedForYou(),
          SizedBox(
            height: 20.sp,
          ),
          ExploreTheBest(),
          SizedBox(
            height: 20.sp,
          ),
          AppNetworkImage(
            imageUrl: HomePageController.to.secondPoster,
            height: 250.sp,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20.sp,
          ),
          AppNetworkImage(
            imageUrl: HomePageController.to.thirdPoster,
            height: 250.sp,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 40.sp,
          ),
        ],
      ),
    );
  }
}

class ExploreTheBest extends StatelessWidget {
  const ExploreTheBest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Explore the best",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 10.sp,
        ),
        GridView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 120 / 210, crossAxisCount: 3),
          children: HomePageController.to.exploreTheBest
              .map((product) => ExploreTheBestListingItem(product: product))
              .toList(),
        ),
      ],
    );
  }
}

class ExploreTheBestListingItem extends StatelessWidget {
  ExploreTheBestModel product;
  ExploreTheBestListingItem({required this.product});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.productListing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppNetworkImage(
            imageUrl: product.image,
            height: 120.sp,
            width: 120.sp,
          ),
          RichText(
              text: TextSpan(
                  text: "${product.text}\n",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w700),
                  children: [
                TextSpan(
                    text: "From\n",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColors.black)),
                TextSpan(
                    text: "₹ ${product.price}",
                    style: TextStyle(color: AppColors.green7))
              ]))
        ],
      ),
    );
  }
}

class ExclusiveDeals extends StatelessWidget {
  const ExclusiveDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Exclusive Deals",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                AppCountDown(endDate: DateTime.now().add(Duration(hours: 8))),
                SizedBox(
                  width: 5.sp,
                ),
                Icon(
                  Icons.timer_outlined,
                  size: 22.sp,
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 10.sp,
        ),
        SizedBox(
            height: 320.sp,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: HomePageController.to.exclusiveDeals
                  .map(
                    (deal) => ExclusiveDealsListingItem(
                      deal: deal,
                    ),
                  )
                  .toList(),
            ))
      ],
    );
  }
}

class ExclusiveDealsListingItem extends StatelessWidget {
  ExclusiveDealsModel deal;
  ExclusiveDealsListingItem({required this.deal});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.productDetails),
      child: Container(
        padding: EdgeInsets.only(right: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppNetworkImage(
              imageUrl: deal.image,
              height: 250.sp,
              width: 200.sp,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              deal.text,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17.sp),
            ),
            Text(
              "Up-to ${deal.discountPercent}% off",
              style: TextStyle(
                  color: AppColors.green7,
                  fontWeight: FontWeight.w700,
                  fontSize: 17.sp),
            ),
          ],
        ),
      ),
    );
  }
}

class SuggestedForYou extends StatelessWidget {
  const SuggestedForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Suggested For You",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 10.sp,
        ),
        SizedBox(
            height: 320.sp,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: HomePageController.to.suggestedForYou
                  .map(
                    (suggestedItem) => SuggestedForYouListingItem(
                      suggestedItem: suggestedItem,
                    ),
                  )
                  .toList(),
            ))
      ],
    );
  }
}

class SuggestedForYouListingItem extends StatelessWidget {
  SuggestedForYouModel suggestedItem;
  SuggestedForYouListingItem({required this.suggestedItem});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.productListing),
      child: Container(
        padding: EdgeInsets.only(right: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppNetworkImage(
              imageUrl: suggestedItem.image,
              height: 250.sp,
              width: 200.sp,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              suggestedItem.text,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17.sp),
            ),
            Text(
              "Up-to ${suggestedItem.discountPercent}% off",
              style: TextStyle(
                  color: AppColors.green7,
                  fontWeight: FontWeight.w700,
                  fontSize: 17.sp),
            ),
          ],
        ),
      ),
    );
  }
}

class TopCategoriesContainer extends StatelessWidget {
  const TopCategoriesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.sp,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              Text(HomePageController.to.topCategories[index]),
          separatorBuilder: (context, index) => Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Text("+")),
          itemCount: HomePageController.to.topCategories.length),
    );
  }
}

class PopularStores extends StatelessWidget {
  const PopularStores({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular stores",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10.sp,
          ),
          SizedBox(
              height: 115.sp,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemExtent: 100.sp,
                children: HomePageController.to.popularStores
                    .map(
                      (store) => PopularStoreListingItem(
                        store: store,
                      ),
                    )
                    .toList(),
              ))
        ],
      ),
    );
  }
}

class PopularStoreListingItem extends StatelessWidget {
  PopularStoresModel store;
  PopularStoreListingItem({super.key, required this.store});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.productListing),
      child: Column(
        children: [
          Container(
            height: 85.sp,
            width: 85.sp,
            padding: EdgeInsets.all(1.sp),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(255, 221, 44, 1),
                  Color.fromRGBO(255, 19, 132, 1),
                  Color.fromRGBO(36, 83, 252, 1),
                  Color.fromRGBO(180, 25, 253, 1)
                ])),
            child: Container(
              margin: EdgeInsets.all(1.sp),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.grey247, shape: BoxShape.circle),
              child: AppNetworkImage(
                imageUrl: store.image,
                height: 70.sp,
                width: 70.sp,
                fit: BoxFit.fill,
                radius: 40.sp,
              ),
            ),
          ),
          SizedBox(
            height: 5.sp,
          ),
          Text(
            store.text,
            style: const TextStyle(fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
