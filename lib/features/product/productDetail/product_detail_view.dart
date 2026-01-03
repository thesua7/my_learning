import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_learning/features/product/productDetail/bloc/product_detail_bloc.dart';
import 'package:my_learning/features/product/productDetail/bloc/product_detail_event.dart';

import '../../../di/dependency_injection.dart';
import 'bloc/product_detail_state.dart';

class ProductDetailView extends StatefulWidget {
  final int? productId;

  const ProductDetailView({super.key, required this.productId});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView>
    with SingleTickerProviderStateMixin {
  bool isAnimate = false;

  late final ProductDetailBloc _bloc;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _bloc = sl<ProductDetailBloc>()
      ..add(LoadProductDetail(productId: widget.productId!));

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn), // explicit animation
    );

    _slideAnimation =
        Tween<Offset>(begin: Offset(0.0, 0.2), end: Offset.zero).animate(
            CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose(); // memory leak avoid
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
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
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      isAnimate = !isAnimate;
                    });
                    // if (_animationController.isCompleted) {
                    //   _animationController.reverse();
                    // } else {
                    //   _animationController.forward();
                    //
                    // }
                  },
                  onDoubleTap: () => print("Double Tap!"),
                  onLongPress: () => print("Long Press!"),
                  // onPanUpdate: (details) => print("Dragged: ${details.delta}"),
                  onScaleUpdate: (details) => print("Pinch/Zoom: ${details.scale}"),
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      curve: isAnimate ? Curves.elasticOut : Curves.elasticOut,
                      height: isAnimate ? 500 : 400,
                      decoration: BoxDecoration(color: Colors.blue),
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Column(
                          children: [
                            Text(state.product.title ?? ""),
                            Text(state.product.description ?? ""),
                            Text(state.product.price.toString() ?? ""),
                            Text(state.product.rating.toString() ?? ""),
                          ],
                        ),
                      ),
                    ),
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
