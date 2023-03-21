import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/exceptions/http_exception.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/app_routes.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({super.key});
  @override
  Widget build(BuildContext context) {
    final msg = ScaffoldMessenger.of(context);
    final product = Provider.of<Product>(
      context,
      listen: false,
    );

    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: GestureDetector(
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(
              product.name,
              textAlign: TextAlign.center,
            ),
            leading: Consumer<Product>(
              builder: (ctx, product, _) => IconButton(
                onPressed: () {
                  try {
                    product.toggleFavorite();
                  } catch (_) {
                    print('Tem alguma coisa errada');
                  }
                },
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                cart.addItem(product);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.purple,
                    content: const Text('Produto adicionado com sucesso!'),
                    duration: const Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'Desfazer',
                      textColor: Colors.white,
                      onPressed: () {
                        cart.removeSingleItem(product.id);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.fitWidth,
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRoutes.PRODUC_DETAIL,
            arguments: product,
          );
        },
      ),
    );
  }
}
