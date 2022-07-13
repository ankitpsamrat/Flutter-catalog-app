import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '/models/cart.dart';
import '/models/catalog.dart';
import '/core/store.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog);

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.black,
        ),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
      ),
      child: isInCart
          ? const Icon(
              Icons.done,
            )
          : const Icon(
              CupertinoIcons.cart_badge_plus,
            ),
    );
  }
}
