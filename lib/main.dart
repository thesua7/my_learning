import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_learning/core/routes/app_route.dart';
import 'package:my_learning/di/dependency_injection.dart';
import 'package:my_learning/features/product/productDetail/bloc/product_detail_bloc.dart';
import 'package:my_learning/features/product/productDetail/bloc/product_detail_event.dart';
import 'package:my_learning/features/product/productList/bloc/product_list_bloc.dart';
import 'package:my_learning/features/product/productList/bloc/product_list_event.dart';
import 'package:provider/provider.dart';

import 'features/product/productDetail/product_detail_vm.dart';
import 'features/product/productList/product_list_vm.dart';

void main() {
  DependencyInjection.init();

  runApp(
    const MyApp(),
  );
}

// void main() {
//   DependencyInjection.init();
//
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => sl<ProductListVm>()),
//
//         ChangeNotifierProvider(create: (_) => sl<ProductDetailVm>()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Practice",
      routeInformationParser: AppRoute.router.routeInformationParser,
      routerDelegate: AppRoute.router.routerDelegate,
      routeInformationProvider: AppRoute.router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
