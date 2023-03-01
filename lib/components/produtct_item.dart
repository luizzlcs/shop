import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/routes/app_routes.dart';

class ProdutctItem extends StatelessWidget {
  final Product product;

  const ProdutctItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: GestureDetector(
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
              color: Theme.of(context).accentColor,
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).accentColor,
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
