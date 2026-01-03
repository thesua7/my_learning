import 'package:flutter/widgets.dart';

import '../product_dto.dart';
import '../product_repository.dart';

class ProductDetailVm extends ChangeNotifier {
  final ProductRepository _productRepository;

  ProductDetailVm(this._productRepository);

  ProductDTO? _product;

  ProductDTO? get product => _product;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _error = "";

  String get error => _error;

  Future<void> fetchProductById(int id) async {
    _isLoading = true;
    notifyListeners();
    try {
      final result = await _productRepository.getProductById(id);
      _product = result;
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
