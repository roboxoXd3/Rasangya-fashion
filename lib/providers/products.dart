import 'package:flutter/cupertino.dart';
import 'product.dart';
class Products with ChangeNotifier {
   ///So, here we are making the list private because we want to access this list
  ///inside this class only, because this class is only accessing the feature of
  ///ChangeNotifier which is working as a beacon to update data using state management
  ///whenever the change is being made, So, in order to fetch the update for the
  ///listeners, we will be using , NotifyListener(), which keeps the track of the
  ///data which has got changed and updates it to the Listeners for updation.
   List<Product> _items = [
     Product(id: "p1",
         title: "Red Shirt",
         description: "A red shirt with a model",
         price: 10000.02,
         imageUrl: "https://images.unsplash.com/photo-1520911858363-ce639c052a2e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Nnx8cmVkJTIwc2hpcnR8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
     Product(id: "p2",
         title: "Blue Shirt",
         description: "A blue shirt with a model",
         price: 2000.0,
         imageUrl: "https://images.unsplash.com/photo-1559638391-b504d986a9f5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjR8fGJsdWUlMjBzaGlydHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
     Product(id: "p3",
         title: "Green Shirt",
         description: "A green shirt holded by a model",
         price: 150.34,
         imageUrl: "https://images.unsplash.com/photo-1594592411201-1cdab35fdeb3?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTZ8fGdyZWVuJTIwc2hpcnR8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
     Product(id: "p4",
         title: "Yellow Shirt",
         description: "A yellow shirt hanging",
         price: 300.54,
         imageUrl: "https://images.unsplash.com/photo-1552066379-e7bfd22155c5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjV8fHllbGxvdyUyMHNoaXJ0fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),


   ];
   // var showFavouritesonly = false;
   List<Product> get items {
     ///Ok so, here we are using spread operator(...) this actually helps in returning
     ///the copy of the list and here we are actually returning the copy of the list
     ///bacause as we know when we refrence to a list, we actually refrence to the address
     ///of it, so, in that case if the data inside the list will be changed, it will
     ///then to access the old data as the data here will be fetched from the earlier
     ///address, so, in order to handel that we are passing the copy in which every time the
     ///code changes the updated data will be passed.
     ///
     /// Everything in dart is refrence type.
     //   if(showFavouritesonly==true)
     //        {
     //          return _items.where((prodItem) => prodItem.isFavourite).toList();
     //        }
     return [..._items];
  }
   List<Product> get favouriteItems{
     return _items.where((prodItem) => prodItem.isFavourite).toList();
   }
   // void showFavouritesOnly()
   // {
   //   showFavouritesonly= true;
   //   notifyListeners();
   // }
   // void showAll()
   // {
   //   showFavouritesonly = false;
   //   notifyListeners();
   // }

   Product findById(String id)
   {

     return _items.firstWhere((prod) => prod.id == id);
   }


   void addProducts()
   {
     notifyListeners();
   }



}