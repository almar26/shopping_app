import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/screens/message_screen.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({super.key});

  final List<Product> products = [
    Product(id: '1', name: 'Bag', price: 500, image: 'assets/bag.jpg'),
    Product(id: '2', name: 'Shoes', price: 1000, image: 'assets/shoes.jpg'),
    Product(id: '3', name: 'Watch', price: 5000, image: 'assets/watch.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => CartScreen()),
                  );
                },
                icon: Icon(Icons.shopping_cart),
              ),

              if (cart.itemCount > 0)
                Positioned(
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      '${cart.itemCount}',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),

          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MessageScreen()),
              );
            },
            icon: Icon(Icons.message_outlined),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              leading: Image.asset(product.image, width: 100),
              title: Text(product.name),
              subtitle: Text('₱${product.price.toStringAsFixed(2)}'),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  //side: BorderSide(color: Colors.deepPurpleAccent),
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  cart.addToCart(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product.name} added to cart')),
                  );
                },

                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [Icon(Icons.shopping_cart), Text('Add')],
                // ),
                child: Text('Add'),
              ),
            ),
          );
        },
      ),
    );
  }
}
