import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_learning/features/product/productDetail/product_detail_view.dart';
import 'package:my_learning/features/product/productList/product_list_view.dart';

class AppRoute {
  static final router = GoRouter(
    initialLocation: "/product_list",
    routes: [
      GoRoute(
        path: "/product_list",
        builder: (context, state) => ProductListView(),
      ),

      GoRoute(
        path: "/product/:id",
        builder: (context, state) {
          final idParam = state.pathParameters["id"];
          if (idParam == null) {
            return Scaffold(body: Center(child: Text("no id")));
          }

          final productId = int.tryParse(idParam);
          if (productId == null) {
            return Scaffold(body: Center(child: Text("invalid id")));
          }

          return ProductDetailView(productId: productId,);
        },
      ),
    ],
  );
}
