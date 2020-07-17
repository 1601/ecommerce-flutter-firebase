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

  static List<String> itemLocations = [
    'Caloocan, Manila, Philippines',
    'Las Pinas, Manila, Philippines',
    'Makati, Manila, Philippines',
    'Malabon, Manila, Philippines',
    'Mandaluyong, Manila, Philippines',
    'Metro Manila, Manila, Philippines',
    'Marikina, Manila, Philippines',
    'Muntinlupa, Manila, Philippines',
    'Navotas, Manila, Philippines',
    'Parañaque, Manila, Philippines',
    'Pasay, Manila, Philippines',
    'Pasig, Manila, Philippines',
    'Pateros, Manila, Philippines',
    'Quezon, Manila, Philippines',
    'San Juan, Manila, Philippines',
    'Valenzuela, Manila, Philippines',
  ];

  Item getById(int id) => Item(
      id,
      itemNames[id % itemNames.length],
      itemPrices[id % itemPrices.length],
      itemLocations[id % itemLocations.length],
      "https://loremflickr.com/320/240/" + itemNames[id % itemNames.length]);

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
  final String location;
  final String image;

  Item(this.id, this.name, this.price, this.location, this.image)
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
