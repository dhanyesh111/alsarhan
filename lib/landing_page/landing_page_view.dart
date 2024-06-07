import 'package:alsarhan/app_colors/app_colors.dart';
import 'package:alsarhan/assets/icons.dart';
import 'package:alsarhan/landing_page/landing_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../cart/cart_view.dart';
import '../category/catergory_view.dart';
import '../homepage/homepage_view.dart';
import '../wishlist/wishlist_view.dart';
import 'landing_page_model.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SearchButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: LandingPageController.to.pageController,
        children: [HomePageView(), CategoryView(), WishListView(), CartView()],
      ),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.grey247, boxShadow: [
        BoxShadow(
            color: AppColors.black.withOpacity(.1),
            offset: Offset(2, 0),
            spreadRadius: 2,
            blurRadius: 2)
      ]),
      padding: EdgeInsets.symmetric(horizontal: 35.sp, vertical: 15.sp),
      height: 70.sp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: LandingPageController.to.bottomNavigationBarItem
            .map((item) => BottomNavigationBarItemContainer(item: item))
            .toList(),
      ),
    );
  }
}

class BottomNavigationBarItemContainer extends StatelessWidget {
  BottomNavigationBarItemModel item;
  BottomNavigationBarItemContainer({required this.item});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => LandingPageController.to.changeCurrentPage(
          index:
              LandingPageController.to.bottomNavigationBarItem.indexOf(item)),
      child: Column(
        children: [
          GetX<LandingPageController>(builder: (controller) {
            return SvgPicture.asset(
              item.icon,
              color: controller.bottomNavigationBarItem.indexOf(item) ==
                      controller.currentIndex.value
                  ? AppColors.brown88
                  : AppColors.grey204,
            );
          }),
          Text(
            item.text,
            style: TextStyle(fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.sp),
        decoration: BoxDecoration(
          color: AppColors.brown88,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          AppIcons.search,
          height: 24.sp,
          width: 24.sp,
        ));
  }
}
