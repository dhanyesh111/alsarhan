import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors/app_colors.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? radius;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final void Function()? onTap;
  final bool? isLoading;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  const AppButton({
    super.key,
    this.text,
    this.height,
    this.fontSize,
    this.onTap,
    this.prefixIcon,
    this.color,
    this.textColor,
    this.borderColor,
    this.width,
    this.radius,
    this.isLoading,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: GestureDetector(
        onTap: (isLoading ?? false) ? null : onTap,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: (isLoading ?? false) ? height ?? 60.sp : height ?? 60.sp,
            width: (isLoading ?? false) ? height ?? 60.sp : width ?? 400.sp,
            decoration: BoxDecoration(
              border: Border.all(color: borderColor ?? Colors.transparent),
              borderRadius: BorderRadius.circular(
                  (isLoading ?? false) ? 55.sp : radius ?? 8.sp),
              color: color ?? AppColors.brown88,
            ),
            child: Center(
              child: isLoading ?? false
                  ? CircularProgressIndicator(
                      color: AppColors.white,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        prefixIcon != null
                            ? Container(
                                padding: EdgeInsets.only(right: 10.sp),
                                child: prefixIcon,
                              )
                            : const SizedBox(),
                        text != null
                            ? Text(
                                text ?? "",
                                style: TextStyle(
                                    fontSize: fontSize ?? 16.sp,
                                    color: textColor ?? AppColors.white),
                              )
                            : SizedBox(),
                        suffixIcon != null
                            ? Container(
                                padding: EdgeInsets.only(left: 10.sp),
                                child: suffixIcon,
                              )
                            : const SizedBox(),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class CircleWithIcon extends StatelessWidget {
  final Widget child;
  final double height;
  final void Function()? onTap;
  final Color color;
  final bool? enableBorder;
  const CircleWithIcon({
    super.key,
    required this.height,
    required this.child,
    required this.color,
    this.enableBorder,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: height,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(
                color: enableBorder ?? false
                    ? AppColors.grey93
                    : AppColors.white.withOpacity(0))),
        child: Center(child: child),
      ),
    );
  }
}
