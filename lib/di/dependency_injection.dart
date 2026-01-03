import 'package:get_it/get_it.dart';
import 'package:my_learning/features/product/productDetail/product_detail_vm.dart';
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

    // view models
    sl.registerFactory(() => ProductListVm(sl()));
    sl.registerFactory(() => ProductDetailVm(sl()));
  }
}
