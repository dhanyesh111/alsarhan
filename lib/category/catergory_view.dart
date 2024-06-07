import 'package:alsarhan/app_network_image/app_network_image.dart';
import 'package:alsarhan/assets/icons.dart';
import 'package:alsarhan/category/catergory_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../app_bar/app_bars.dart';
import '../app_colors/app_colors.dart';
import 'catergory_model.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllCategoryAppBar(
        leading: IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: SvgPicture.asset(
            AppIcons.menu,
            color: AppColors.black,
          ),
        ),
        actions: [
          SvgPicture.asset(AppIcons.search),
          SvgPicture.asset(AppIcons.camera),
        ],
      ),
      drawer: CategoryLeftMenu(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
        children: CategoryController.to.categories
            .map((category) => CategoryContainer(category: category))
            .toList(),
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  CategoryListingModel category;
  CategoryContainer({required this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.sp),
      padding: EdgeInsets.all(10.sp),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category.text,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black),
          ),
          GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, childAspectRatio: 100.sp / 130.sp),
            children: category.items
                .map((category) => CategoryContainerItem(
                      category: category,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}

class CategoryLeftMenu extends StatelessWidget {
  const CategoryLeftMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 50.sp),
        width: 150.sp,
        color: AppColors.white,
        child: ListView.separated(
            itemBuilder: (context, index) => LeftMenuCategoryItem(
                  category: CategoryController.to.mainCategories[index],
                ),
            separatorBuilder: (context, index) => Container(
                  color: AppColors.grey204,
                  height: 1,
                ),
            itemCount: CategoryController.to.mainCategories.length));
  }
}

class LeftMenuCategoryItem extends StatelessWidget {
  CategoryItemModel category;
  LeftMenuCategoryItem({required this.category});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CategoryController.to.selectedCategory.value = category,
      child: GetX<CategoryController>(builder: (controller) {
        return Container(
          color: controller.selectedCategory.value == category
              ? AppColors.blue
              : null,
          padding: EdgeInsets.all(18.sp),
          child: Column(
            children: [
              AppNetworkImage(
                imageUrl: category.image,
                height: 40.sp,
                width: 40.sp,
                radius: 40.sp,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 5.sp,
              ),
              Text(category.text)
            ],
          ),
        );
      }),
    );
  }
}

class CategoryContainerItem extends StatelessWidget {
  CategoryItemModel category;
  CategoryContainerItem({required this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.sp),
      child: Column(
        children: [
          AppNetworkImage(
            imageUrl: category.image,
            height: 40.sp,
            width: 40.sp,
            radius: 40.sp,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 5.sp,
          ),
          Text(
            category.text,
            maxLines: 1,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
