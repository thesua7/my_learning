import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_learning/features/product/productDetail/bloc/product_detail_event.dart';
import 'package:my_learning/features/product/productDetail/bloc/product_detail_state.dart';
import 'package:my_learning/features/product/product_repository.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductRepository _productRepository;

  ProductDetailBloc(this._productRepository) : super(ProductDetailsInitial()) {
    on<LoadProductDetail>((event, emit) async {
      emit(ProductDetailLoading());
      try {
        final result = await _productRepository.getProductById(event.productId);
        emit(ProductDetailLoaded(result!));
      } catch (e) {
        print(e);
        emit(ProductDetailError(e.toString()));
      }
    });
  }
}
