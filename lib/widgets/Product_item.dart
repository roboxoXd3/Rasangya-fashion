import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    ///here we are creating the product obj which we are accessing with the help of provider class.
    ///and we have made its listen method as false because we dont want to render it again and again
    ///if any change takes place and for that minimal change to render on the screen we
    ///are using cons  umer, here we do want this product obj to access various
    ///other things like id , name , imageUrl, but we dont want to build it again and
    ///again and for this consumer comes into picture and we wrap that particular
    ///sub widget with the consumer to showcase the changes onto to the screen.
  final product = Provider.of<Product>(context , listen:  false);
print("Product rebuilds");
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          ///Material Rounting
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //   return ProductDetailScreen(
          //     title: title,
          //   );
          // }));
          ///Named Routing
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: product.id,
          );
        },
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: Consumer<Product>(
            builder: (context, product , _) =>GridTileBar(
              leading: IconButton(
                icon: Icon(
                  product.isFavourite?
                  Icons.favorite
                      :Icons.favorite_border,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () {
                  product.toggleFavouriteStatus();
                  print("isFavourite is:" + product.isFavourite.toString());
                },
              ),
              backgroundColor: Colors.black87,
              title: Center(child: Text(product.title)),
              trailing: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () {},
              ),
            ),
            // child: ,
          ),
        ),
      ),
    );
  }
}
