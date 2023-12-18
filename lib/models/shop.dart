import 'package:flutter/material.dart';
import 'drink.dart';

class BubbleTeaShop extends ChangeNotifier {
  // list of drinks for sale
  final List<Drink> _shop = [
    //pearl milk tea
    Drink(
        name: "Classic Bubble Tea",
        price: "4.00",
        imagePath: "lib/assets/bubble-tea.png",
        qty: 1),
    Drink(
        name: "Taro Bubble Tea",
        price: "4.00",
        imagePath: "lib/assets/taro.png",
        qty: 1),
    Drink(
        name: "Brown Sugar Milk Tea",
        price: "4.00",
        imagePath: "lib/assets/brown-sugar.png",
        qty: 1),
    Drink(
        name: "Matcha Milk Tea",
        price: "4.00",
        imagePath: "lib/assets/green-tea.png",
        qty: 1),
  ];
  //list of drinks in user cart
  final List<Drink> _userCart = [];

  //ge<t drinks for sale
  List<Drink> get shop => _shop;

  //ge<t user cart
  List<Drink> get cart => _userCart;

  //add drink to cart
  void addToCart(Drink originalDrink, double finalPrice, int qty) {
    // Buat objek baru berdasarkan objek originalDrink dengan harga yang diperbarui
    Drink updatedDrink = Drink(
      name: originalDrink.name,
      price: finalPrice.toStringAsFixed(2),
      imagePath: originalDrink.imagePath,
      qty: qty,
    );

    _userCart.add(
        updatedDrink); // Tambahkan minuman yang telah diperbarui ke keranjang
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
