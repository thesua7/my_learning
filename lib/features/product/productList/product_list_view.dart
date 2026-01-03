import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_learning/features/product/productList/product_list_vm.dart';
import 'package:provider/provider.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // This ensures fetchProducts is called AFTER the first frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vm = context.read<ProductListVm>();
      vm.fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProductListVm>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: SafeArea(
        child: Center(
          child: vm.isLoading
              ? const CircularProgressIndicator()
              : vm.error.isNotEmpty
              ? Text(vm.error)
              : ListView.builder(

                  itemCount: vm.products.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        context.push("/product/${vm.products[index].id}");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          tileColor: Colors.amber,
                          title: Text(
                            vm.products[index].title != null
                                ? vm.products[index].title!
                                : "",
                          ),
                          subtitle: Text(
                            vm.products[index].description != null
                                ? vm.products[index].description!
                                : "",
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
