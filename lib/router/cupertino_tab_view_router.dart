import 'package:ecommerce_flutter_firebase/app/home/cart/cart_page.dart';
import 'package:flutter/cupertino.dart';

class CupertinoTabViewRoutes {
  static const cartPage = '/cart';
}

class CupertinoTabViewRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CupertinoTabViewRoutes.cartPage:
        return CupertinoPageRoute(
          builder: (_) => CartPage(),
          settings: settings,
          fullscreenDialog: true,
        );
    }
    return null;
  }
}
