import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pilot/core/store.dart';
import 'package:pilot/models/cart.dart';
import 'package:pilot/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;

  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(widget.catalog);

    return ElevatedButton(
      onPressed: () {
        if (isInCart) {
          // Remove item from cart if it is already there
          RemoveMutation(widget.catalog);
        } else {
          // Add item to cart if it's not already there
          AddMutation(widget.catalog);
        }
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
      ),
      child: isInCart
          ? const Icon(Icons.done) // Show "done" icon if item is in cart
          : const Icon(CupertinoIcons.cart_badge_plus), // Show "add to cart" icon otherwise
    );
  }
}
