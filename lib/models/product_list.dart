import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];

  List<Product> get favoriteItens =>
      _items.where((prod) => prod.isFavorite).toList();

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}


/* bool _showFavoriteOnly = false;

  List<Product> get items {
    if (_showFavoriteOnly) {
      return _items.where((produc) => produc.isFavorite).toList();
    }
    return [..._items];
  }

  showFivoriteOnly() {
    _showFavoriteOnly = true;
    notifyListeners();
  }

  showAll() {
    _showFavoriteOnly = false;
    notifyListeners();
  }
 */