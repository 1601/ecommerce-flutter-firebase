import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_flutter_firebase/app/home/home_page.dart';
import 'package:ecommerce_flutter_firebase/app/home/models/menu.dart';
import 'package:ecommerce_flutter_firebase/app/home/models/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => MenuModel()),
          ChangeNotifierProxyProvider<MenuModel, CartModel>(
            create: (context) => CartModel(),
            update: (context, menu, cart) {
              cart.menu = menu;
              return cart;
            },
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.orange,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ));
  }
}
