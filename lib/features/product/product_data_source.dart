import 'package:my_learning/core/network/api_client.dart';
import 'package:my_learning/features/product/product_dto.dart';

class ProductDataSource {
  final ApiClient _apiClient;

  ProductDataSource(this._apiClient);

  Future<List<ProductDTO>> getProducts() async {
    final response = await _apiClient.get("products", null);
    if (response.statusCode == 200) {
      final result = response.data['products'] as List;

      return result.map((e) => ProductDTO.fromJson(e)).toList();
    }
    return List.empty();
  }

  Future<ProductDTO?> getProductById(int id) async {
    final response = await _apiClient.get("product/$id", null);
    if (response.statusCode == 200) {
      return ProductDTO.fromJson(response.data);
    }
    return null;
  }
}
