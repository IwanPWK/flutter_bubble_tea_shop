import 'package:flutter/material.dart';

import '../models/drink.dart';

// ignore: must_be_immutable
class DrinkTile extends StatelessWidget {
  final Drink drink;

  final void Function()? onTap;
  final Widget trailings;
  DrinkTile({
    super.key,
    required this.drink,
    required this.onTap,
    required this.trailings,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.brown[100], borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          title: Text(drink.name),
          subtitle: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '${drink.qty} / ',
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
                TextSpan(
                  text: '\$${drink.price}',
                  style: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          leading: Image.asset(drink.imagePath),
          trailing: trailings,
        ),
      ),
    );
  }
}
