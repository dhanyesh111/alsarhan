import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_colors/app_colors.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final double? radius;
  final bool? isProfile;
  final BoxFit? fit;
  final bool? dontUseBaseUrl;

  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.radius,
    this.fit,
    this.dontUseBaseUrl,
    this.isProfile,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0),
      child: Image.network(
        imageUrl,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return (isProfile ?? false)
              ? Container(
                  padding: EdgeInsets.all(7.sp),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white),
                      shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    // AppIcons.user,
                    "",
                    color: AppColors.white,
                    height: (height ?? 50.sp) - 14,
                    width: (width ?? 50.sp) - 14,
                  ),
                )
              : Icon(
                  Icons.broken_image_rounded,
                  color: AppColors.black,
                );
        },
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Container(
            height: height,
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius ?? 10),
                color: AppColors.brown88.withOpacity(.1)),
            child: CircularProgressIndicator(
              color: AppColors.black,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        height: height,
        fit: fit ?? BoxFit.fill,
        width: width,
      ),
    );
  }
}
