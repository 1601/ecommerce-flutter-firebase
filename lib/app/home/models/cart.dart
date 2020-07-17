import 'package:flutter/foundation.dart';
import 'package:ecommerce_flutter_firebase/app/home/models/menu.dart';

class CartModel extends ChangeNotifier {
  MenuModel _menu;

  final List<int> _itemIds = [];

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
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.hashCode);
    notifyListeners();
  }

  void empty() {
    _itemIds.clear();
    notifyListeners();
  }
}
