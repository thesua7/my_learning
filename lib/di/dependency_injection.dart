import 'package:get_it/get_it.dart';
import 'package:my_learning/features/product/productDetail/bloc/product_detail_bloc.dart';
import 'package:my_learning/features/product/productDetail/product_detail_vm.dart';
import 'package:my_learning/features/product/productList/bloc/product_list_bloc.dart';
import 'package:my_learning/features/product/productList/product_list_vm.dart';
import 'package:my_learning/features/product/product_data_source.dart';
import 'package:my_learning/features/product/product_repository.dart';

import '../core/network/api_client.dart';

final sl = GetIt.instance;

class DependencyInjection {
  static void init() {
    sl.registerLazySingleton(() => ApiClient());

    sl.registerLazySingleton(() => ProductDataSource(sl()));
    sl.registerLazySingleton(() => ProductRepository(sl()));

    // // view models using providers
    // sl.registerFactory(() => ProductListVm(sl()));
    // sl.registerFactory(() => ProductDetailVm(sl()));

    // view models using bloc
    sl.registerFactory(() => ProductListBloc(sl()));
    sl.registerFactory(() => ProductDetailBloc(sl()));
  }
}
