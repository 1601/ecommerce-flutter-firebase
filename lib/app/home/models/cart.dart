import 'package:ecommerce_flutter_firebase/database/database.dart';
import 'package:flutter/foundation.dart';
import 'package:ecommerce_flutter_firebase/app/home/models/menu.dart';

class CartModel extends ChangeNotifier {
  MenuModel _menu;

  List<int> _itemIds = [];
  final db = CartDatabase();

  CartModel() {
    setupList();
  }

  MenuModel get menu => _menu;

  set menu(MenuModel newMenu) {
    assert(newMenu != null);
    assert(_itemIds.every((id) => newMenu.getById(id) != null),
        'The menu $newMenu does not have one of $_itemIds in it.');
    _menu = newMenu;
    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id) => _menu.getById(id)).toList();

  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.hashCode);
    db.addToCart(item.hashCode);
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.hashCode);
    db.removeFromCart(item.hashCode);
    notifyListeners();
  }

  void empty() {
    _itemIds.clear();
    db.emptyCart();
    notifyListeners();
  }

  void setupList() async {
    var itemIds = await db.fetchAll();
    this._itemIds = itemIds;
    notifyListeners();
  }
}
