import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_learning/features/product/productDetail/bloc/product_detail_bloc.dart';
import 'package:my_learning/features/product/productDetail/bloc/product_detail_event.dart';


import '../../../di/dependency_injection.dart';
import 'bloc/product_detail_state.dart';


class ProductDetailView extends StatelessWidget {
  final int? productId;

  const ProductDetailView({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      sl<ProductDetailBloc>()
        ..add(LoadProductDetail(productId: productId!))..add(LoadProductDetail(productId: productId!)),
      child: Scaffold(
        appBar: AppBar(title: Text("Product Detail")),
        body: Center(
          child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
              if (state is ProductDetailLoading) {
                return CircularProgressIndicator();
              }

              if (state is ProductDetailError) {
                return Text(state.message);
              }

              if (state is ProductDetailLoaded) {
                return Container(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Column(
                    children: [
                      Text(state.product.title ?? ""),
                      Text(state.product.description ?? ""),
                      Text(state.product.price.toString() ?? ""),
                      Text(state.product.rating.toString() ?? ""),
                    ],
                  ),
                );
              }

              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}


// using provider
// class ProductDetailView extends StatelessWidget {
//   final int? productId;
//
//   const ProductDetailView({super.key, required this.productId});
//
//   @override
//   Widget build(BuildContext context) {
//     final vm = context.watch<ProductDetailVm>();
//     return Scaffold(
//       appBar: AppBar(title: Text("Product Detail")),
//       body: Center(
//         child: vm.isLoading
//             ? const CircularProgressIndicator()
//             : vm.error.isNotEmpty
//             ? Text(vm.error)
//             : Container(
//                 decoration: BoxDecoration(color: Colors.blue),
//                 child: Column(
//                   children: [
//                     Text(vm.product?.title ?? ""),
//                     Text(vm.product?.description ?? ""),
//                     Text(vm.product?.category ?? ""),
//                     Text(vm.product?.price.toString() ?? ""),
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }
