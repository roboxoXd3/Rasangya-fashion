import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/products.dart';

import 'Product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavourites;

  const ProductsGrid({Key key, this.showFavourites}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ///Here we have removed all of the constructor, because we dont need any data from any other class, we will
    ///fetch all with the help of provider package.
    final Products productsData = Provider.of<Products>(context);
    final List<Product> loadedProducts = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10.0),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: loadedProducts[index],
          child: ProductItem(),
        );
      },
    );
  }
}
