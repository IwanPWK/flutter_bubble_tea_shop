import 'package:flutter/material.dart';
import '../components/drink_tile.dart';
import '../models/drink.dart';
import '../models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //remove drink from cart
  void removeFromCart(Drink drink) {
    Provider.of<BubbleTeaShop>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
        builder: ((context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    //heading
                    const Text(
                      'Your Cart',
                      style: TextStyle(fontSize: 20),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    //list of cart items
                    Expanded(
                        child: ListView.builder(
                            itemCount: value.cart.length,
                            itemBuilder: (context, index) {
                              //get individual ddrink in cart first
                              Drink drink = value.cart[index];

                              //return as a nice tile
                              return DrinkTile(
                                  drink: drink,
                                  onTap: () => removeFromCart(drink),
                                  trailings: const Icon(Icons.delete));
                            })),
                    //pay button
                    MaterialButton(
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'PAY',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.brown,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            )));
  }
}
