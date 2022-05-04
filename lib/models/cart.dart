import 'package:catalog/models/catalog.dart';

class CartModel {

  late CatalogModel _catalog;

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // add total price

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // add item to cart

  void add(Item item) {
    _itemIds.add(item.id);
  }

  // remove item from cart

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
