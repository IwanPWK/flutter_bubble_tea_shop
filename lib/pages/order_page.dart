import 'package:flutter/material.dart';
import '../models/drink.dart';
import '../models/shop.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({super.key, required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int quantity = 0;
  //customize sweetness
  double sweetValue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  double iceValue = 0.5;
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  double pearlValue = 0.5;
  void customizePearl(double newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  //add to cart
  void addToCart() {
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);

    // direct user back to shop page
    Navigator.pop(context);

    // let user know it has been successfully added
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Successflly added to cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.drink.name)),
      backgroundColor: Colors.brown[200],
      body: Column(children: [
        //drink image
        Image.asset(
          widget.drink.imagePath,
          height: 180,
          width: 180,
        ),

        //sliders to customize drink
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //sweetness slider
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 100, child: Text('Sweet')),
                  Expanded(
                    child: Slider(
                      value: sweetValue,
                      label: sweetValue.toString(),
                      divisions: 4,
                      onChanged: (value) => customizeSweet(value),
                    ),
                  ),
                ],
              ),
              //ice slider
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 100, child: Text('Ice')),
                  Expanded(
                    child: Slider(
                      value: iceValue,
                      label: iceValue.toString(),
                      divisions: 4,
                      onChanged: (value) => customizeIce(value),
                    ),
                  ),
                ],
              ),
              //pearls slider
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 100, child: Text('Pearls')),
                  Expanded(
                    child: Slider(
                      value: pearlValue,
                      label: pearlValue.toString(),
                      divisions: 4,
                      onChanged: (value) => customizePearl(value),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  FloatingActionButton(
                    heroTag: 'decrement',
                    onPressed: decrementQuantity,
                    child: const Icon(
                      Icons.remove,
                    ),
                  ),
                  Text(
                    '$quantity',
                    style: const TextStyle(fontSize: 24),
                  ),
                  FloatingActionButton(
                    heroTag: 'increment',
                    onPressed: incrementQuantity,
                    child: const Icon(
                      Icons.add,
                    ),
                  )
                ],
              )
            ],
          ),
        ),

        //add to cart button
        MaterialButton(
          // ignore: sort_child_properties_last
          child: const Text(
            'Add to Cart',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.brown,
          onPressed: addToCart,
        )
      ]),
    );
  }
}
