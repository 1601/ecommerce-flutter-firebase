import 'package:ecommerce_flutter_firebase/app/home/models/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_flutter_firebase/app/home/models/cart.dart';
import 'package:ecommerce_flutter_firebase/constants/strings.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.cart),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.remove_shopping_cart),
            onPressed: () => cart.empty(),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: _CartList(),
              ),
            ),
            Divider(height: 4, color: Colors.black),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;
    var cart = Provider.of<CartModel>(context);
    var menu = Provider.of<MenuModel>(context);
    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(
          "PHP " +
              cart.items[index].price.toString() +
              " - " +
              cart.items[index].name,
          style: itemNameStyle,
        ),
        trailing: FlatButton(
          onPressed: () {
            var selectedItemId = cart.items[index].id;
            Scaffold.of(context).showSnackBar(SnackBar(
                action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      cart.add(menu.getByPosition(selectedItemId));
                    }),
                content: Text("Remove from cart " +
                    menu.getByPosition(selectedItemId).name +
                    "- PHP " +
                    menu.getByPosition(selectedItemId).price.toString())));
            cart.remove(menu.getByPosition(selectedItemId));
          },
          color: Colors.white,
          child: Icon(
            Icons.remove_circle_outline,
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle =
        Theme.of(context).textTheme.headline1.copyWith(fontSize: 48);

    return SizedBox(
      height: 185,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<CartModel>(
              builder: (context, cart, child) =>
                  Text('PHP${cart.totalPrice}', style: hugeStyle)),
          SizedBox(width: 24),
          FlatButton(
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Buying not supported yet.')));
            },
            color: Colors.orange,
            child: Text('BUY'),
          ),
        ],
      ),
    );
  }
}
