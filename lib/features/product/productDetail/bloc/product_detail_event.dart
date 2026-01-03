abstract class ProductDetailEvent {}

class LoadProductDetail extends ProductDetailEvent {
  final int productId;

  LoadProductDetail({required this.productId});
}
