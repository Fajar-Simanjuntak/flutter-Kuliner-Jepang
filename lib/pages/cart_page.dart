import 'package:flutter/material.dart';
import 'package:projek2/components/button.dart';
import 'package:projek2/models/foods.dart';
import 'package:projek2/models/shop.dart';
import 'package:projek2/theme/colors.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove from cart
  void removeFromCart(Food food, BuildContext context) {
    // get access to shop
    final shop = context.read<Shop>();

    // Remove from cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: const Text("My Cart"),
          elevation: 0,
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            // CUSTOMER CART
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  // get food from cart
                  final Food food = value.cart[index];

                  // get food food name
                  final String foodName = food.name;

                  // get food price
                  final String foodPrice = food.price;

                  // return list tile
                  return Container(
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        foodPrice,
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey[300],
                        ),
                        onPressed: () => removeFromCart(food, context),
                      ),
                    ),
                  );
                },
              ),
            ),

            // PAY BUTTON
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Mybutton(
                text: "Pay Now",
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
