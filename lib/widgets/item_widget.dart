// ignore_for_file: unnecessary_null_comparison

import '/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.item,
  })  : assert(item != null),
        super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
        leading: Image.network(
          item.image,
        ),
        title: Text(
          item.name,
        ),
        subtitle: Text(
          item.desc,
        ),
        trailing: Text(
          '\$${item.price}',
          textScaleFactor: 1.2,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
