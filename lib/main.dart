import 'package:alsarhan/app_colors/app_colors.dart';
import 'package:alsarhan/app_pages/app_pages.dart';
import 'package:alsarhan/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (context, child) {
          return GetMaterialApp(
            theme: ThemeData(scaffoldBackgroundColor: AppColors.grey247),
            title: 'ALSARHAN',
            initialRoute: AppRoutes.landingPage,
            getPages: AppPages.appPages,
          );
        });
  }
}
