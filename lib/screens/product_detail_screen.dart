import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  static const routeName = '/product-detail';

  // const ProductDetailScreen({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ///We are actually passing the product id inside the named route and in this named
    ///route, data in not defined inside the main class as all the named routes are
    ///defined inside the main.dart file only, so in order to tackle with this, we
    ///we pass the data inside the argument constructor of the named route and fetch that
    ///data using the ModalRoute.of(context).setting.arguments.
    final productId = ModalRoute.of(context).settings.arguments as String;

    ///We have made this listen method as false because this is the detail screen , we dont want it to show the
    ///change whenever any change is made is the product list or we can say we dont want it be built with every
    ///change in it.
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.network(loadedProduct.imageUrl),
            ),
          ),
          Container(
            color: Colors.deepOrange,
            child: Text(
              loadedProduct.price.toString(),
            ),
          )
        ],
      ),
    );
  }
}
