import 'package:ecommerce/model/products.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = demoProducts;
  List<Product> _filteredProducts = demoProducts;
  List<Product> _searchResult = [];

  List<Product> get products => _filteredProducts;
  List<Product> get searchResult => _searchResult;

  void searchProducts(String query) {
    if (query.isEmpty) {
      _searchResult = [];
    } else {
      _searchResult = demoProducts.where((product) =>
      product.title.toLowerCase().contains(query.toLowerCase())).toList();
    }
    notifyListeners();
  }
}
