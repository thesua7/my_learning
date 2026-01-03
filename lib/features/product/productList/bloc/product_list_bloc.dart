import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_learning/features/product/productList/bloc/product_list_event.dart';
import 'package:my_learning/features/product/productList/bloc/product_list_state.dart';

import '../../product_repository.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductRepository _productRepository;

  ProductListBloc(this._productRepository) : super(ProductListInitial()) {
    on<FetchProductListEvent>((event, emit) async {
      emit(ProductListLoading());
      try {
        final result = await _productRepository.getProducts();
        emit(ProductListLoaded(result));
      } catch (e) {
        print(e);
        emit(ProductListError(e.toString()));
      }
    });
  }
}
