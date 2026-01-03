import '../../product_dto.dart';

abstract class ProductListState {}

class ProductListInitial extends ProductListState {}

class ProductListLoading extends ProductListState {}

class ProductListLoaded extends ProductListState {
  List<ProductDTO> list = [];

  ProductListLoaded(this.list);
}

class ProductListError extends ProductListState {
  String message = "";

  ProductListError(this.message);
}
