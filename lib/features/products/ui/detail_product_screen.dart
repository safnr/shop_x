import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_x/features/main/home/product_provider.dart';

class DetailProductScreen extends ConsumerWidget {
  const DetailProductScreen({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(fetchProductById(productId));

    return Scaffold(
      body: productState.when(
        data: (data) => Center(child: Text("Product name: ${data?.title}")),
        error: (error, stackTrace) =>
            Center(child: Text(error.toString())), // Center
        loading: () =>
            const Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}
