import 'package:ecommerce_flutter_firebase/app/home/camera/camera_page.dart';
import 'package:ecommerce_flutter_firebase/app/home/cart/cart_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTabViewRoutes {
  static const cartPage = '/cart';
  static const cameraPage = '/camera';
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
      case CupertinoTabViewRoutes.cameraPage:
        return CupertinoPageRoute(
          builder: (_) => FutureBuilder<void>(
              future: cameraInit(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPage();
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
          settings: settings,
          fullscreenDialog: true,
        );
    }
    return null;
  }
}
