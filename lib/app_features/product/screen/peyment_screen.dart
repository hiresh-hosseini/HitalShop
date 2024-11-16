import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app_features/product/controller/cart_controller.dart';
import 'package:shop/app_features/product/screen/order_filed_screen.dart';
import 'package:shop/app_features/product/screen/order_sucees_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PeymetnScreen extends StatelessWidget {
  const PeymetnScreen({super.key, required this.link});

  final String link;

  @override
  Widget build(BuildContext context) {
    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            var uri = Uri.parse(request.url);
            if (request.url.contains('order-complete')) {
              return NavigationDecision.prevent;
            } else if (request.url.contains('type=success')) {
              Get.find<CartController>().getCart();
              Get.off(() => OrderSuccessScreen(
                  type: uri.queryParameters['type'] ?? '',
                  id: uri.queryParameters['id'] ?? ''));
            } else {
              Get.find<CartController>().getCart();
              Get.off(() => OrderFailedScreen(
                  type: uri.queryParameters['type'] ?? '',
                  id: uri.queryParameters['id'] ?? ''));
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(link));
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
