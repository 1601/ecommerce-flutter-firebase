// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_flutter_firebase/app/home/models/menu.dart';
import 'package:ecommerce_flutter_firebase/app/home/models/cart.dart';
import 'package:ecommerce_flutter_firebase/constants/strings.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _MyListItem(index)),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);

    return FlatButton(
      onPressed: cart.items.contains(item) ? null : () => cart.add(item),
      splashColor: Theme.of(context).primaryColor,
      child: cart.items.contains(item)
          ? Container(
              width: 96,
              child: Icon(Icons.playlist_add_check,
                  semanticLabel: 'ADDED TO CART'))
          : Text('ADD TO CART'),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(Strings.menu),
      floating: true,
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () => Navigator.pushNamed(context, '/cart'),
        ),
      ],
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  _MyListItem(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var menu = Provider.of<MenuModel>(context);
    var item = menu.getByPosition(index);
    var textTheme = Theme.of(context).textTheme.headline6;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Container(
          color: item.color,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  color: item.color,
                  child: Image.network(item.image),
                ),
              ),
              SizedBox(width: 24),
              Expanded(
                child: Text(item.name, style: textTheme),
              ),
              SizedBox(
                  width: 24,
                  child: IconButton(
                    icon: Icon(Icons.pin_drop),
                    tooltip: item.location,
                    onPressed: () {},
                  )),
              SizedBox(width: 24),
              _AddButton(item: item),
            ],
          ),
        ),
      ),
    );
  }
}
