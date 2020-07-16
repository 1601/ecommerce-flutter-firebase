import 'package:flutter/material.dart';

class MenuModel {
  static List<String> itemNames = [
    'Banana',
    'Orange',
    'Lemon',
    'Carrots',
    'Cucumbers',
    'Tomatoes',
    'Greenpepper',
    'Redpepper',
    'Sweetpotato',
    'Whitepotato',
    'Garlic',
    'Onion',
    'Lettuce',
    'Spinach',
    'Parsley',
    'Cilantro',
  ];

  static List<int> itemPrices = [
    61,
    88,
    49,
    16,
    21,
    64,
    15,
    56,
    65,
    48,
    58,
    49,
    84,
    41,
    65,
    64,
  ];
  Item getById(int id) => Item(
      id, itemNames[id % itemNames.length], itemPrices[id % itemPrices.length]);

  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int price;

  Item(this.id, this.name, this.price)
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
