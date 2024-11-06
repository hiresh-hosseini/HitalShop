import 'package:get/get.dart';
import 'package:shop/app_core/routes/bindings/auth_bindeing.dart';
import 'package:shop/app_core/routes/bindings/category_binding.dart';
import 'package:shop/app_core/routes/bindings/home_binding.dart';
import 'package:shop/app_core/routes/bindings/product_binding.dart';
import 'package:shop/app_core/routes/routs_names.dart';
import 'package:shop/app_features/authentication/screens/login_screen.dart';
import 'package:shop/app_features/authentication/screens/register_screen.dart';
import 'package:shop/app_features/authentication/screens/splash_screen.dart';
import 'package:shop/app_features/authentication/screens/start_screen.dart';
import 'package:shop/app_features/category/screen/category_screen.dart';
import 'package:shop/app_features/home/screens/home_screen.dart';
import 'package:shop/app_features/product/screen/product_screen.dart';

class Routings {
  static List<GetPage> getPages = [
    //---------------------Auth Screens---------------------
    GetPage(
      name: NamedRouts.routeSplash,
      page: () => const SplashScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: NamedRouts.routeStart,
      page: () => const StartScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: NamedRouts.routeLogin,
      page: () => const LoginScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: NamedRouts.routeRegister,
      page: () => const RegisterScreen(),
      binding: AuthBindings(),
    ),

    //---------------------Home Screens---------------------
    GetPage(
      name: NamedRouts.routeHome,
      page: () => const HomeScreen(),
      binding: HomeBindings(),
    ),

    //---------------------Category Screens---------------------
    GetPage(
      name: NamedRouts.routeCategory,
      page: () => const CategoryScreen(),
      binding: CategoryBinding(),
    ),

    //---------------------Product Screens---------------------
    GetPage(
      name: NamedRouts.routeProduct,
      page: () => const ProductScreen(),
      binding: ProductBinding(),
    ),
  ];
}
