import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/produtct_item.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_provider.dart';

class ProductsOverviewPage extends StatelessWidget {
  const ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    final List<Product> loadedProducts = provider.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Minha Loja',
          textAlign: TextAlign.center,
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) =>
            ProdutctItem(product: loadedProducts[index]),
        itemCount: loadedProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
