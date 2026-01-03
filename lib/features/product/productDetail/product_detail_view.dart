import 'package:flutter/material.dart';
import 'package:my_learning/features/product/productDetail/product_detail_vm.dart';
import 'package:provider/provider.dart';

class ProductDetailView extends StatefulWidget {
  final int? productId;

  const ProductDetailView({super.key, required this.productId});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductDetailVm>().fetchProductById(widget.productId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProductDetailVm>();
    return Scaffold(
      appBar: AppBar(title: Text("Product Detail")),
      body: Center(
        child: vm.isLoading
            ? const CircularProgressIndicator()
            : vm.error.isNotEmpty
            ? Text(vm.error)
            : Container(
                decoration: BoxDecoration(color: Colors.blue),
                child: Column(
                  children: [
                    Text(vm.product?.title ?? ""),
                    Text(vm.product?.description ?? ""),
                    Text(vm.product?.category ?? ""),
                    Text(vm.product?.price.toString() ?? ""),
                  ],
                ),
              ),
      ),
    );
  }
}
