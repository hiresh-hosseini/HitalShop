import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_core/constants/theme/app_theme.dart';
import 'package:shop/app_core/pakages/screen_util_pakage.dart';
import 'package:shop/app_core/routes/bindings/auth_bindeing.dart';
import 'package:shop/app_core/routes/route_screens.dart';
import 'package:shop/app_core/routes/routs_names.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPakage(
      child: GetMaterialApp(
        title: 'Shop',
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.native,
        locale: const Locale('fa'),
        theme: ThemeConfigurationContoller().lightThemeData,
        initialRoute: NamedRouts.routeSplash,
        initialBinding: AuthBindings(),
        getPages: Routings.getPages,
      ),
    );
  }
}
