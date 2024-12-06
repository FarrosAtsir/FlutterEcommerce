import 'package:ecommerce/model/products.dart';

class Cart {
  final Product product;
  int numOfItem;

  Cart({
    required this.product,
    required this.numOfItem,
  });
}
