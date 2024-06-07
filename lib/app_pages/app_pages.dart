import 'package:alsarhan/create_account/create_account_controller.dart';
import 'package:alsarhan/create_account/create_account_view.dart';
import 'package:alsarhan/forgot_password/forgot_password_controller.dart';
import 'package:alsarhan/forgot_password/forgot_password_view.dart';
import 'package:alsarhan/landing_page/landing_page_controller.dart';
import 'package:alsarhan/landing_page/landing_page_view.dart';
import 'package:alsarhan/login/login_controller.dart';
import 'package:alsarhan/login/login_view.dart';
import 'package:alsarhan/orders/orders_controller.dart';
import 'package:alsarhan/orders/orders_view.dart';
import 'package:alsarhan/product_details/product_details_controller.dart';
import 'package:alsarhan/product_details/product_details_view.dart';
import 'package:alsarhan/product_listing/product_listing_controller.dart';
import 'package:alsarhan/return/return_controller.dart';
import 'package:alsarhan/return/return_view.dart';
import 'package:alsarhan/routes/routes.dart';
import 'package:alsarhan/splash/splash_controller.dart';
import 'package:alsarhan/splash/splash_view.dart';
import 'package:get/get.dart';

import '../check_out/check_out_controller.dart';
import '../check_out/check_out_view.dart';
import '../coupon/coupon_controller.dart';
import '../coupon/coupon_view.dart';
import '../product_listing/product_listing_view.dart';

class AppPages {
  static List<GetPage> appPages = [
    GetPage(
        name: AppRoutes.splash,
        page: () => SplashView(),
        binding: SplashControllerBinding()),
    GetPage(
        name: AppRoutes.productListing,
        page: () => ProductListing(),
        binding: ProductListingControllerBinding()),
    GetPage(
        name: AppRoutes.productDetails,
        page: () => ProductDetails(),
        binding: ProductDetailsControllerBinding()),
    GetPage(
        name: AppRoutes.coupons,
        page: () => CouponView(),
        binding: CouponControllerBinding()),
    GetPage(
        name: AppRoutes.checkOutView,
        page: () => CheckOutView(),
        binding: CheckOutControllerBinding()),
    GetPage(
        name: AppRoutes.login,
        page: () => LoginView(),
        binding: LoginControllerBinding()),
    GetPage(
        name: AppRoutes.returns,
        page: () => ReturnView(),
        binding: ReturnControllerBinding()),
    GetPage(
        name: AppRoutes.orders,
        page: () => OrdersView(),
        binding: OrderControllerBinding()),
    GetPage(
        name: AppRoutes.landingPage,
        page: () => LandingPage(),
        binding: LandingPageControllerBinding()),
    GetPage(
        name: AppRoutes.forgotPassword,
        page: () => ForgotPasswordView(),
        binding: ForgotPasswordControllerBinding()),
    GetPage(
        name: AppRoutes.createAccount,
        page: () => CreateAccount(),
        binding: CreateAccountControllerBinding()),
  ];
}
