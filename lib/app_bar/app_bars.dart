import 'package:alsarhan/assets/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_colors/app_colors.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final double? height;
  final PreferredSizeWidget? bottom;
  const HomePageAppBar({
    Key? key,
    this.title,
    this.actions,
    this.height,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.brown88,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      elevation: 0,
      backgroundColor: AppColors.brown88,
      automaticallyImplyLeading: true,
      bottom: bottom,
      leading: Container(
          padding: EdgeInsets.all(15.sp),
          child: SvgPicture.asset(AppIcons.menu)),
      title: Text("AlSarhan",
          style: TextStyle(
              fontSize: 30.sp,
              color: AppColors.white,
              fontWeight: FontWeight.w700)),
      actions: (actions ?? [])
          .map((action) => Container(
                padding: EdgeInsets.all(15.sp),
                child: action,
              ))
          .toList(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 120.sp);
}

class AllCategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final double? height;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  const AllCategoryAppBar({
    Key? key,
    this.title,
    this.actions,
    this.leading,
    this.height,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      elevation: 0,
      backgroundColor: AppColors.white,
      automaticallyImplyLeading: true,
      bottom: bottom,
      leading: leading,
      title: Text("All Category",
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700)),
      actions: (actions ?? [])
          .map((action) => Container(
                padding: EdgeInsets.all(12.sp),
                child: action,
              ))
          .toList(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 70.sp);
}

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final double? height;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  const CartAppBar({
    Key? key,
    this.title,
    this.actions,
    this.leading,
    this.height,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      elevation: 0,
      backgroundColor: AppColors.white,
      automaticallyImplyLeading: true,
      bottom: bottom,
      leading: leading,
      title: Text("Cart",
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700)),
      actions: (actions ?? [])
          .map((action) => Container(
                padding: EdgeInsets.all(12.sp),
                child: action,
              ))
          .toList(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 70.sp);
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final double? height;
  final PreferredSizeWidget? bottom;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.height,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      elevation: 0,
      backgroundColor: AppColors.white,
      automaticallyImplyLeading: true,
      bottom: bottom,
      title: Text(title.toUpperCase(),
          style: TextStyle(
              fontSize: 20.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w700)),
      actions: (actions ?? [])
          .map((action) => Container(
                padding: EdgeInsets.all(15.sp),
                child: action,
              ))
          .toList(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 70.sp);
}
