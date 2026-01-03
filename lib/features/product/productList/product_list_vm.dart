import 'package:flutter/material.dart';

import '../product_dto.dart';
import '../product_repository.dart';

class ProductListVm extends ChangeNotifier {
  final ProductRepository _productRepository;

  ProductListVm(this._productRepository);

  List<ProductDTO> _products = [];

  List<ProductDTO> get products => _products;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _error = "";

  String get error => _error;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      final result = await _productRepository.getProducts();
      _products = result;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
