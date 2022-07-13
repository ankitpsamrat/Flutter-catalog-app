import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '/core/store.dart';
import '/models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: 'Cart'.text.make(),
      ),
      body: Column(
        children: [
          const _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          '\$${_cart.totalPrice}'.text.xl5.color(Colors.redAccent).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: 'Buying not supported yet.'.text.make(),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.black,
              ),
              shape: MaterialStateProperty.all(
                const StadiumBorder(),
              ),
            ),
            child: 'Buy'.text.make(),
          ).wh(100, 40),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? 'Cart is empty.'.text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(
                Icons.done,
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.remove_circle_outline,
                ),
                onPressed: () => RemoveMutation(
                  _cart.items[index],
                ),
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
