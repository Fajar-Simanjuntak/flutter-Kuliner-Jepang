import 'package:flutter/material.dart';
import 'foods.dart';

class Shop extends ChangeNotifier {
  // food menu
  final List<Food> _foodMenu = [
    // salmon
    Food(
        name: "Salmon Sushi",
        price: "21.00",
        imagePath: "lib/images/salmon_sushi.png",
        rating: "4.9"),

    // tuna
    Food(
        name: "Tuna",
        price: "21.00",
        imagePath: "lib/images/tuna.png",
        rating: "4.3"),

    // natto
    Food(
        name: "Natto",
        price: "35.00",
        imagePath: "lib/images/natto.png",
        rating: "4.1"),

    // Souffle Pancake
    Food(
        name: "Souffle Pancake",
        price: "27.00",
        imagePath: "lib/images/pancake.png",
        rating: "4.7"),

    // Takoyaki
    Food(
        name: "Takoyaki",
        price: "20.00",
        imagePath: "lib/images/takoyaki.png",
        rating: "4.6"),

    // Dorayaki
    Food(
        name: "Dorayaki",
        price: "23.00",
        imagePath: "lib/images/dorayaki.png",
        rating: "4.8"),

    // Ramen
    Food(
        name: "Ramen",
        price: "27.00",
        imagePath: "lib/images/ramen.png",
        rating: "4.9"),

    // Ramen
    Food(
        name: "Cake",
        price: "36.00",
        imagePath: "lib/images/cake.png",
        rating: "4.9"),
  ];

  // customer cart
  final List<Food> _cart = [];

  // getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
