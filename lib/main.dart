import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/orders_page.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/product_form_page.dart';
import 'package:shop/pages/products_page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/utils/theme.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderList(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: mayTheme.copyWith(
          colorScheme: mayTheme.colorScheme.copyWith(
            primary: Colors.deepPurpleAccent,
            secondary: Colors.deepOrange,
          ),
        ),
        // home: const ProductsOverviewPage(),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.HOME: (_) => const ProductsOverviewPage(),
          AppRoutes.PRODUC_DETAIL: (_) => const ProductDetailPage(),
          AppRoutes.CART_PAGE: (_) => const CartPage(),
          AppRoutes.ORDERS: (_) => const OrdersPage(),
          AppRoutes.PRODUCTS: (_) => const ProductsPage(),
          AppRoutes.PRODUCTS_FORM: (_) => const ProductFormPage(),
        },
      ),
    );
  }
}
