import 'package:flutter/material.dart';
import 'dart:math';

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
    'Sweetpotatoes',
    'Whitepotatoes',
    'Garlic',
    'Onion',
    'Romainelettuce',
    'Spinach',
    'Freshparsley',
    'Freshcilantro',
  ];
  Random rng = new Random();
  Item getById(int id) =>
      Item(id, itemNames[id % itemNames.length], rng.nextInt(90) + 10);

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
