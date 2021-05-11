import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/productsGrid.dart';

enum filterOptions
{
  Favourites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {

  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showonlyFavourites = false;
  @override
  Widget build(BuildContext context) {
    final productContainer = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Rasangya Fashion"),
        actions: [
          PopupMenuButton(
            onSelected: (filterOptions selectedValue)
            {
              if(selectedValue == filterOptions.Favourites)
                {
                  _showonlyFavourites = true;
                  // productContainer.showFavouritesOnly();
                }
              else{
                // productContainer.showAll();
                _showonlyFavourites = false;
              }
              print(selectedValue);
            },
            icon: Icon(Icons.more_vert), itemBuilder: (_){
            return [PopupMenuItem(
              child: Text("Only Favourites"),
              value: filterOptions.Favourites,
            ),
              PopupMenuItem(
                child: Text("All Items"),
                value: filterOptions.All,
              ),
            ];
          },)
        ],
      ),
      body: ProductsGrid(showFavourites: _showonlyFavourites,),
    );
  }
}
