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
  late double drinkPrice;
  double finalTopping = 0;
  double finalPrice = 0;
  double priceSweet = 0.1;
  double priceIce = 0.1;
  double pricePearl = 0.1;
  @override
  initState() {
    super.initState();
    drinkPrice = double.parse(widget.drink.price);
  }

  int quantity = 1;
  //customize sweetness
  double sweetValue = 0;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  double iceValue = 0;
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  double pearlValue = 0;
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
    if (quantity > 1) {
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

  double calculateFinalPrice() {
    finalTopping = (sweetValue * priceSweet) +
        (iceValue * priceIce) +
        (pearlValue * pricePearl);
    setState(() {
      finalPrice = quantity * (drinkPrice + finalTopping);
    });
    return finalPrice;
  }

  @override
  Widget build(BuildContext context) {
    // print('harge ${drinkPrices.toString()}');
    finalPrice = calculateFinalPrice();
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

        const SizedBox(height: 20),

        Text('\$${finalPrice.toStringAsFixed(2)}'),

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
                      min: 0,
                      max: 5,
                      value: sweetValue,
                      label: sweetValue.toString(),
                      divisions: 5,
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
                      min: 0,
                      max: 5,
                      value: iceValue,
                      label: iceValue.toString(),
                      divisions: 5,
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
                      min: 0,
                      max: 5,
                      value: pearlValue,
                      label: pearlValue.toString(),
                      divisions: 5,
                      onChanged: (value) => customizePearl(value),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
