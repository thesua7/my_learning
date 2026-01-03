import 'package:my_learning/features/product/product_data_source.dart';
import 'package:my_learning/features/product/product_dto.dart';

class ProductRepository {
  final ProductDataSource _dataSource;
  ProductRepository(this._dataSource);
  Future<List<ProductDTO>> getProducts() async {
    return _dataSource.getProducts();
  }
  Future<ProductDTO?> getProductById(int id) async {
    return _dataSource.getProductById(id);
  }
}


