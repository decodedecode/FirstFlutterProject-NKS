import 'package:flutter/material.dart';
import 'package:pilot/core/store.dart';
import 'package:pilot/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor, // Use theme's scaffold background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text
            .color(theme.textTheme.titleLarge?.color ?? Colors.black)
            .make(),
        elevation: 0, // Adjust the AppBar elevation to match your theme
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(color: theme.dividerColor), // Use theme divider color
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    final theme = Theme.of(context);

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            mutations: {RemoveMutation},
            builder: (context, _, __) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(theme.textTheme.titleLarge?.color ?? Colors.black)
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Buying not supported yet.".text.make(),
                  backgroundColor: theme.snackBarTheme.backgroundColor, // Use theme's SnackBar background color
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(theme.primaryColor), // Use theme's primary color for button
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 24, vertical: 12)), // Add padding to the button
              textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)), // Button text color
            ),
            child: "Buy".text.white.make(),
          ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    final theme = Theme.of(context);

    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3
        .color(theme.textTheme.bodyMedium?.color ?? Colors.black)
        .makeCentered()
        : ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done, color: theme.iconTheme.color), // Use theme icon color
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline, color: theme.iconTheme.color),
          onPressed: () => RemoveMutation(_cart.items[index]),
        ),
        title: _cart.items[index].name.text.color(theme.textTheme.bodyMedium?.color ?? Colors.black).make(),
      ),
    );
  }
}
