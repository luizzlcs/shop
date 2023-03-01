import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_provider.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/utils/routes/app_routes.dart';
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
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: mayTheme.copyWith(
          colorScheme: mayTheme.colorScheme.copyWith(
            primary: Colors.deepPurpleAccent,
            secondary: Colors.deepOrange,
          ),
        ),
        home: const ProductsOverviewPage(),
        debugShowCheckedModeBanner: false,
        routes: {AppRoutes.PRODUC_DETAIL: (_) => const ProductDetailPage()},
      ),
    );
  }
}
