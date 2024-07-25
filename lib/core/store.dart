import 'package:pilot/models/cart.dart';
import 'package:pilot/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogModel catalog; // Use CatalogModel for catalog
  late CartModel cart;       // Use CartModel for cart

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
