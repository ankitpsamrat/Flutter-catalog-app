// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '/widgets/home_widgets/add_to_cart.dart';
import '/models/catalog.dart';
import '/pages/home_detail_page.dart';
import '/widgets/home_widgets/catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(catalog: catalog),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.bold.color(Colors.black).make(),
                catalog.desc.text.make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: Vx.mH8,
                  children: [
                    '\$${catalog.price}'
                        .text
                        .bold
                        .xl
                        .color(Colors.black)
                        .make(),
                    AddToCart(catalog: catalog),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ).white.roundedLg.square(120).make().py16();
  }
}
