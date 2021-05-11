import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_overview_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'providers/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ///With this provider, only child widget that are listening will rebuild, with the
    ///updated data.
    ///TODO: In place of ChangeNotifierProvider(create: (context)=>Products())
    ///we can use ChangeNotifierProvider.value in which we directly pass the value.
    ///
    /// ChangeNotifierProvider.value is given when the flutter is trying to rebuild
    /// the list or grid and the data is already initiated we just want to bind the
    /// provider with that data rather than instantiating it again.
    return ChangeNotifierProvider(
      create:(context)=> Products(),
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'
        ),
        home:ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
        },
      ),
    );
  }
}


