import 'package:flutter/material.dart';
import '../components/drink_tile.dart';
import '../models/drink.dart';
import '../models/shop.dart';
import '../pages/order_page.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void goToOrderPage(Drink drink) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderPage(
            drink: drink,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    //heading
                    const Text(
                      "Bubble Tea Shop",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //list of drinks for sale
                    Expanded(
                        child: ListView.builder(
                            itemCount: value.shop.length,
                            itemBuilder: (context, index) {
                              // get individual drink from shop
                              Drink individualDrink = value.shop[index];

                              // return that drink as a nice tile
                              return DrinkTile(
                                drink: individualDrink,
                                onTap: () => goToOrderPage(individualDrink),
                                trailings: const Icon(Icons.arrow_forward),
                              );
                            }))
                  ],
                ),
              ),
            ));
  }
}
