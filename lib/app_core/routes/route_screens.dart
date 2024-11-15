import 'package:get/get.dart';
import 'package:shop/app_core/routes/bindings/auth_bindeing.dart';
import 'package:shop/app_core/routes/bindings/category_binding.dart';
import 'package:shop/app_core/routes/bindings/comment_binding.dart';
import 'package:shop/app_core/routes/bindings/home_binding.dart';
import 'package:shop/app_core/routes/bindings/product_binding.dart';
import 'package:shop/app_core/routes/bindings/product_details_binding.dart';
import 'package:shop/app_core/routes/bindings/profile_binding.dart';
import 'package:shop/app_core/routes/routs_names.dart';
import 'package:shop/app_features/authentication/screens/login_screen.dart';
import 'package:shop/app_features/authentication/screens/register_screen.dart';
import 'package:shop/app_features/authentication/screens/splash_screen.dart';
import 'package:shop/app_features/authentication/screens/start_screen.dart';
import 'package:shop/app_features/category/screen/category_screen.dart';
import 'package:shop/app_features/home/screens/home_screen.dart';
import 'package:shop/app_features/product/screen/comments_screen.dart';
import 'package:shop/app_features/product/screen/product_details_screen.dart';
import 'package:shop/app_features/product/screen/product_screen.dart';
import 'package:shop/app_features/profile/screens/add_address_screen.dart';
import 'package:shop/app_features/profile/screens/address_screen.dart';
import 'package:shop/app_features/profile/screens/edit_profile_screen.dart';
import 'package:shop/app_features/profile/screens/profile_screen.dart';

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

    //---------------------Product details Screens---------------------
    GetPage(
      name: NamedRouts.routeProductDetails,
      page: () => const ProductDetailsScreen(),
      binding: ProductDetailsBinding(),
    ),

    //---------------------comments Screens---------------------
    GetPage(
      name: NamedRouts.routeCommentsScreen,
      page: () => const CommentsScreen(),
      binding: CommentBinding(),
    ),

    //---------------------profile Screens---------------------
    GetPage(
      name: NamedRouts.routeProfileScreen,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),

    // GetPage(
    //   name: NamedRouts.routeEditProfileScreen,
    //   page: () => const EditProfileScreen(),
    //   binding: ProfileBinding(),
    // ),

    // GetPage(
    //   name: NamedRouts.routeAddAddressScreen,
    //   page: () => const AddAddressScreen(),
    //   binding: ProfileBinding(),
    // ),

    // GetPage(
    //   name: NamedRouts.routeMapScreen,
    //   page: () => const MapScreen(),
    //   binding: ProfileBinding(),
    // ),

    GetPage(
      name: NamedRouts.routeAddressScreen,
      page: () => const AddressScreen(),
      binding: ProfileBinding(),
    ),
  ];
}
