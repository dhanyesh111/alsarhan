import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors/app_colors.dart';

class AppCountDown extends StatelessWidget {
  final DateTime endDate;
  final String? text;
  final String? format;
  final void Function()? onEnd;
  const AppCountDown(
      {super.key, required this.endDate, this.onEnd, this.format, this.text});
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        onEnd: onEnd,
        tween: Tween(
            begin: endDate.difference(DateTime.now()), end: Duration.zero),
        duration: endDate.difference(DateTime.now()),
        builder: (context, Duration date, child) {
          return Text(
            date.toString().substring(0, 7),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.red255,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp),
          );
        });
  }
}
