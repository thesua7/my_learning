import '../../product_dto.dart';

abstract class ProductDetailState {}



class ProductDetailsInitial extends ProductDetailState{}
class ProductDetailLoading extends ProductDetailState{}
class ProductDetailError extends ProductDetailState{
   String message = "";
  ProductDetailError(this.message);

}

class ProductDetailLoaded extends ProductDetailState {
  ProductDTO product = ProductDTO();
  ProductDetailLoaded(this.product);
}
